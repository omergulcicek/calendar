-- Trabzonspor 2026/27 Süper Lig fikstürü (saatler henüz net değil → 12:00 placeholder).
-- Opener Kasımpaşa - Trabzonspor (15.08 19:00) zaten var; GS/FB/BJK derbilerine trabzonspor bağlanır.

INSERT INTO public.event_categories (event_id, category_id)
SELECT e.id, c.id
FROM public.events e
CROSS JOIN public.categories c
WHERE c.slug = 'trabzonspor'
  AND (
    (
      e.title = 'Trabzonspor - Galatasaray'
      AND e.start_date = ('2026-09-20 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Trabzonspor - Beşiktaş'
      AND e.start_date = ('2026-10-18 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Fenerbahçe - Trabzonspor'
      AND e.start_date = ('2026-12-13 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Galatasaray - Trabzonspor'
      AND e.start_date = ('2027-02-28 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Beşiktaş - Trabzonspor'
      AND e.start_date = ('2027-03-14 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Trabzonspor - Fenerbahçe'
      AND e.start_date = ('2027-05-09 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
  )
ON CONFLICT DO NOTHING;

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Kasımpaşa - Trabzonspor', '2026-08-15 19:00:00'),
    ('Trabzonspor - Başakşehir', '2026-08-23 12:00:00'),
    ('Amed SK - Trabzonspor', '2026-08-30 12:00:00'),
    ('Trabzonspor - Gençlerbirliği', '2026-09-06 12:00:00'),
    ('Konyaspor - Trabzonspor', '2026-09-13 12:00:00'),
    ('Trabzonspor - Galatasaray', '2026-09-20 12:00:00'),
    ('Samsunspor - Trabzonspor', '2026-10-11 12:00:00'),
    ('Trabzonspor - Beşiktaş', '2026-10-18 12:00:00'),
    ('Ç. Rizespor - Trabzonspor', '2026-10-25 12:00:00'),
    ('Trabzonspor - Gaziantep FK', '2026-11-01 12:00:00'),
    ('Alanyaspor - Trabzonspor', '2026-11-08 12:00:00'),
    ('Trabzonspor - Eyüpspor', '2026-11-22 12:00:00'),
    ('Göztepe - Trabzonspor', '2026-11-29 12:00:00'),
    ('Trabzonspor - Çorum FK', '2026-12-06 12:00:00'),
    ('Fenerbahçe - Trabzonspor', '2026-12-13 12:00:00'),
    ('Trabzonspor - Kocaelispor', '2026-12-20 12:00:00'),
    ('Erzurumspor FK - Trabzonspor', '2027-01-17 12:00:00'),
    ('Trabzonspor - Kasımpaşa', '2027-01-24 12:00:00'),
    ('Başakşehir - Trabzonspor', '2027-01-31 12:00:00'),
    ('Trabzonspor - Amed SK', '2027-02-07 12:00:00'),
    ('Gençlerbirliği - Trabzonspor', '2027-02-14 12:00:00'),
    ('Trabzonspor - Konyaspor', '2027-02-21 12:00:00'),
    ('Galatasaray - Trabzonspor', '2027-02-28 12:00:00'),
    ('Trabzonspor - Samsunspor', '2027-03-07 12:00:00'),
    ('Beşiktaş - Trabzonspor', '2027-03-14 12:00:00'),
    ('Trabzonspor - Ç. Rizespor', '2027-03-21 12:00:00'),
    ('Gaziantep FK - Trabzonspor', '2027-04-04 12:00:00'),
    ('Trabzonspor - Alanyaspor', '2027-04-11 12:00:00'),
    ('Eyüpspor - Trabzonspor', '2027-04-18 12:00:00'),
    ('Trabzonspor - Göztepe', '2027-04-25 12:00:00'),
    ('Çorum FK - Trabzonspor', '2027-05-02 12:00:00'),
    ('Trabzonspor - Fenerbahçe', '2027-05-09 12:00:00'),
    ('Kocaelispor - Trabzonspor', '2027-05-16 12:00:00'),
    ('Trabzonspor - Erzurumspor FK', '2027-05-23 12:00:00')
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
WHERE c.slug = 'trabzonspor'
ON CONFLICT DO NOTHING;
