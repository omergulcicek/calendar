import { z } from "zod";

/**
 * Type-safe environment variable schema.
 *
 * Client-exposed variables MUST be prefixed with `VITE_` (Vite inlines these
 * at build time). Server-only variables have no prefix and must never be
 * read via `import.meta.env` on the client.
 */
const serverSchema = z.object({
  NODE_ENV: z.enum(["development", "production", "test"]).default("development"),
  SUPABASE_URL: z.string().url(),
  SUPABASE_PUBLISHABLE_KEY: z.string().min(1),
});

const clientSchema = z.object({
  VITE_APP_URL: z.string().url().default("http://localhost:3000"),
  VITE_APP_NAME: z.string().min(1).default("Takvim Aboneliği"),
  VITE_SITE_URL: z.string().url().optional(),
  VITE_SUPABASE_URL: z.string().url(),
  VITE_SUPABASE_PUBLISHABLE_KEY: z.string().min(1),
});

function readEnv(key: string): string | undefined {
  if (typeof process !== "undefined" && process.env[key] != null) {
    return process.env[key];
  }
  return (import.meta.env as Record<string, string | undefined>)[key];
}

const isServer = typeof window === "undefined";

const clientParsed = clientSchema.safeParse({
  VITE_APP_URL: readEnv("VITE_APP_URL"),
  VITE_APP_NAME: readEnv("VITE_APP_NAME"),
  VITE_SITE_URL: readEnv("VITE_SITE_URL"),
  VITE_SUPABASE_URL: readEnv("VITE_SUPABASE_URL"),
  VITE_SUPABASE_PUBLISHABLE_KEY: readEnv("VITE_SUPABASE_PUBLISHABLE_KEY"),
});

if (!clientParsed.success) {
  console.error(
    "❌ Invalid client environment variables:",
    clientParsed.error.flatten().fieldErrors,
  );
  throw new Error("Invalid environment variables. Check src/env.ts");
}

const serverParsed = isServer
  ? serverSchema.safeParse({
      NODE_ENV: readEnv("NODE_ENV"),
      SUPABASE_URL: readEnv("SUPABASE_URL"),
      SUPABASE_PUBLISHABLE_KEY: readEnv("SUPABASE_PUBLISHABLE_KEY"),
    })
  : null;

if (serverParsed && !serverParsed.success) {
  console.error(
    "❌ Invalid server environment variables:",
    serverParsed.error.flatten().fieldErrors,
  );
  throw new Error("Invalid environment variables. Check src/env.ts");
}

export const env = {
  NODE_ENV:
    (readEnv("NODE_ENV") as "development" | "production" | "test" | undefined) ?? "development",
  ...clientParsed.data,
  SUPABASE_URL: serverParsed?.success ? serverParsed.data.SUPABASE_URL : "",
  SUPABASE_PUBLISHABLE_KEY: serverParsed?.success ? serverParsed.data.SUPABASE_PUBLISHABLE_KEY : "",
};
