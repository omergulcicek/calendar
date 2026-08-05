-- Süper Lig: Kasımpaşa - Trabzonspor

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Kasımpaşa - Trabzonspor',
    NULL,
    ('2026-08-15 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-15 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Kasımpaşa - Trabzonspor'
      AND e.start_date = ('2026-08-15 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'trabzonspor'
ON CONFLICT DO NOTHING;
