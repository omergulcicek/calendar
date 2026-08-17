-- Galatasaray - Çorum FK kickoff: 12:00 placeholder → 21:30 (TFF / beIN)

UPDATE public.events
SET
  start_date = ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Çorum FK'
  AND start_date = ('2026-08-14 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul');
