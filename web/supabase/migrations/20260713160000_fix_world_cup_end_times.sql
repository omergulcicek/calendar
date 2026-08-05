-- Dünya Kupası maç bitiş saatlerini gol verisine göre düzelt.
-- Normal: +2h30m | Uzatma (92'+, 100'+): +3h15m | Eleme beraberlik (penaltı): +3h30m | Oynanmamış eleme: +3h

UPDATE public.events e
SET end_date = e.start_date + CASE
  WHEN e.title !~ '[0-9] - [0-9]' THEN interval '3 hours'
  WHEN e.description ~ '(^|[\n, ])(9[2-9]|1[0-2][0-9])(\+[0-9]+)?''' THEN interval '3 hours 15 minutes'
  WHEN e.title ~ '[0-9]+ - [0-9]+'
    AND (regexp_match(e.title, '([0-9]+) - ([0-9]+)'))[1] = (regexp_match(e.title, '([0-9]+) - ([0-9]+)'))[2]
    AND e.start_date AT TIME ZONE 'Europe/Istanbul' >= '2026-06-28' THEN interval '3 hours 30 minutes'
  ELSE interval '2 hours 30 minutes'
END
FROM public.categories c
WHERE e.category_id = c.id
  AND c.slug = 'dunya-kupasi';
