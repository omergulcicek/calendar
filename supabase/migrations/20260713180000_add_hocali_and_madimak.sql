-- Hocalı Katliamı ve Madımak Olayı (tarihi-olaylar).

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar'
),
inserted AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        'Hocalı Katliamı',
        'Karabağ Savaşı''nda 26 Şubat 1992''de Ermenistan Silahlı Kuvvetleri ve 366. Motorize Piyade Alayı desteğindeki Ermeni güçlerin Hocalı''daki Azerbaycanlı sivilleri toplu biçimde öldürmesi; Azerbaycan''ın resmî verilerine göre 613 sivil hayatını kaybetti.',
        'https://tr.wikipedia.org/wiki/Hocal%C4%B1_Katliam%C4%B1'
      ),
      (
        'Madımak Olayı',
        'Sivas''ta Pir Sultan Abdal Şenlikleri sırasında radikal İslamcı bir grubun Madımak Oteli''ni yakması sonucu çoğunluğu Alevi olan 35 kişi (33 konuk, 2 otel çalışanı) yanarak veya dumandan boğularak öldü.',
        'https://tr.wikipedia.org/wiki/Sivas_Katliam%C4%B1'
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
  'commemoration'
FROM cat
JOIN inserted ON true
JOIN (
  VALUES
    (
      'Hocalı Katliamı',
      'Hocalı Katliamı Anma Günü',
      '1992-02-25 21:00:00+00',
      '1992-02-26 20:59:59+00'
    ),
    (
      'Madımak Olayı',
      'Madımak Olayı',
      '1993-07-01 21:00:00+00',
      '1993-07-02 20:59:59+00'
    )
) AS e(subject_name, title, start_date, end_date)
  ON inserted.name = e.subject_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events ev
  JOIN cat ON ev.category_id = cat.id
  WHERE ev.title = e.title
);
