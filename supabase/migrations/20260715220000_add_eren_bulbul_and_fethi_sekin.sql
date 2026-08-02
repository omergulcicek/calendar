-- Eren Bülbül ve Fethi Sekin (vefat yıl dönümleri).

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
        'Eren Bülbül',
        'Trabzon''un Maçka ilçesinde jandarmaya bölgeyi tanıtırken PKK''lı teröristlerin saldırısı sonucu şehit düşen 15 yaşındaki kahraman.',
        'https://tr.wikipedia.org/wiki/Eren_B%C3%BClb%C3%BCl'
      ),
      (
        'Fethi Sekin',
        'İzmir Adliyesi''ne yönelik bombalı terör saldırısında teröristlerle çatışarak olası bir faciayı önleyen ve şehit düşen polis memuru.',
        'https://tr.wikipedia.org/wiki/2017_%C4%B0zmir_sald%C4%B1r%C4%B1s%C4%B1'
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
      'Eren Bülbül',
      'Eren Bülbül: Vefat Yıl Dönümü',
      '2017-08-10 21:00:00+00',
      '2017-08-11 20:59:59+00',
      'death'
    ),
    (
      'Fethi Sekin',
      'Fethi Sekin: Vefat Yıl Dönümü',
      '2017-01-04 21:00:00+00',
      '2017-01-05 20:59:59+00',
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
