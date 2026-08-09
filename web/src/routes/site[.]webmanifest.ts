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
              src: "/favicon-32x32.png",
              sizes: "32x32",
              type: "image/png",
              purpose: "any",
            },
            {
              src: "/apple-touch-icon.png",
              sizes: "180x180",
              type: "image/png",
              purpose: "any",
            },
            {
              src: "/icon-192.png",
              sizes: "192x192",
              type: "image/png",
              purpose: "any",
            },
            {
              src: "/icon-512.png",
              sizes: "512x512",
              type: "image/png",
              purpose: "any",
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
