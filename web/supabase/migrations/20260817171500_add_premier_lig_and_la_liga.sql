-- Premier Lig ve La Liga kategorileri; La Liga'ya Barcelona ve Real Madrid fikstürü.

INSERT INTO public.categories (name, slug, "desc")
VALUES
  (
    'Premier Lig',
    'premier-lig',
    'İngiltere Premier Lig maçları; skor ve gol dakikaları.'
  ),
  (
    'La Liga',
    'la-liga',
    'İspanya La Liga maçları; skor ve gol dakikaları.'
  )
ON CONFLICT (slug) DO UPDATE
SET
  name = EXCLUDED.name,
  "desc" = EXCLUDED."desc";

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Espanyol - Real Madrid', '2026-08-22 22:30:00'),
    ('Elche - Barcelona', '2026-08-23 22:30:00'),
    ('Real Madrid - Real Sociedad', '2026-08-26 22:00:00'),
    ('Barcelona - Athletic Bilbao', '2026-08-27 22:00:00'),
    ('Real Madrid - Malaga', '2026-08-30 18:00:00'),
    ('Barcelona - Rayo Vallecano', '2026-08-31 22:30:00'),
    ('Real Betis - Real Madrid', '2026-09-04 22:00:00'),
    ('Valencia - Barcelona', '2026-09-06 17:15:00')
),
inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    f.title,
    NULL,
    (f.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul'),
    (f.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  FROM fixtures f
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.events e
    WHERE e.title = f.title
      AND e.start_date = (f.kickoff::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug = 'la-liga'
ON CONFLICT DO NOTHING;
