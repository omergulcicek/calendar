-- Üçüncülük: Fransa 4 - 6 İngiltere (2026-07-19)

UPDATE public.events
SET
  title = E'🇫🇷 Fransa 4 - 6 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿',
  description = NULLIF(E'Kylian Mbappé 48'', 66''
Bradley Barcola 54''
Ousmane Dembélé 90+6''

Declan Rice 3''
Ezri Konsa 18''
Bukayo Saka 37'', 45+1'', 87'' (Penaltı)
Jude Bellingham 90+8''', ''),
  end_date = start_date + interval '2 hours 30 minutes',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');
