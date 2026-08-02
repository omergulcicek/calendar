-- Beşiktaş: Avrupa Ligi 3. eleme (Hradec Králové) + Süper Lig (Eyüpspor).

WITH leg1 AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Hradec Králové - Beşiktaş',
    'Avrupa Ligi üçüncü eleme turu ilk maç',
    ('2026-08-06 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-06 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Hradec Králové - Beşiktaş'
      AND e.start_date = ('2026-08-06 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT leg1.id, c.id
FROM leg1
CROSS JOIN public.categories c
WHERE c.slug = 'besiktas'
ON CONFLICT DO NOTHING;

WITH leg2 AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Beşiktaş - Hradec Králové',
    'Avrupa Ligi üçüncü eleme turu rövanş maçı',
    ('2026-08-13 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-13 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Beşiktaş - Hradec Králové'
      AND e.start_date = ('2026-08-13 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT leg2.id, c.id
FROM leg2
CROSS JOIN public.categories c
WHERE c.slug = 'besiktas'
ON CONFLICT DO NOTHING;

WITH super_lig AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Beşiktaş - Eyüpspor',
    NULL,
    ('2026-08-16 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-16 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Beşiktaş - Eyüpspor'
      AND e.start_date = ('2026-08-16 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT super_lig.id, c.id
FROM super_lig
CROSS JOIN public.categories c
WHERE c.slug = 'besiktas'
ON CONFLICT DO NOTHING;
