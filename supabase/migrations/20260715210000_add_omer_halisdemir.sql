-- Ömer Halisdemir (vefat yıl dönümü).

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        'Ömer Halisdemir',
        'Darbe girişiminde Özel Kuvvetler Komutanlığı''nı ele geçirmeye çalışan darbe yanlısı Tuğgeneral Semih Terzi''yi durdurduktan sonra darbeci askerlerce şehit düşen kahraman.',
        'https://tr.wikipedia.org/wiki/%C3%96mer_Halisdemir'
      )
  ) AS v(name, description, source_url)
  WHERE NOT EXISTS (
    SELECT 1 FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = v.name
  )
  RETURNING id, name
)
INSERT INTO public.events (
  category_id,
  title,
  start_date,
  end_date,
  is_all_day,
  status,
  recurrence,
  subject_id,
  kind
)
SELECT
  cat.id,
  e.title,
  e.start_date::timestamptz,
  e.end_date::timestamptz,
  true,
  'published',
  'yearly',
  inserted.id,
  e.kind
FROM cat
JOIN inserted ON true
JOIN (
  VALUES
    (
      'Ömer Halisdemir',
      'Ömer Halisdemir: Vefat Yıl Dönümü',
      '2016-07-15 21:00:00+00',
      '2016-07-16 20:59:59+00',
      'death'
    )
) AS e(subject_name, title, start_date, end_date, kind)
  ON inserted.name = e.subject_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events ev
  JOIN cat ON ev.category_id = cat.id
  WHERE ev.title = e.title
);
