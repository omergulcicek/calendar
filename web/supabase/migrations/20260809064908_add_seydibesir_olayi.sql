-- Seydibeşir Olayı (27 Mayıs 1921) — tarihi-olaylar yıl dönümü.

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar'
),
ins_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Seydibeşir Olayı',
    'I. Dünya Savaşı sırasında Mısır''daki Seydibeşir esir kampında İngilizler, yaklaşık 15 bin Osmanlı askerini krizollu dezenfekte havuzlarına sokarak kör etmiştir.',
    'https://tr.wikipedia.org/wiki/Seydibe%C5%9Fir_Olay%C4%B1'
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = 'Seydibeşir Olayı'
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM ins_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = 'Seydibeşir Olayı'
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
    'Seydibeşir Olayı',
    NULL,
    '1921-05-26 21:00:00+00'::timestamptz,
    '1921-05-27 20:59:59+00'::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    'commemoration',
    'gregorian'
  FROM subject_row
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Seydibeşir Olayı'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins_event.id, cat.id
FROM ins_event
CROSS JOIN cat
ON CONFLICT DO NOTHING;
