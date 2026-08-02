import { createClient } from "@supabase/supabase-js";

import { env } from "@/env";

export function getSupabaseServerClient() {
  return createClient(env.SUPABASE_URL, env.SUPABASE_PUBLISHABLE_KEY, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}
