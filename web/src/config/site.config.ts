import type { SiteConfig } from "@/types/site-config.types";
import { env } from "@/env";

import { getSiteUrl } from "@/lib/site-url";

const siteUrl = getSiteUrl();

export const siteConfig: SiteConfig = {
  name: env.VITE_APP_NAME,
  description:
    "Kategori bazlı takvim aboneliği. Seç, abone ol — etkinlikler Apple, Google veya Outlook takviminde otomatik güncellenir.",
  url: siteUrl,
  ogImage: `${siteUrl}/og.png`,
  links: {
    github: "https://github.com/omergulcicek/takvim",
    twitter: "https://omergulcicek.com/",
  },
};
