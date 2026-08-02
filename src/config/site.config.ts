import type { SiteConfig } from "@/types/site-config.types";
import { env } from "@/env";

export const siteConfig: SiteConfig = {
  name: env.VITE_APP_NAME,
  description:
    "Kategori bazlı takvim aboneliği. Seç, abone ol — etkinlikler Apple, Google veya Outlook takviminde otomatik güncellenir.",
  url: env.VITE_APP_URL,
  ogImage: `${env.VITE_APP_URL}/og.png`,
  links: {
    github: "https://github.com/omergulcicek/takvim",
    twitter: "https://omergulcicek.com/",
  },
};
