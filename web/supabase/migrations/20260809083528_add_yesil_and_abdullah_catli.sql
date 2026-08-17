-- Yeşil (Mahmut Yıldırım) ve Abdullah Çatlı: önemli şahsiyetler

WITH cat AS (
  SELECT id FROM public.categories WHERE slug = 'onemli-sahsiyetler'
),
ins_subjects AS (
  INSERT INTO public.subjects (category_id, name, description, source_url)
  SELECT cat.id, v.name, v.description, v.source_url
  FROM cat
  CROSS JOIN (
    VALUES
      (
        'Yeşil (Mahmut Yıldırım)',
        $d1$Kod adıyla Yeşil olarak bilinen Zaza asıllı Türk istihbaratçı ve kontrgerilla. Kıbrıs Barış Harekâtı'ndan sonra MİT, ardından JİTEM ile ilişkilendirilmiş; Abdullah Öcalan'ı (Apo) öldürmek üzere görevlendirilen ekiplerde adı geçmiştir. Güneydoğu'daki faili meçhul cinayetler ve Susurluk sürecinde öne çıkmış; 1996'da Şam'da görüldükten sonra kayıplara karışmış, öldüğü ve yaşadığı yönünde çelişkili iddialar sürmektedir.$d1$,
        'https://tr.wikipedia.org/wiki/Mahmut_Y%C4%B1ld%C4%B1r%C4%B1m'
      ),
      (
        'Abdullah Çatlı',
        $d2$Organize suç örgütü lideri, mafya figürü ve kontrgerilla mensubu. Ülkücü hareketten gelen; Bahçelievler Katliamı başta olmak üzere birçok cinayetle adı anılan, 12 Eylül sonrası yurt dışında uyuşturucu kaçakçılığı nedeniyle yargılanıp hapisten kaçan isimdir. MİT bağlantılı operasyonlarla ilişkilendirilmiş; 3 Kasım 1996'da Susurluk kazasında vefat etmiştir.$d2$,
        'https://tr.wikipedia.org/wiki/Abdullah_%C3%87atl%C4%B1'
      )
  ) AS v(name, description, source_url)
  WHERE NOT EXISTS (
    SELECT 1
    FROM public.subjects s
    JOIN cat ON s.category_id = cat.id
    WHERE s.name = v.name
  )
  RETURNING id, name
),
subject_rows AS (
  SELECT id, name FROM ins_subjects
  UNION ALL
  SELECT s.id, s.name
  FROM public.subjects s
  JOIN cat ON s.category_id = cat.id
  WHERE s.name IN ('Yeşil (Mahmut Yıldırım)', 'Abdullah Çatlı')
    AND NOT EXISTS (
      SELECT 1 FROM ins_subjects i WHERE i.name = s.name
    )
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
    subject_rows.id,
    e.kind,
    'gregorian'
  FROM subject_rows
  JOIN (
    VALUES
      (
        'Yeşil (Mahmut Yıldırım)',
        'Yeşil (Mahmut Yıldırım): Doğum Yıl Dönümü',
        '1953-05-02 21:00:00+00',
        '1953-05-03 20:59:59+00',
        'birth'
      ),
      (
        'Abdullah Çatlı',
        'Abdullah Çatlı: Doğum Yıl Dönümü',
        '1956-05-31 21:00:00+00',
        '1956-06-01 20:59:59+00',
        'birth'
      ),
      (
        'Abdullah Çatlı',
        'Abdullah Çatlı: Vefat Yıl Dönümü',
        '1996-11-02 21:00:00+00',
        '1996-11-03 20:59:59+00',
        'death'
      )
  ) AS e(subject_name, title, start_date, end_date, kind)
    ON subject_rows.name = e.subject_name
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
