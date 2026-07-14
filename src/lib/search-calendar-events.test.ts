import { describe, expect, it } from 'vitest'

import type { CalendarEvent } from '@/components/month-calendar'
import {
  getBaseEventId,
  searchCalendarEvents,
} from '@/lib/search-calendar-events'

function makeEvent(
  overrides: Partial<CalendarEvent> & Pick<CalendarEvent, 'id' | 'title' | 'start'>,
): CalendarEvent {
  return {
    end: overrides.start,
    categorySlug: 'dini-gunler',
    categoryName: 'Dini Günler',
    allDay: true,
    ...overrides,
  }
}

const TODAY = new Date('2026-07-13')

describe('getBaseEventId', () => {
  it('strips year suffix from recurring occurrence ids', () => {
    expect(getBaseEventId(makeEvent({
      id: 'abc-def-2026',
      title: 'Test',
      start: new Date('2026-06-01'),
    }))).toBe('abc-def')
  })

  it('keeps one-off event ids unchanged', () => {
    expect(getBaseEventId(makeEvent({
      id: 'abc-def',
      title: 'Test',
      start: new Date('2026-06-01'),
    }))).toBe('abc-def')
  })
})

describe('searchCalendarEvents', () => {
  const events: CalendarEvent[] = [
    makeEvent({
      id: 'mevlid-2026',
      title: 'Mevlid Kandili',
      description: 'Peygamberimizin doğum gecesi',
      start: new Date('2026-09-12'),
    }),
    makeEvent({
      id: 'mevlid-2027',
      title: 'Mevlid Kandili',
      description: 'Peygamberimizin doğum gecesi',
      start: new Date('2027-08-25'),
    }),
    makeEvent({
      id: 'cumhuriyet-2026',
      title: 'Cumhuriyet Bayramı',
      start: new Date('2026-10-29'),
    }),
  ]

  it('returns empty list for blank query', () => {
    expect(searchCalendarEvents(events, '', 8, TODAY)).toEqual([])
    expect(searchCalendarEvents(events, '   ', 8, TODAY)).toEqual([])
  })

  it('matches title and description case-insensitively in Turkish', () => {
    const results = searchCalendarEvents(events, 'mevlid', 8, TODAY)
    expect(results).toHaveLength(1)
    expect(results[0]?.title).toBe('Mevlid Kandili')
  })

  it('dedupes recurring events to the nearest upcoming occurrence', () => {
    const results = searchCalendarEvents(events, 'mevlid', 8, TODAY)
    expect(results[0]?.start).toEqual(new Date('2026-09-12'))
  })

  it('shows next year when this years occurrence is already past', () => {
    const juneOccurrences = [2024, 2025, 2026, 2027, 2028].map((year) =>
      makeEvent({
        id: `haziran-${year}`,
        title: 'Haziran Kutlaması',
        start: new Date(`${year}-06-01`),
      }),
    )

    const results = searchCalendarEvents(juneOccurrences, 'haziran', 8, TODAY)
    expect(results).toHaveLength(1)
    expect(results[0]?.start).toEqual(new Date('2027-06-01'))
  })

  it('shows this year when the occurrence is still upcoming', () => {
    const novemberOccurrences = [2026, 2027, 2028].map((year) =>
      makeEvent({
        id: `kasim-${year}`,
        title: 'Kasım Etkinliği',
        start: new Date(`${year}-11-01`),
      }),
    )

    const results = searchCalendarEvents(novemberOccurrences, 'kasım', 8, TODAY)
    expect(results).toHaveLength(1)
    expect(results[0]?.start).toEqual(new Date('2026-11-01'))
  })

  it('limits results', () => {
    const many = Array.from({ length: 60 }, (_, index) =>
      makeEvent({
        id: `event-${index}`,
        title: `Etkinlik ${index}`,
        start: new Date(`2026-01-${String((index % 28) + 1).padStart(2, '0')}`),
      }),
    )
    expect(searchCalendarEvents(many, 'etkinlik', 50, TODAY)).toHaveLength(50)
  })

  it('ranks title matches above description-only mentions', () => {
    const events = [
      makeEvent({
        id: 'kultur-2027',
        title: 'Nevruz Bayramı',
        description: "Türkiye'de kutlanan bir bayram",
        start: new Date('2027-03-21'),
      }),
      makeEvent({
        id: 'mac-1',
        title: '🇹🇷 Türkiye 3 - 2 ABD 🇺🇸',
        categoryName: 'Dünya Kupası',
        start: new Date('2026-06-26'),
      }),
      makeEvent({
        id: 'mac-2',
        title: '🇦🇺 Avustralya 2 - 0 Türkiye 🇹🇷',
        categoryName: 'Dünya Kupası',
        start: new Date('2026-06-14'),
      }),
    ]

    const results = searchCalendarEvents(events, 'türkiye', 50, TODAY)
    expect(results.length).toBeGreaterThanOrEqual(2)
    expect(results[0]?.title).toContain('Türkiye')
    expect(results[1]?.title).toContain('Türkiye')
    expect(results.some((event) => event.title === 'Nevruz Bayramı')).toBe(true)
  })
})
