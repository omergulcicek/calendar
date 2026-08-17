-- Premier Lig: Arsenal, Liverpool, Manchester City, Manchester United, Tottenham ve Chelsea fikstürü.

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Arsenal - Coventry', '2026-08-21 22:00:00'),
    ('Hull City - Manchester United', '2026-08-22 14:30:00'),
    ('Brentford - Tottenham', '2026-08-22 19:30:00'),
    ('Manchester City - Bournemouth', '2026-08-23 16:00:00'),
    ('Newcastle United - Liverpool', '2026-08-23 18:30:00'),
    ('Fulham - Chelsea', '2026-08-24 22:00:00'),
    ('Crystal Palace - Manchester City', '2026-08-28 22:00:00'),
    ('Liverpool - Nottingham Forest', '2026-08-29 14:30:00'),
    ('Tottenham - Newcastle United', '2026-08-29 19:30:00'),
    ('Chelsea - Brighton', '2026-08-30 16:00:00'),
    ('Manchester United - Ipswich', '2026-08-30 18:30:00'),
    ('Aston Villa - Arsenal', '2026-08-31 22:00:00'),
    ('Ipswich - Liverpool', '2026-09-04 22:00:00'),
    ('Manchester City - Coventry', '2026-09-05 17:00:00'),
    ('Nottingham Forest - Tottenham', '2026-09-05 17:00:00'),
    ('Everton - Manchester United', '2026-09-06 16:00:00'),
    ('Arsenal - Chelsea', '2026-09-06 18:30:00'),
    ('Liverpool - Fulham', '2026-09-12 17:00:00'),
    ('Chelsea - Hull City', '2026-09-12 17:00:00'),
    ('Tottenham - Everton', '2026-09-12 19:30:00'),
    ('Sunderland - Arsenal', '2026-09-12 22:00:00'),
    ('Manchester United - Manchester City', '2026-09-13 18:30:00'),
    ('Brentford - Chelsea', '2026-09-18 22:00:00'),
    ('Tottenham - Aston Villa', '2026-09-19 14:30:00'),
    ('Brighton - Arsenal', '2026-09-19 17:00:00'),
    ('Manchester City - Sunderland', '2026-09-19 17:00:00'),
    ('Bournemouth - Liverpool', '2026-09-20 16:00:00'),
    ('Fulham - Manchester United', '2026-09-20 18:30:00')
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
WHERE c.slug = 'premier-lig'
ON CONFLICT DO NOTHING;
