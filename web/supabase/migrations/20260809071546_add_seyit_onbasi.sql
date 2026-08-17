-- Seyit Onbaşı: vefat yıl dönümü (doğum günü bilinmiyor; yalnızca Eylül 1889)

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
ins_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Seyit Onbaşı',
    'Çanakkale Cephesi''nde Rumeli Mecidiye Tabyası''nda görev yapan Türk asker. 18 Mart 1915''te top mermisini sırtlayarak ateş etmiş; İngiliz Ocean zırhlısını vurarak mayına çarpıp batmasına yol açmıştır.',
    'https://tr.wikipedia.org/wiki/Seyit_Onba%C5%9F%C4%B1'
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = 'Seyit Onbaşı'
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM ins_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = 'Seyit Onbaşı'
    AND NOT EXISTS (SELECT 1 FROM ins_subject)
),
ins_event AS (
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
    'Seyit Onbaşı: Vefat Yıl Dönümü',
    NULL,
    '1939-11-30 21:00:00+00'::timestamptz,
    '1939-12-01 20:59:59+00'::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    'death',
    'gregorian'
  FROM subject_row
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Seyit Onbaşı: Vefat Yıl Dönümü'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins_event.id, cat.id
FROM ins_event
CROSS JOIN cat
ON CONFLICT DO NOTHING;
