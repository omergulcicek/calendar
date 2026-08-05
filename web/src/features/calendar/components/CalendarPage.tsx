import { useEffect, useMemo, useState } from "react";
import { useSuspenseQuery } from "@tanstack/react-query";

import { categoriesQueryOptions } from "@/features/calendar/api/categories";
import { eventsQueryOptions } from "@/features/calendar/api/events";
import { CalendarHero } from "@/features/calendar/components/CalendarHero";
import { EventDetailDialog } from "@/features/calendar/components/EventDetailDialog";
import { FaqSection } from "@/features/calendar/components/FaqSection";
import { HowToSubscribeSection } from "@/features/calendar/components/HowToSubscribeSection";
import { MonthCalendar } from "@/features/calendar/components/MonthCalendar";
import type { CalendarCategory, CalendarEvent } from "@/features/calendar/components/MonthCalendar";
import { Reveal } from "@/features/calendar/components/Reveal";
import { SubscriptionPanel } from "@/features/calendar/components/SubscriptionPanel";
import { SECTION_SCROLL_CLASS, SITE_SECTIONS } from "@/features/calendar/data/site-nav";
import { expandEvent } from "@/features/calendar/helpers/expand-events";

const NO_CATEGORY_KEY = "__none__";

export function CalendarPage() {
  const { data: rows } = useSuspenseQuery(eventsQueryOptions);
  const { data: categoryRows } = useSuspenseQuery(categoriesQueryOptions);
  const [mounted, setMounted] = useState(false);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [selectedEvent, setSelectedEvent] = useState<CalendarEvent | null>(null);

  function handleEventClick(event: CalendarEvent) {
    setSelectedEvent(event);
    setDialogOpen(true);
  }

  useEffect(() => {
    setMounted(true);
  }, []);

  const events = useMemo<CalendarEvent[]>(() => rows.flatMap(expandEvent), [rows]);

  const categories = useMemo<CalendarCategory[]>(() => {
    const fromDb: CalendarCategory[] = categoryRows.map((category) => ({
      key: category.slug,
      name: category.name,
      slug: category.slug,
      desc: category.desc,
    }));

    const hasUncategorized = events.some((event) => event.categories.length === 0);
    if (!hasUncategorized) {
      return fromDb;
    }

    return [
      ...fromDb,
      {
        key: NO_CATEGORY_KEY,
        name: "Kategorisiz",
        slug: null,
        desc: null,
      },
    ];
  }, [categoryRows, events]);

  return (
    <main className="mx-auto w-full max-w-7xl min-w-0 space-y-20 px-4 pt-6 pb-8 sm:space-y-28 sm:pt-8 md:space-y-32">
      <section id={SITE_SECTIONS.takvim} className={SECTION_SCROLL_CLASS}>
        <div className="py-8 sm:py-10">
          <CalendarHero />
        </div>

        <div className="mt-12 sm:mt-16 md:mt-20">
          {mounted ? (
            <MonthCalendar
              events={events}
              categories={categories}
              onEventClick={handleEventClick}
            />
          ) : (
            <div className="h-[640px] animate-pulse rounded-xl bg-muted" aria-hidden />
          )}
        </div>
      </section>

      <Reveal>
        <SubscriptionPanel categories={categoryRows} />
      </Reveal>

      <Reveal>
        <HowToSubscribeSection />
      </Reveal>

      <Reveal>
        <FaqSection />
      </Reveal>

      <EventDetailDialog open={dialogOpen} onOpenChange={setDialogOpen} event={selectedEvent} />
    </main>
  );
}
