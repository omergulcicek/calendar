import { useEffect, useMemo, useState } from 'react'
import { format, startOfDay } from 'date-fns'
import { tr } from 'date-fns/locale'
import { Search } from 'lucide-react'
import { useHotkeys } from 'react-hotkeys-hook'

import type { CalendarEvent } from '@/components/month-calendar'
import { Button } from '@/components/ui/button'
import {
  Command,
  CommandDialog,
  CommandEmpty,
  CommandInput,
  CommandItem,
  CommandList,
} from '@/components/ui/command'
import { Input } from '@/components/ui/input'
import {
  Popover,
  PopoverAnchor,
  PopoverContent,
} from '@/components/ui/popover'
import { getCategoryColor } from '@/lib/categories'
import { searchCalendarEvents } from '@/lib/search-calendar-events'
import { cn } from '@/lib/utils'

function formatEventDate(event: CalendarEvent): string {
  const dateStart = event.displayStart ?? event.start
  const dateEnd = event.displayEnd ?? event.end
  const isMultiDay =
    startOfDay(dateStart).getTime() !== startOfDay(dateEnd).getTime()

  if (isMultiDay) {
    return `${format(dateStart, 'd MMM yyyy', { locale: tr })} – ${format(dateEnd, 'd MMM yyyy', { locale: tr })}`
  }

  if (event.allDay) {
    return format(event.start, 'd MMM yyyy', { locale: tr })
  }

  return `${format(event.start, 'd MMM yyyy', { locale: tr })} ${format(event.start, 'HH:mm')}`
}

function SearchResultItem({
  event,
  onSelect,
}: {
  event: CalendarEvent
  onSelect: (event: CalendarEvent) => void
}) {
  const firstCategory = event.categories[0]
  const color = getCategoryColor(firstCategory?.slug)
  const secondary = event.description ?? event.categories.map(c => c.name).join(', ')

  return (
    <CommandItem
      value={event.id}
      onSelect={() => onSelect(event)}
      className="items-start gap-3 py-3"
    >
      <span
        className={cn('mt-1 size-2 shrink-0 rounded-full', color.dot)}
        aria-hidden
      />
      <div className="min-w-0 flex-1">
        <p className="text-xs tabular-nums text-muted-foreground">
          {formatEventDate(event)}
        </p>
        <p className="mt-0.5 text-sm font-medium leading-snug">{event.title}</p>
        {secondary ? (
          <p className="mt-0.5 line-clamp-2 text-xs leading-relaxed text-muted-foreground">
            {secondary}
          </p>
        ) : null}
      </div>
    </CommandItem>
  )
}

function useSearchResults(events: CalendarEvent[], query: string) {
  return useMemo(() => searchCalendarEvents(events, query), [events, query])
}

function SearchResultList({
  events,
  query,
  onSelect,
  emptyMessage,
}: {
  events: CalendarEvent[]
  query: string
  onSelect: (event: CalendarEvent) => void
  emptyMessage: string
}) {
  const results = useSearchResults(events, query)
  const trimmed = query.trim()

  if (!trimmed || results.length === 0) {
    return <CommandEmpty>{emptyMessage}</CommandEmpty>
  }

  return results.map((event) => (
    <SearchResultItem key={event.id} event={event} onSelect={onSelect} />
  ))
}

export function CalendarEventSearch({
  events,
  onSelect,
}: {
  events: CalendarEvent[]
  onSelect: (event: CalendarEvent) => void
}) {
  const [desktopOpen, setDesktopOpen] = useState(false)
  const [dialogOpen, setDialogOpen] = useState(false)
  const [query, setQuery] = useState('')
  const dialogResults = useSearchResults(events, query)

  useHotkeys(
    'mod+k',
    (event) => {
      event.preventDefault()
      setQuery('')
      setDialogOpen(true)
    },
    { enableOnFormTags: true },
  )

  useEffect(() => {
    if (!desktopOpen) return
    function handlePointerDown(event: MouseEvent) {
      const target = event.target
      if (!(target instanceof Element)) return
      if (target.closest('[data-slot="popover-content"]')) return
      if (target.closest('[data-slot="calendar-search-input"]')) return
      setDesktopOpen(false)
    }
    document.addEventListener('mousedown', handlePointerDown)
    return () => document.removeEventListener('mousedown', handlePointerDown)
  }, [desktopOpen])

  function handleSelect(event: CalendarEvent) {
    setDesktopOpen(false)
    setDialogOpen(false)
    setQuery('')
    onSelect(event)
  }

  function openDialog() {
    setQuery('')
    setDialogOpen(true)
  }

  const emptyMessage = !query.trim()
    ? 'Etkinlik adı veya açıklama yazın.'
    : 'Sonuç bulunamadı.'

  return (
    <>
      <div className="hidden md:block">
        <Popover open={desktopOpen} onOpenChange={setDesktopOpen}>
          <PopoverAnchor asChild>
            <div className="relative w-44 lg:w-52" data-slot="calendar-search-input">
              <Search
                className="pointer-events-none absolute top-1/2 left-2.5 size-4 -translate-y-1/2 text-muted-foreground"
                aria-hidden
              />
              <Input
                value={query}
                onChange={(event) => {
                  setQuery(event.target.value)
                  setDesktopOpen(true)
                }}
                onFocus={() => setDesktopOpen(true)}
                onKeyDown={(event) => {
                  if (event.key === 'Escape') {
                    setDesktopOpen(false)
                    event.currentTarget.blur()
                  }
                }}
                placeholder="Etkinlik ara..."
                className="h-8 pl-8 text-xs"
                aria-label="Etkinlik ara"
                aria-expanded={desktopOpen}
                aria-controls="calendar-search-results"
                role="combobox"
                autoComplete="off"
              />
            </div>
          </PopoverAnchor>
          <PopoverContent
            id="calendar-search-results"
            align="start"
            sideOffset={6}
            collisionPadding={16}
            className="w-[min(24rem,calc(100vw-2rem))] p-0"
            onOpenAutoFocus={(event) => event.preventDefault()}
          >
            <Command shouldFilter={false}>
              <div className="hidden">
                <CommandInput
                  value={query}
                  onValueChange={setQuery}
                  tabIndex={-1}
                />
              </div>
              <CommandList className="max-h-80 overflow-y-auto overscroll-contain">
                <SearchResultList
                  events={events}
                  query={query}
                  onSelect={handleSelect}
                  emptyMessage={emptyMessage}
                />
              </CommandList>
            </Command>
          </PopoverContent>
        </Popover>
      </div>

      <Button
        type="button"
        variant="outline"
        size="icon"
        className="size-8 shrink-0 md:hidden"
        aria-label="Etkinlik ara"
        onClick={openDialog}
      >
        <Search size={14} />
      </Button>

      <CommandDialog open={dialogOpen} onOpenChange={setDialogOpen}>
        <CommandInput
          placeholder="Etkinlik ara..."
          value={query}
          onValueChange={setQuery}
        />
        <CommandList className="max-h-[min(24rem,calc(100vh-10rem))] overflow-y-auto overscroll-contain">
          {(dialogResults.length === 0 || !query.trim()) && (
            <CommandEmpty>{emptyMessage}</CommandEmpty>
          )}
          {dialogResults.map((event) => (
            <SearchResultItem
              key={event.id}
              event={event}
              onSelect={handleSelect}
            />
          ))}
        </CommandList>
      </CommandDialog>
    </>
  )
}
