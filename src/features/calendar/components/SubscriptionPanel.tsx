import { useMemo, useState } from "react";

import { Check, Copy, ExternalLink } from "lucide-react";
import { AnimatePresence, motion } from "framer-motion";

import { resolveSubscribeFeedUrl } from "@/lib/feeds/urls";
import { toWebcalUrl } from "@/lib/site-url";
import { cn } from "@/lib/utils";

import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Label } from "@/components/ui/label";
import type { CategoryRow } from "@/features/calendar/api/categories";
import {
  SECTION_DESC_CLASS,
  SECTION_HEADING_CLASS,
  SECTION_NARROW_CLASS,
  SECTION_SCROLL_CLASS,
  SITE_SECTIONS,
} from "@/features/calendar/data/site-nav";
import { getCategoryColor } from "@/features/calendar/helpers/categories";
import { groupCategoriesForSelect } from "@/features/calendar/helpers/category-groups";

type SubscriptionPanelProps = {
  categories: CategoryRow[];
};

type GroupableCategory = CategoryRow & { key: string };

export function SubscriptionPanel({ categories }: SubscriptionPanelProps) {
  const allSlugs = useMemo(() => categories.map((category) => category.slug), [categories]);
  const [selectedSlugs, setSelectedSlugs] = useState<Set<string>>(() => new Set(allSlugs));
  const [copied, setCopied] = useState(false);

  const { groups: categoryGroups, ungrouped: ungroupedCategories } = useMemo(
    () =>
      groupCategoriesForSelect(
        categories.map((category): GroupableCategory => ({
          ...category,
          key: category.slug,
        })),
      ),
    [categories],
  );

  const selectedList = useMemo(
    () => allSlugs.filter((slug) => selectedSlugs.has(slug)),
    [allSlugs, selectedSlugs],
  );

  const feedUrl = useMemo(
    () => resolveSubscribeFeedUrl(selectedList, allSlugs),
    [selectedList, allSlugs],
  );

  const selectedNames = useMemo(
    () =>
      categories
        .filter((category) => selectedSlugs.has(category.slug))
        .map((category) => category.name),
    [categories, selectedSlugs],
  );

  function toggleSlug(slug: string, checked: boolean) {
    setSelectedSlugs((prev) => {
      const next = new Set(prev);
      if (checked) {
        next.add(slug);
      } else {
        next.delete(slug);
      }
      return next;
    });
    setCopied(false);
  }

  function selectAll() {
    setSelectedSlugs(new Set(allSlugs));
    setCopied(false);
  }

  function clearAll() {
    setSelectedSlugs(new Set());
    setCopied(false);
  }

  async function copyFeedUrl() {
    if (!feedUrl) return;
    await navigator.clipboard.writeText(feedUrl);
    setCopied(true);
  }

  function subscribeWithWebcal() {
    if (!feedUrl) return;
    window.location.href = toWebcalUrl(feedUrl);
    void copyFeedUrl();
  }

  function renderCategoryCheckbox(category: GroupableCategory) {
    const color = getCategoryColor(category.slug);
    const checked = selectedSlugs.has(category.slug);
    const id = `subscribe-${category.slug}`;

    return (
      <Label
        key={category.slug}
        htmlFor={id}
        className={cn(
          "flex min-h-11 cursor-pointer items-start gap-3 rounded-lg px-3 py-2.5",
          "transition-colors duration-150 ease-out-strong",
          "hover:bg-accent/80",
          checked && "bg-accent/40",
        )}
      >
        <Checkbox
          id={id}
          checked={checked}
          onCheckedChange={(value) => toggleSlug(category.slug, value === true)}
          className="mt-0.5"
        />
        <span className={cn("mt-1.5 size-2.5 shrink-0 rounded-full", color.dot)} aria-hidden />
        <span className="min-w-0 flex-1">
          <span className="block text-sm font-medium">{category.name}</span>
          {category.desc && (
            <span className="mt-0.5 block text-xs font-normal text-pretty text-muted-foreground">
              {category.desc}
            </span>
          )}
        </span>
      </Label>
    );
  }

  return (
    <section id={SITE_SECTIONS.abonelik} className={cn(SECTION_SCROLL_CLASS, SECTION_NARROW_CLASS)}>
      <div className="flex flex-col gap-1.5">
        <h2 className={cn(SECTION_HEADING_CLASS, "text-balance")}>Takvim Aboneliği</h2>
        <p className={cn(SECTION_DESC_CLASS, "text-pretty")}>
          Kategorileri seçin, abonelik URL’sini kopyalayın ve takvim uygulamanıza ekleyin. Abonelik,
          dosya indirmekten farklıdır — etkinlikler otomatik güncellenir.
        </p>
        <p className={cn(SECTION_DESC_CLASS, "text-pretty")}>
          Takvimlerin uygulamanızda ayrı ayrı renklerle görünmesini istiyorsanız her kategoriye tek
          tek abone olun. Hepsini tek seferde eklerseniz tek bir takvim oluşur ve tüm etkinlikler
          aynı renkte görünür.
        </p>
      </div>

      <div className="mt-5 flex flex-wrap gap-2">
        <Button type="button" variant="outline" size="sm" onClick={selectAll}>
          Hepsi
        </Button>
        <Button type="button" variant="outline" size="sm" onClick={clearAll}>
          Temizle
        </Button>
      </div>

      <div
        id={SITE_SECTIONS.kategoriler}
        className={cn(
          "mt-5 flex flex-col gap-5 rounded-xl bg-card p-2 shadow-surface",
          SECTION_SCROLL_CLASS,
        )}
      >
        {categoryGroups.map((group) => (
          <div key={group.label} className="flex flex-col gap-1">
            <h3 className="px-3 text-xs font-medium tracking-wide text-muted-foreground uppercase">
              {group.label}
            </h3>
            <div className="grid gap-0.5 sm:grid-cols-2">
              {group.categories.map(renderCategoryCheckbox)}
            </div>
          </div>
        ))}
        {ungroupedCategories.length > 0 ? (
          <div className="flex flex-col gap-1">
            <h3 className="px-3 text-xs font-medium tracking-wide text-muted-foreground uppercase">
              Diğer
            </h3>
            <div className="grid gap-0.5 sm:grid-cols-2">
              {ungroupedCategories.map(renderCategoryCheckbox)}
            </div>
          </div>
        ) : null}
      </div>

      {/* outer 12 + pad 16 ≈ feed panel uses rounded-lg inside */}
      <div className="mt-5 rounded-xl bg-muted/40 p-4 shadow-surface">
        <p className="text-sm font-medium">Abonelik URL’si</p>
        {selectedList.length === 0 ? (
          <p className="mt-2 text-sm text-pretty text-muted-foreground">
            En az bir kategori seçin.
          </p>
        ) : (
          <>
            <p className="mt-2 rounded-lg bg-background/80 px-3 py-2 font-mono text-xs break-all tabular-nums sm:text-sm">
              {feedUrl}
            </p>
            <p className="mt-2 text-xs text-pretty text-muted-foreground">
              Seçili: {selectedNames.join(", ")}
            </p>
            <div className="mt-3 flex flex-wrap gap-2">
              <Button type="button" size="sm" onClick={() => void copyFeedUrl()}>
                <span className="relative size-4">
                  <AnimatePresence initial={false} mode="wait">
                    <motion.span
                      key={copied ? "check" : "copy"}
                      className="absolute inset-0 flex items-center justify-center"
                      initial={{ opacity: 0, scale: 0.25, filter: "blur(4px)" }}
                      animate={{ opacity: 1, scale: 1, filter: "blur(0px)" }}
                      exit={{ opacity: 0, scale: 0.25, filter: "blur(4px)" }}
                      transition={{ type: "spring", duration: 0.3, bounce: 0 }}
                    >
                      {copied ? (
                        <Check className="size-4" strokeWidth={2} />
                      ) : (
                        <Copy className="size-4" strokeWidth={2} />
                      )}
                    </motion.span>
                  </AnimatePresence>
                </span>
                {copied ? "Kopyalandı" : "URL’yi kopyala"}
              </Button>
              <Button type="button" size="sm" variant="secondary" onClick={subscribeWithWebcal}>
                <ExternalLink className="size-4" strokeWidth={2} />
                Abone ol
              </Button>
            </div>
          </>
        )}
      </div>
    </section>
  );
}
