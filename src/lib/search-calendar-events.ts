import { startOfDay } from 'date-fns'

import type { CalendarEvent } from '@/components/month-calendar'

const SEARCH_RESULT_LIMIT = 50

function normalizeForSearch(value: string): string {
  return value.toLocaleLowerCase('tr')
}

function searchableFields(event: CalendarEvent): string[] {
  return [event.title, event.description, event.categoryName, event.location]
    .filter((value): value is string => Boolean(value))
    .map(normalizeForSearch)
}

/** Başlık > konum > kategori > açıklama ağırlıklarıyla benzerlik puanı. */
export function scoreEvent(event: CalendarEvent, rawQuery: string): number {
  const query = normalizeForSearch(rawQuery.trim())
  if (!query) return 0

  const words = query.split(/\s+/).filter(Boolean)
  const fields = searchableFields(event)
  const combined = fields.join(' ')

  if (!words.every((word) => combined.includes(word))) return 0

  let score = 0

  for (const word of words) {
    const title = event.title ? normalizeForSearch(event.title) : ''
    const location = event.location ? normalizeForSearch(event.location) : ''
    const categoryName = event.categoryName
      ? normalizeForSearch(event.categoryName)
      : ''
    const description = event.description
      ? normalizeForSearch(event.description)
      : ''

    if (title.includes(word)) score += 100
    if (location.includes(word)) score += 50
    if (categoryName.includes(word)) score += 30
    if (description.includes(word)) score += 10
  }

  const title = event.title ? normalizeForSearch(event.title) : ''
  if (title.includes(query)) score += 200
  if (title === query) score += 500

  return score
}

function eventMatchesQuery(event: CalendarEvent, query: string): boolean {
  return scoreEvent(event, query) > 0
}

/** Yıllık tekrarlayan etkinlikler `rowId-2026` biçiminde id alır. */
export function getBaseEventId(event: CalendarEvent): string {
  const match = event.id.match(/^(.+)-(\d{4})$/)
  return match ? match[1]! : event.id
}

function occurrenceSortKey(start: Date, today: Date): number {
  const day = startOfDay(start).getTime()
  const todayMs = today.getTime()
  if (day >= todayMs) return day - todayMs
  return Number.MAX_SAFE_INTEGER - (todayMs - day)
}

export function pickNearestOccurrence(
  occurrences: CalendarEvent[],
  today = startOfDay(new Date()),
): CalendarEvent | null {
  if (occurrences.length === 0) return null

  return occurrences.reduce((best, candidate) => {
    const bestKey = occurrenceSortKey(best.start, today)
    const candidateKey = occurrenceSortKey(candidate.start, today)
    return candidateKey < bestKey ? candidate : best
  })
}

function compareSearchResults(
  a: CalendarEvent,
  b: CalendarEvent,
  query: string,
  today: Date,
): number {
  const scoreDiff = scoreEvent(b, query) - scoreEvent(a, query)
  if (scoreDiff !== 0) return scoreDiff
  return occurrenceSortKey(a.start, today) - occurrenceSortKey(b.start, today)
}

export function searchCalendarEvents(
  events: CalendarEvent[],
  rawQuery: string,
  limit = SEARCH_RESULT_LIMIT,
  today = startOfDay(new Date()),
): CalendarEvent[] {
  const query = normalizeForSearch(rawQuery.trim())
  if (!query) return []

  const matchesByBaseId = new Map<string, CalendarEvent[]>()

  for (const event of events) {
    if (!eventMatchesQuery(event, query)) continue

    const baseId = getBaseEventId(event)
    const group = matchesByBaseId.get(baseId)
    if (group) {
      group.push(event)
    } else {
      matchesByBaseId.set(baseId, [event])
    }
  }

  return Array.from(matchesByBaseId.values())
    .map((occurrences) => pickNearestOccurrence(occurrences, today)!)
    .sort((a, b) => compareSearchResults(a, b, rawQuery.trim(), today))
    .slice(0, limit)
}
