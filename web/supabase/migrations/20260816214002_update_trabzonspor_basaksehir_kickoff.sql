-- Trabzonspor - Başakşehir kickoff: 23.08 12:00 placeholder → 23.08 19:00 (TFF)

UPDATE public.events
SET
  start_date = ('2026-08-23 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-23 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Trabzonspor - Başakşehir'
  AND start_date = ('2026-08-23 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
