-- Yarı final: İngiltere 1 - 2 Arjantin (2026-07-15)

UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 1 - 2 Arjantin 🇦🇷',
  description = NULLIF(E'Anthony Gordon 55''

Enzo Fernández 85''
Lautaro Martínez 90+2''', ''),
  end_date = start_date + interval '2 hours 30 minutes',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');
