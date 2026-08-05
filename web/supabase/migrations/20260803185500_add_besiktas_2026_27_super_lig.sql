-- Beşiktaş 2026/27 Süper Lig fikstürü (saatler henüz net değil → 12:00 placeholder).
-- GS/FB derbileri mevcut event’e besiktas kategorisi bağlanır (çift kayıt yok).

INSERT INTO public.event_categories (event_id, category_id)
SELECT e.id, c.id
FROM public.events e
CROSS JOIN public.categories c
WHERE c.slug = 'besiktas'
  AND (
    (
      e.title = 'Fenerbahçe - Beşiktaş'
      AND e.start_date = ('2026-09-06 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Beşiktaş - Galatasaray'
      AND e.start_date = ('2026-11-29 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Beşiktaş - Fenerbahçe'
      AND e.start_date = ('2027-02-14 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Galatasaray - Beşiktaş'
      AND e.start_date = ('2027-04-25 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
  )
ON CONFLICT DO NOTHING;

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Alanyaspor - Beşiktaş', '2026-08-23 12:00:00'),
    ('Beşiktaş - Çorum FK', '2026-08-30 12:00:00'),
    ('Fenerbahçe - Beşiktaş', '2026-09-06 12:00:00'),
    ('Beşiktaş - Erzurumspor FK', '2026-09-13 12:00:00'),
    ('Amed SK - Beşiktaş', '2026-09-20 12:00:00'),
    ('Beşiktaş - Kocaelispor', '2026-10-11 12:00:00'),
    ('Trabzonspor - Beşiktaş', '2026-10-18 12:00:00'),
    ('Beşiktaş - Başakşehir', '2026-10-25 12:00:00'),
    ('Kasımpaşa - Beşiktaş', '2026-11-01 12:00:00'),
    ('Beşiktaş - Gençlerbirliği', '2026-11-08 12:00:00'),
    ('Konyaspor - Beşiktaş', '2026-11-22 12:00:00'),
    ('Beşiktaş - Galatasaray', '2026-11-29 12:00:00'),
    ('Beşiktaş - Samsunspor', '2026-12-06 12:00:00'),
    ('Gaziantep FK - Beşiktaş', '2026-12-13 12:00:00'),
    ('Beşiktaş - Ç. Rizespor', '2026-12-20 12:00:00'),
    ('Göztepe - Beşiktaş', '2027-01-17 12:00:00'),
    ('Eyüpspor - Beşiktaş', '2027-01-24 12:00:00'),
    ('Beşiktaş - Alanyaspor', '2027-01-31 12:00:00'),
    ('Çorum FK - Beşiktaş', '2027-02-07 12:00:00'),
    ('Beşiktaş - Fenerbahçe', '2027-02-14 12:00:00'),
    ('Erzurumspor FK - Beşiktaş', '2027-02-21 12:00:00'),
    ('Beşiktaş - Amed SK', '2027-02-28 12:00:00'),
    ('Kocaelispor - Beşiktaş', '2027-03-07 12:00:00'),
    ('Beşiktaş - Trabzonspor', '2027-03-14 12:00:00'),
    ('Başakşehir - Beşiktaş', '2027-03-21 12:00:00'),
    ('Beşiktaş - Kasımpaşa', '2027-04-04 12:00:00'),
    ('Gençlerbirliği - Beşiktaş', '2027-04-11 12:00:00'),
    ('Beşiktaş - Konyaspor', '2027-04-18 12:00:00'),
    ('Galatasaray - Beşiktaş', '2027-04-25 12:00:00'),
    ('Samsunspor - Beşiktaş', '2027-05-02 12:00:00'),
    ('Beşiktaş - Gaziantep FK', '2027-05-09 12:00:00'),
    ('Ç. Rizespor - Beşiktaş', '2027-05-16 12:00:00'),
    ('Beşiktaş - Göztepe', '2027-05-23 12:00:00')
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
WHERE c.slug = 'besiktas'
ON CONFLICT DO NOTHING;
