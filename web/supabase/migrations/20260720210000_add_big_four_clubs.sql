-- Dört büyük kulüp kategorileri ve Beşiktaş'ın ilk Avrupa Ligi maçı.

INSERT INTO public.categories (name, slug, "desc")
VALUES
  (
    'Beşiktaş',
    'besiktas',
    'Beşiktaş JK maçları; lig, kupa ve Avrupa müsabakaları.'
  ),
  (
    'Fenerbahçe',
    'fenerbahce',
    'Fenerbahçe SK maçları; lig, kupa ve Avrupa müsabakaları.'
  ),
  (
    'Galatasaray',
    'galatasaray',
    'Galatasaray SK maçları; lig, kupa ve Avrupa müsabakaları.'
  ),
  (
    'Trabzonspor',
    'trabzonspor',
    'Trabzonspor maçları; lig, kupa ve Avrupa müsabakaları.'
  )
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT
  cat.id,
  'Beşiktaş - FC Midtjylland',
  'Avrupa Ligi',
  ('2026-07-23 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  ('2026-07-23 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false,
  'published',
  'none',
  NULL
FROM public.categories cat
WHERE cat.slug = 'besiktas'
  AND NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.category_id = cat.id
      AND e.title = 'Beşiktaş - FC Midtjylland'
      AND e.start_date = ('2026-07-23 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  );
