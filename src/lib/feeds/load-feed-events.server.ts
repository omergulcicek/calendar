import { resolveCategorySlug } from "@/lib/feeds/category-slugs";
import { getSupabaseServerClient } from "@/lib/supabase/server";

import type { CategoryRow } from "@/features/calendar/api/categories";
import { fetchPublishedEventRows } from "@/features/calendar/api/fetch-published-events.server";
import type { CalendarEvent } from "@/features/calendar/components/MonthCalendar";
import { expandEvent } from "@/features/calendar/helpers/expand-events";

export async function fetchCategoryRows(): Promise<CategoryRow[]> {
  const supabase = getSupabaseServerClient();
  const { data, error } = await supabase
    .from("categories")
    .select("id, slug, name, desc")
    .order("name", { ascending: true });

  if (error) {
    throw new Error(error.message);
  }

  return data;
}

export async function resolveFeedSlugs(
  slugs: string[],
): Promise<{ slugs: string[]; invalid: string[] }> {
  const categories = await fetchCategoryRows();
  const known = new Set(categories.map((category) => category.slug));
  const resolved = slugs.map((slug) => resolveCategorySlug(slug));
  const invalid = resolved.filter((slug) => !known.has(slug));
  const valid = resolved.filter((slug) => known.has(slug));

  return { slugs: valid, invalid };
}

export async function loadFeedEvents(
  categorySlugs: string[] | "all",
): Promise<{ events: CalendarEvent[]; calName: string }> {
  const categories = await fetchCategoryRows();
  const slugSet =
    categorySlugs === "all"
      ? null
      : new Set(
          categorySlugs.length > 0 ? categorySlugs : categories.map((category) => category.slug),
        );

  const rows = await fetchPublishedEventRows();
  const filteredRows =
    slugSet == null
      ? rows
      : rows.filter((row) => {
          if (!row.categories) return false;
          return row.categories.some((c) => {
            const cat = Array.isArray(c.category) ? c.category[0] : c.category;
            return cat?.slug != null && slugSet.has(cat.slug);
          });
        });

  const events = filteredRows
    .flatMap(expandEvent)
    .sort((a, b) => a.start.getTime() - b.start.getTime());

  const calName = (() => {
    if (categorySlugs === "all" || slugSet == null) {
      return "Takvim";
    }
    if (categorySlugs.length === 1) {
      return categories.find((category) => category.slug === categorySlugs[0])?.name ?? "Takvim";
    }
    return "Takvim";
  })();

  return { events, calName };
}
