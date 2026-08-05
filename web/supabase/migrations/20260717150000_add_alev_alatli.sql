-- Alev Alatlı: doğum ve vefat yıl dönümleri

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
        'Alev Alatlı',
        'Romanları, denemeleri ve köşe yazılarıyla düşünce dünyasına yön veren Türk yazar, akademisyen, sosyolog ve ekonomist.',
        'https://tr.wikipedia.org/wiki/Alev_Alatl%C4%B1'
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
    ('Alev Alatlı', 'Alev Alatlı: Doğum Yıl Dönümü', '1944-09-15 21:00:00+00', '1944-09-16 20:59:59+00', 'birth'),
    ('Alev Alatlı', 'Alev Alatlı: Vefat Yıl Dönümü', '2024-02-01 21:00:00+00', '2024-02-02 20:59:59+00', 'death')
) AS e(subject_name, title, start_date, end_date, kind)
  ON inserted.name = e.subject_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events ev
  JOIN cat ON ev.category_id = cat.id
  WHERE ev.title = e.title
);
