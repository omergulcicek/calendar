-- Nuri Pakdil: vefat yıl dönümü (doğum günü bilinmiyor; yalnızca 1934)

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
ins_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Nuri Pakdil',
    $desc$Türk şair, mütefekkir, deneme ve oyun yazarı; Yedi Güzel Adam oluşumunun mensubu. İstanbul Üniversitesi Hukuk Fakültesi mezunu; Edebiyat dergisini ve Edebiyat Dergisi Yayınları'nı kurmuştur. Anneler ve Kudüsler, Batı Notları, Biat ve Otel Gören Defterler gibi eserleriyle tanınır; "Kudüs şairi" olarak anılır. Cumhurbaşkanlığı Kültür ve Sanat Büyük Ödülü sahibidir.$desc$,
    'https://tr.wikipedia.org/wiki/Nuri_Pakdil'
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = 'Nuri Pakdil'
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM ins_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = 'Nuri Pakdil'
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
    'Nuri Pakdil: Vefat Yıl Dönümü',
    NULL,
    '2019-10-17 21:00:00+00'::timestamptz,
    '2019-10-18 20:59:59+00'::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    'death',
    'gregorian'
  FROM subject_row
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Nuri Pakdil: Vefat Yıl Dönümü'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins_event.id, cat.id
FROM ins_event
CROSS JOIN cat
ON CONFLICT DO NOTHING;
