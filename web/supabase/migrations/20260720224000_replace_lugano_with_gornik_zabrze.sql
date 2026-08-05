-- Lugano maçını kaldır; Górnik Zabrze ilk maçını ekle (açıklamasız).

DELETE FROM public.events
WHERE title = 'Fenerbahçe - FC Lugano';

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Fenerbahçe - Górnik Zabrze',
    NULL,
    ('2026-07-21 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-07-21 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Fenerbahçe - Górnik Zabrze'
      AND e.start_date = ('2026-07-21 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('fenerbahce', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
