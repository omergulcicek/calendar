-- Galatasaray 2026/27 Süper Lig fikstürü (saatler henüz net değil → 12:00 placeholder).

UPDATE public.events
SET
  title = 'Galatasaray - Çorum FK',
  start_date = ('2026-08-14 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = ('2026-08-14 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours'
WHERE title = 'Galatasaray - Çorum'
   OR (
     title = 'Galatasaray - Çorum FK'
     AND start_date = ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
   );

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Galatasaray - Çorum FK', '2026-08-14 12:00:00'),
    ('Erzurumspor FK - Galatasaray', '2026-08-23 12:00:00'),
    ('Galatasaray - Göztepe', '2026-08-30 12:00:00'),
    ('Başakşehir - Galatasaray', '2026-09-06 12:00:00'),
    ('Galatasaray - Kocaelispor', '2026-09-13 12:00:00'),
    ('Trabzonspor - Galatasaray', '2026-09-20 12:00:00'),
    ('Galatasaray - Kasımpaşa', '2026-10-11 12:00:00'),
    ('Gençlerbirliği - Galatasaray', '2026-10-18 12:00:00'),
    ('Galatasaray - Fenerbahçe', '2026-10-25 12:00:00'),
    ('Konyaspor - Galatasaray', '2026-11-01 12:00:00'),
    ('Galatasaray - Amed SK', '2026-11-08 12:00:00'),
    ('Galatasaray - Samsunspor', '2026-11-22 12:00:00'),
    ('Beşiktaş - Galatasaray', '2026-11-29 12:00:00'),
    ('Galatasaray - Ç. Rizespor', '2026-12-06 12:00:00'),
    ('Eyüpspor - Galatasaray', '2026-12-13 12:00:00'),
    ('Galatasaray - Alanyaspor', '2026-12-20 12:00:00'),
    ('Gaziantep FK - Galatasaray', '2027-01-17 12:00:00'),
    ('Çorum FK - Galatasaray', '2027-01-24 12:00:00'),
    ('Galatasaray - Erzurumspor FK', '2027-01-31 12:00:00'),
    ('Göztepe - Galatasaray', '2027-02-07 12:00:00'),
    ('Galatasaray - Başakşehir', '2027-02-14 12:00:00'),
    ('Kocaelispor - Galatasaray', '2027-02-21 12:00:00'),
    ('Galatasaray - Trabzonspor', '2027-02-28 12:00:00'),
    ('Kasımpaşa - Galatasaray', '2027-03-07 12:00:00'),
    ('Galatasaray - Gençlerbirliği', '2027-03-14 12:00:00'),
    ('Fenerbahçe - Galatasaray', '2027-03-21 12:00:00'),
    ('Galatasaray - Konyaspor', '2027-04-04 12:00:00'),
    ('Amed SK - Galatasaray', '2027-04-11 12:00:00'),
    ('Samsunspor - Galatasaray', '2027-04-18 12:00:00'),
    ('Galatasaray - Beşiktaş', '2027-04-25 12:00:00'),
    ('Ç. Rizespor - Galatasaray', '2027-05-02 12:00:00'),
    ('Galatasaray - Eyüpspor', '2027-05-09 12:00:00'),
    ('Alanyaspor - Galatasaray', '2027-05-16 12:00:00'),
    ('Galatasaray - Gaziantep FK', '2027-05-23 12:00:00')
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
WHERE c.slug = 'galatasaray'
ON CONFLICT DO NOTHING;
