-- Fenerbahçe - Konyaspor kickoff: 23.08 12:00 placeholder → 22.08 21:30 (TFF)

UPDATE public.events
SET
  start_date = ('2026-08-22 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-22 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Fenerbahçe - Konyaspor'
  AND start_date = ('2026-08-23 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
