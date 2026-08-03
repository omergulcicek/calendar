-- Gemini/cron sync altyapısını kaldır; events maç kayıtlarına dokunma.

DROP FUNCTION IF EXISTS public.append_match_sync_logs(text, jsonb);
DROP FUNCTION IF EXISTS public.apply_match_schedule(text, uuid, timestamptz);
DROP FUNCTION IF EXISTS public.apply_match_result(text, uuid, text, text);

DROP TABLE IF EXISTS public.match_sync_logs;

DROP TABLE IF EXISTS private.app_secrets;
DROP SCHEMA IF EXISTS private CASCADE;
