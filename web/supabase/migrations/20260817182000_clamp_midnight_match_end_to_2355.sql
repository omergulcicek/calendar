-- Timed maçlarda TR 00:00 bitişi kickoff günü 23:55'e çek (ICS ertesi güne sarkmasın).

UPDATE public.events
SET end_date = end_date - interval '5 minutes'
WHERE is_all_day = false
  AND end_date IS NOT NULL
  AND (end_date AT TIME ZONE 'Europe/Istanbul')::time = time '00:00:00';
