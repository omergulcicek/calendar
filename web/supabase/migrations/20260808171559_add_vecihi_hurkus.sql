-- Vecihi Hürkuş: doğum ve vefat yıl dönümleri

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
ins_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Vecihi Hürkuş',
    'Balkan Savaşları''ndan Kurtuluş Savaşı''na kadar görev yapmış Türk savaş pilotu ve mühendis. İlk yerli uçak VECİHİ K-VI''yı üretmiş, ilk sivil uçuş okulunu kurmuştur.',
    'https://tr.wikipedia.org/wiki/Vecihi_H%C3%BCrku%C5%9F'
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = 'Vecihi Hürkuş'
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM ins_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = 'Vecihi Hürkuş'
    AND NOT EXISTS (SELECT 1 FROM ins_subject)
),
ins_events AS (
  INSERT INTO public.events (
    title,
    description,
    start_date,
    end_date,
    is_all_day,
    status,
    recurrence,
    subject_id,
    kind,
    calendar_system
  )
  SELECT
    e.title,
    NULL,
    e.start_date::timestamptz,
    e.end_date::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    e.kind,
    'gregorian'
  FROM subject_row
  CROSS JOIN (
    VALUES
      (
        'Vecihi Hürkuş: Doğum Yıl Dönümü',
        '1896-01-05 21:00:00+00',
        '1896-01-06 20:59:59+00',
        'birth'
      ),
      (
        'Vecihi Hürkuş: Vefat Yıl Dönümü',
        '1969-07-15 21:00:00+00',
        '1969-07-16 20:59:59+00',
        'death'
      )
  ) AS e(title, start_date, end_date, kind)
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events ev WHERE ev.title = e.title
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins_events.id, cat.id
FROM ins_events
CROSS JOIN cat
ON CONFLICT DO NOTHING;
