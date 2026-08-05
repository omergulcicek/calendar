-- Yarı final: Fransa 0 - 2 İspanya (2026-07-14)

UPDATE public.events
SET
  title = E'🇫🇷 Fransa 0 - 2 İspanya 🇪🇸',
  description = NULLIF(E'Mikel Oyarzabal 22'' (Penaltı)
Pedro Porro 58''', ''),
  end_date = start_date + interval '2 hours 30 minutes',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');
