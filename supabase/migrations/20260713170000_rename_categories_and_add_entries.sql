-- Kategori yeniden adlandırma ve yeni tarihî kayıtlar.

UPDATE public.categories
SET
  name = 'Önemli Şahsiyetler',
  slug = 'onemli-sahsiyetler',
  "desc" = 'İslam dünyasının alimleri, düşünürleri, devlet adamları ve toplumsal liderlerinin doğum ve vefat yıl dönümleri.'
WHERE slug = 'islam-alimleri';

UPDATE public.categories
SET
  name = 'Tarihî Olaylar',
  slug = 'tarihi-olaylar',
  "desc" = 'Türk ve İslam tarihindeki savaşlar, fetihler, kuşatmalar; trajediler, soykırımlar ve uluslararası anma günleri.'
WHERE slug = 'savas-ve-fetihler';

UPDATE public.categories
SET
  "desc" = 'Türkiye''de kutlanan resmî günler, kültürel bayramlar ve farkındalık haftaları.'
WHERE slug = 'milli-ve-kulturel-gunler';

-- Fuat Sezgin ve Ali Şükrü Bey
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
        'Fuat Sezgin',
        'Türk akademisyen. İslam tarihi, bilim ve teknoloji tarihi alanındaki çalışmalarıyla tanınır; Arap-İslam Bilimleri Tarihi (GAS) eserinin yazarıdır.',
        'https://tr.wikipedia.org/wiki/Fuat_Sezgin'
      ),
      (
        'Ali Şükrü Bey',
        'Türk asker, gazeteci ve siyasetçi. TBMM 1. dönem Trabzon milletvekili; Mustafa Kemal''e karşı İkinci Grup''un önde gelen isimlerinden biri. 1923''te suikast sonucu öldürüldü.',
        'https://tr.wikipedia.org/wiki/Ali_%C5%9E%C3%BCkr%C3%BC'
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
    ('Fuat Sezgin', 'Fuat Sezgin: Doğum Yıl Dönümü', '1924-10-23 21:00:00+00', '1924-10-24 20:59:59+00', 'birth'),
    ('Fuat Sezgin', 'Fuat Sezgin: Vefat Yıl Dönümü', '2018-06-29 21:00:00+00', '2018-06-30 20:59:59+00', 'death'),
    ('Ali Şükrü Bey', 'Ali Şükrü Bey: Vefat Yıl Dönümü', '1923-03-26 21:00:00+00', '1923-03-27 20:59:59+00', 'death')
) AS e(subject_name, title, start_date, end_date, kind)
  ON inserted.name = e.subject_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events ev
  JOIN cat ON ev.category_id = cat.id
  WHERE ev.title = e.title
);

-- Kût'ül-Amâre ve Srebrenitsa Soykırımı
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
        'Kût''ül-Amâre Kuşatması',
        'I. Dünya Savaşı Irak Cephesi''nde Osmanlı ordusunun Britanya-Hint garnizonunu kuşatıp teslim aldığı muharebe; 29 Nisan 1916''da kesin Osmanlı zaferiyle sonuçlandı.',
        'https://tr.wikipedia.org/wiki/K%C3%BBt%27%C3%BCl-Am%C3%A2re_Ku%C5%9Fatmas%C4%B1'
      ),
      (
        'Srebrenitsa Soykırımı',
        '1995 Temmuz''unda Bosna Savaşı sırasında Ratko Mladiç komutasındaki Sırp Cumhuriyeti Ordusu ve ''Akrepler'' paramiliter birlikleri, Srebrenitsa''da en az 8.372 Müslüman Boşnak erkek ve çocuğunu öldürdü. Katliam, Büyük Sırbistan hedefi doğrultusunda yürütülen etnik temizlik ve Sırplaştırma politikalarının parçasıydı.',
        'https://tr.wikipedia.org/wiki/Srebrenitsa_Soyk%C4%B1r%C4%B1m%C4%B1'
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
  occurrence_date,
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
  e.occurrence_date::timestamptz,
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
      'Kût''ül-Amâre Kuşatması',
      'Kût''ül-Amâre Kuşatması',
      '1915-12-06 21:00:00+00',
      '1916-04-29 20:59:59+00',
      '1916-04-28 21:00:00+00'
    ),
    (
      'Srebrenitsa Soykırımı',
      'Srebrenitsa Soykırımı Anma Günü',
      '1995-07-10 21:00:00+00',
      '1995-07-11 20:59:59+00',
      NULL
    )
) AS e(subject_name, title, start_date, end_date, occurrence_date)
  ON inserted.name = e.subject_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events ev
  JOIN cat ON ev.category_id = cat.id
  WHERE ev.title = e.title
);
