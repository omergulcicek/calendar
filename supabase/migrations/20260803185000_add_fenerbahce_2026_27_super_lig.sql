-- Fenerbahçe 2026/27 Süper Lig fikstürü (saatler henüz net değil → 12:00 placeholder).
-- GS derbileri mevcut event’e fenerbahce kategorisi bağlanır (çift kayıt yok).

INSERT INTO public.event_categories (event_id, category_id)
SELECT e.id, c.id
FROM public.events e
CROSS JOIN public.categories c
WHERE c.slug = 'fenerbahce'
  AND (
    (
      e.title = 'Galatasaray - Fenerbahçe'
      AND e.start_date = ('2026-10-25 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
    OR (
      e.title = 'Fenerbahçe - Galatasaray'
      AND e.start_date = ('2027-03-21 12:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
    )
  )
ON CONFLICT DO NOTHING;

WITH fixtures (title, kickoff) AS (
  VALUES
    ('Fenerbahçe - Konyaspor', '2026-08-23 12:00:00'),
    ('Samsunspor - Fenerbahçe', '2026-08-30 12:00:00'),
    ('Fenerbahçe - Beşiktaş', '2026-09-06 12:00:00'),
    ('Gaziantep FK - Fenerbahçe', '2026-09-13 12:00:00'),
    ('Fenerbahçe - Eyüpspor', '2026-09-20 12:00:00'),
    ('Ç. Rizespor - Fenerbahçe', '2026-10-11 12:00:00'),
    ('Fenerbahçe - Alanyaspor', '2026-10-18 12:00:00'),
    ('Galatasaray - Fenerbahçe', '2026-10-25 12:00:00'),
    ('Fenerbahçe - Göztepe', '2026-11-01 12:00:00'),
    ('Çorum FK - Fenerbahçe', '2026-11-08 12:00:00'),
    ('Kocaelispor - Fenerbahçe', '2026-11-22 12:00:00'),
    ('Fenerbahçe - Erzurumspor FK', '2026-11-29 12:00:00'),
    ('Başakşehir - Fenerbahçe', '2026-12-06 12:00:00'),
    ('Fenerbahçe - Trabzonspor', '2026-12-13 12:00:00'),
    ('Kasımpaşa - Fenerbahçe', '2026-12-20 12:00:00'),
    ('Fenerbahçe - Amed SK', '2027-01-17 12:00:00'),
    ('Fenerbahçe - Gençlerbirliği', '2027-01-24 12:00:00'),
    ('Konyaspor - Fenerbahçe', '2027-01-31 12:00:00'),
    ('Fenerbahçe - Samsunspor', '2027-02-07 12:00:00'),
    ('Beşiktaş - Fenerbahçe', '2027-02-14 12:00:00'),
    ('Fenerbahçe - Gaziantep FK', '2027-02-21 12:00:00'),
    ('Eyüpspor - Fenerbahçe', '2027-02-28 12:00:00'),
    ('Fenerbahçe - Ç. Rizespor', '2027-03-07 12:00:00'),
    ('Alanyaspor - Fenerbahçe', '2027-03-14 12:00:00'),
    ('Fenerbahçe - Galatasaray', '2027-03-21 12:00:00'),
    ('Göztepe - Fenerbahçe', '2027-04-04 12:00:00'),
    ('Fenerbahçe - Çorum FK', '2027-04-11 12:00:00'),
    ('Fenerbahçe - Kocaelispor', '2027-04-18 12:00:00'),
    ('Erzurumspor FK - Fenerbahçe', '2027-04-25 12:00:00'),
    ('Fenerbahçe - Başakşehir', '2027-05-02 12:00:00'),
    ('Trabzonspor - Fenerbahçe', '2027-05-09 12:00:00'),
    ('Fenerbahçe - Kasımpaşa', '2027-05-16 12:00:00'),
    ('Amed SK - Fenerbahçe', '2027-05-23 12:00:00')
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
WHERE c.slug = 'fenerbahce'
ON CONFLICT DO NOTHING;
