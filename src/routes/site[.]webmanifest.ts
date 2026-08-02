import { createFileRoute } from "@tanstack/react-router";

import { siteConfig } from "@/config/site.config";

export const Route = createFileRoute("/site.webmanifest")({
  server: {
    handlers: {
      GET: async () => {
        const manifest = {
          name: siteConfig.name,
          short_name: siteConfig.name,
          description: siteConfig.description,
          start_url: "/",
          display: "standalone",
          background_color: "#ffffff",
          theme_color: "#ffffff",
          icons: [
            {
              src: "/favicon.svg",
              sizes: "any",
              type: "image/svg+xml",
              purpose: "any",
            },
            {
              src: "/apple-touch-icon.svg",
              sizes: "180x180",
              type: "image/svg+xml",
              purpose: "any maskable",
            },
          ],
        };

        return Response.json(manifest, {
          headers: { "Content-Type": "application/manifest+json; charset=utf-8" },
        });
      },
    },
  },
});
