// Kategori renkleri proje localinde sabitlenir. DB'ye yeni bir kategori
// eklendiğinde, slug'ını buraya bir renk anahtarıyla eşleyin. Eşleşme yoksa
// `default` (nötr) renk kullanılır.

export type CategoryColorKey =
  | "yellow500"
  | "teal600"
  | "red600"
  | "indigo600"
  | "stone700"
  | "blue600"
  | "lime500"
  | "purple600"
  | "black"
  | "amber500"
  | "rose800"
  | "orange500"
  | "violet800";

export type CategoryColorStyle = {
  // Aylık görünümdeki event "chip"i (yumuşak renkli arka plan)
  chip: string;
  // Renkli nokta / işaret
  dot: string;
};

// Tailwind sınıfları statik string olarak yazılır ki purge sırasında atılmasın.
export const COLOR_STYLES: Record<CategoryColorKey | "default", CategoryColorStyle> = {
  yellow500: {
    chip: "bg-yellow-100 text-yellow-900 dark:bg-yellow-500/15 dark:text-yellow-300",
    dot: "bg-yellow-500",
  },
  teal600: {
    chip: "bg-teal-100 text-teal-900 dark:bg-teal-600/15 dark:text-teal-300",
    dot: "bg-teal-600",
  },
  red600: {
    chip: "bg-red-100 text-red-900 dark:bg-red-600/15 dark:text-red-300",
    dot: "bg-red-600",
  },
  indigo600: {
    chip: "bg-indigo-100 text-indigo-900 dark:bg-indigo-600/15 dark:text-indigo-300",
    dot: "bg-indigo-600",
  },
  stone700: {
    chip: "bg-stone-200 text-stone-900 dark:bg-stone-500/20 dark:text-stone-300",
    dot: "bg-stone-700 dark:bg-stone-400",
  },
  blue600: {
    chip: "bg-blue-100 text-blue-900 dark:bg-blue-600/20 dark:text-blue-200",
    dot: "bg-blue-600",
  },
  lime500: {
    chip: "bg-lime-100 text-lime-900 dark:bg-lime-500/15 dark:text-lime-300",
    dot: "bg-lime-500",
  },
  purple600: {
    chip: "bg-purple-100 text-purple-900 dark:bg-purple-600/15 dark:text-purple-300",
    dot: "bg-purple-600",
  },
  black: {
    chip: "bg-neutral-200 text-neutral-950 dark:bg-neutral-500/25 dark:text-neutral-100",
    dot: "bg-neutral-950 dark:bg-neutral-100",
  },
  amber500: {
    chip: "bg-amber-100 text-amber-950 dark:bg-amber-500/15 dark:text-amber-300",
    dot: "bg-amber-500",
  },
  rose800: {
    chip: "bg-rose-100 text-rose-950 dark:bg-rose-800/20 dark:text-rose-300",
    dot: "bg-rose-800",
  },
  orange500: {
    chip: "bg-orange-100 text-orange-900 dark:bg-orange-500/15 dark:text-orange-300",
    dot: "bg-orange-500",
  },
  violet800: {
    chip: "bg-violet-100 text-violet-950 dark:bg-violet-800/20 dark:text-violet-300",
    dot: "bg-violet-800",
  },
  default: {
    chip: "bg-muted text-foreground/80",
    dot: "bg-muted-foreground",
  },
};

// DB'deki kategori slug'ı -> renk anahtarı. Yeni kategoriler buraya eklenir.
export const CATEGORY_COLOR_MAP: Record<string, CategoryColorKey> = {
  "dini-gunler": "yellow500",
  "islam-tarihi": "teal600",
  "milli-ve-kulturel-gunler": "red600",
  "onemli-sahsiyetler": "indigo600",
  "tarihi-olaylar": "stone700",
  "turk-edebiyati": "blue600",
  "dunya-kupasi": "lime500",
  "sampiyonlar-ligi": "lime500",
  "premier-lig": "lime500",
  "la-liga": "lime500",
  besiktas: "lime500",
  fenerbahce: "lime500",
  galatasaray: "lime500",
  trabzonspor: "lime500",
};

export function getCategoryColor(slug: string | null | undefined): CategoryColorStyle {
  if (slug && CATEGORY_COLOR_MAP[slug]) {
    return COLOR_STYLES[CATEGORY_COLOR_MAP[slug]];
  }
  return COLOR_STYLES.default;
}
