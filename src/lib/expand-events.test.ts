import { describe, expect, it } from 'vitest'

import { expandEvent } from '@/lib/expand-events'
import type { EventRow } from '@/lib/queries/events'

function personalityRow(overrides: Partial<EventRow> = {}): EventRow {
  return {
    id: 'person-1',
    title: 'Örnek: Doğum Yıl Dönümü',
    description: null,
    location: null,
    source_url: null,
    start_date: '1944-08-03T21:00:00.000Z',
    end_date: '1944-08-04T20:59:59.000Z',
    occurrence_date: null,
    is_all_day: true,
    recurrence: 'yearly',
    calendar_system: 'gregorian',
    hijri_month: null,
    hijri_day: null,
    hijri_end_month: null,
    hijri_end_day: null,
    hijri_rule: null,
    gregorian_dates: null,
    categories: [
      {
        category: {
          slug: 'onemli-sahsiyetler',
          name: 'Önemli Şahsiyetler',
          desc: null,
        },
      },
    ],
    subject: null,
    ...overrides,
  }
}

describe('expandEvent gregorian yearly', () => {
  it('shifts displayStart/displayEnd to each occurrence year', () => {
    const occurrences = expandEvent(personalityRow())
    const year = new Date().getFullYear()
    const occurrence = occurrences.find((event) => event.id === `person-1-${year}`)

    expect(occurrence).toBeTruthy()
    expect(occurrence!.start.getFullYear()).toBe(year)
    expect(occurrence!.start.getMonth()).toBe(7)
    expect(occurrence!.start.getDate()).toBe(4)
    expect(occurrence!.displayStart?.getFullYear()).toBe(year)
    expect(occurrence!.displayEnd?.getFullYear()).toBe(year)
  })
})
