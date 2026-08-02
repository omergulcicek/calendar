-- Final: İspanya 1 - 0 Arjantin (uzatma, 2026-07-19)

UPDATE public.events
SET
  title = E'🇪🇸 İspanya 1 - 0 Arjantin 🇦🇷',
  description = NULLIF(E'Ferrán Torres 106''', ''),
  end_date = start_date + interval '3 hours 15 minutes',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');
