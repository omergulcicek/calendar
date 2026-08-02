import { Button } from "@/components/ui/button";
import { RevealGroup, RevealItem } from "@/features/calendar/components/Reveal";
import {
  scrollToNavTarget,
  SITE_DESCRIPTION,
  SITE_SECTIONS,
  SITE_SUBDESCRIPTION,
} from "@/features/calendar/data/site-nav";

export function CalendarHero() {
  return (
    <RevealGroup mode="mount" className="mx-auto max-w-xl text-center">
      <RevealItem>
        <h1 className="text-3xl font-black tracking-tight text-balance sm:text-4xl">TAKVİM</h1>
      </RevealItem>
      <RevealItem>
        <p className="mt-3 text-sm text-pretty text-muted-foreground sm:text-base">
          {SITE_DESCRIPTION} {SITE_SUBDESCRIPTION}
        </p>
      </RevealItem>
      <RevealItem>
        <div className="mt-5 flex flex-wrap items-center justify-center gap-2">
          <Button size="sm" onClick={() => scrollToNavTarget(SITE_SECTIONS.abonelik)}>
            Abone Ol
          </Button>
          <Button
            size="sm"
            variant="outline"
            onClick={() => scrollToNavTarget(SITE_SECTIONS.nasilEkle)}
          >
            Nasıl eklerim?
          </Button>
        </div>
      </RevealItem>
    </RevealGroup>
  );
}
