-- Deli Halid Paşa: vefat yıl dönümü (doğum günü bilinmiyor; yalnızca 1883)

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
ins_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Deli Halid Paşa',
    'Kurtuluş Savaşı''nda Doğu ve Batı cephelerinde komutanlık yapmış Çerkes asıllı Osmanlı ve Türk askeri. Sakarya Meydan Muharebesi''nde 12. Grup Komutanlığı yaptı; bu sırada gösterdiği cesaretten ötürü "Deli" lakabıyla anılmaya başlandı. "Geri çekilirseniz vururum, ben dönersem siz beni vurun" sözüyle bilinir; TBMM''de işlenen ilk cinayetin kurbanıdır.',
    'https://tr.wikipedia.org/wiki/Deli_Halid_Pa%C5%9Fa'
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = 'Deli Halid Paşa'
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM ins_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = 'Deli Halid Paşa'
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
    'Deli Halid Paşa: Vefat Yıl Dönümü',
    NULL,
    '1925-02-13 21:00:00+00'::timestamptz,
    '1925-02-14 20:59:59+00'::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    'death',
    'gregorian'
  FROM subject_row
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Deli Halid Paşa: Vefat Yıl Dönümü'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins_event.id, cat.id
FROM ins_event
CROSS JOIN cat
ON CONFLICT DO NOTHING;
