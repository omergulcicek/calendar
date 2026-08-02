-- Kanije Savunması (18 Kasım 1601) — tarihi-olaylar yıl dönümü.

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'tarihi-olaylar'
),
ins_subject AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT
    cat.id,
    'Kanije Savunması',
    'Tiryaki Hasan Paşa, 1601 yılındaki Kanije Savunması ile efsaneleşmiştir. Yaklaşık 9.000 kişilik Osmanlı kuvvetiyle, Avusturya Arşidükü Ferdinand komutasındaki 100.000 kişilik müttefik Haçlı ordusuna karşı Kanije Kalesi''ni 2 aydan fazla süre askeri deha ve psikolojik harp taktikleriyle savunmuş, sonunda Haçlı ordusunu bozguna uğratmıştır.',
    'https://tr.wikipedia.org/wiki/Kanije_Savunmas%C4%B1'
  FROM cat
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = 'Kanije Savunması'
  )
  RETURNING id
),
subject_row AS (
  SELECT id FROM ins_subject
  UNION ALL
  SELECT s.id
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name = 'Kanije Savunması'
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
    'Kanije Savunması',
    NULL,
    '1601-11-17 21:00:00+00'::timestamptz,
    '1601-11-18 20:59:59+00'::timestamptz,
    true,
    'published',
    'yearly',
    subject_row.id,
    'commemoration',
    'gregorian'
  FROM subject_row
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e WHERE e.title = 'Kanije Savunması'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT ins_event.id, cat.id
FROM ins_event
CROSS JOIN cat
ON CONFLICT DO NOTHING;
