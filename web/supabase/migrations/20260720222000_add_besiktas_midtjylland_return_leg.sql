-- Beşiktaş - FC Midtjylland Avrupa Ligi ikinci eleme turu rövanşı.

INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT
  cat.id,
  'FC Midtjylland - Beşiktaş',
  'Avrupa Ligi ikinci eleme turu rövanş maçı',
  ('2026-07-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  ('2026-07-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false,
  'published',
  'none',
  NULL
FROM public.categories cat
WHERE cat.slug = 'besiktas'
  AND NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.category_id = cat.id
      AND e.title = 'FC Midtjylland - Beşiktaş'
      AND e.start_date = ('2026-07-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  );
