-- Üçüncülük maçı ve final (2026-07-19)

INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT cat.id, v.title, NULL,
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul'),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '3 hours',
  false, 'published', 'none', NULL
FROM public.categories cat
CROSS JOIN (VALUES
  (E'🇫🇷 Fransa - İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿', E'2026-07-19 00:00:00'),
  (E'🇪🇸 İspanya - Arjantin 🇦🇷', E'2026-07-19 22:00:00')
) AS v(title, local_start)
WHERE cat.slug = 'dunya-kupasi'
  AND NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.category_id = cat.id
      AND e.title = v.title
  );
