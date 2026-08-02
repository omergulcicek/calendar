-- Süper Lig açılış maçları: Galatasaray - Çorum, Gençlerbirliği - Fenerbahçe.

WITH gs_match AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Galatasaray - Çorum',
    NULL,
    ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Galatasaray - Çorum'
      AND e.start_date = ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT gs_match.id, c.id
FROM gs_match
CROSS JOIN public.categories c
WHERE c.slug = 'galatasaray'
ON CONFLICT DO NOTHING;

WITH fb_match AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Gençlerbirliği - Fenerbahçe',
    NULL,
    ('2026-08-15 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-15 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Gençlerbirliği - Fenerbahçe'
      AND e.start_date = ('2026-08-15 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT fb_match.id, c.id
FROM fb_match
CROSS JOIN public.categories c
WHERE c.slug = 'fenerbahce'
ON CONFLICT DO NOTHING;
