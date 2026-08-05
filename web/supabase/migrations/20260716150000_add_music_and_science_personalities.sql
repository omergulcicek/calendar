-- Türk bilimi, müziği ve sanat tarihinden önemli isimlerin doğum ve vefat yıl dönümleri

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
        'Bîrûnî',
        'İslam''ın Altın Çağı''nda çalışmalar yapmış, matematik, doğa bilimleri, coğrafya ve astronomi alanlarındaki çok yönlü eserleriyle tanınan hezârfen.',
        'https://tr.wikipedia.org/wiki/B%C3%AEr%C3%BBn%C3%AE'
      ),
      (
        'Aziz Sancar',
        'Hücrelerin hasar gören DNA''ları nasıl onardığını haritalandıran çalışmalarıyla Nobel Kimya Ödülü''nü kazanan Türk-Amerikalı doktor, akademisyen ve biyokimyager.',
        'https://tr.wikipedia.org/wiki/Aziz_Sancar'
      ),
      (
        'Cahit Arf',
        'Hasse-Arf teoremi ve Arf değişmezi gibi kendi adıyla anılan buluşlarıyla cebir ve sayılar teorisinde dünya çapında tanınan Türk matematikçi ve bilim insanı.',
        'https://tr.wikipedia.org/wiki/Cahit_Arf'
      ),
      (
        'Ali Kuşçu',
        'Timur ve Osmanlı İmparatorluğu dönemlerinde yaşamış; astronomi, matematik ve dil bilimi alanında önemli eserler bırakmış bilgin.',
        'https://tr.wikipedia.org/wiki/Ali_Ku%C5%9F%C3%A7u'
      ),
      (
        'Âşık Veysel',
        'Türk halk şiirinin ve âşıklık geleneğinin en önemli temsilcilerinden; şiirlerinde hoşgörü, yurt sevgisi ve tabiatı işleyen unutulmaz halk ozanı.',
        'https://tr.wikipedia.org/wiki/%C3%82%C5%9F%C4%B1k_Veysel'
      ),
      (
        'Hammamizade İsmail Dede Efendi',
        'Mevlevî ayinlerinden köçekçelere kadar her formda eser veren, klasik Türk musikisinin en büyük bestekârlarından biri ve ünlü neyzen.',
        'https://tr.wikipedia.org/wiki/Hammamizade_%C4%B0smail_Dede_Efendi'
      ),
      (
        'Neşet Ertaş',
        'Bozkırın Tezenesi olarak bilinen, Abdallık kültürünün ve bozlak türünün son büyük temsilcisi olan efsanevi Türk halk ozanı.',
        'https://tr.wikipedia.org/wiki/Ne%C5%9Fet_Erta%C5%9F'
      ),
      (
        'Oktay Sinanoğlu',
        'Kuantum kimyası ve moleküler biyofizik alanlarındaki çalışmalarıyla dünya çapında tanınan, Türkçenin bilim dili olması için çaba sarf eden bilim insanı.',
        'https://tr.wikipedia.org/wiki/Oktay_Sinano%C4%9Flu'
      ),
      (
        'Barış Manço',
        'Anadolu rock türünün öncülerinden; şarkıcı, besteci, televizyon programcısı ve Türkiye''nin dünyadaki en önemli kültür elçilerinden biri.',
        'https://tr.wikipedia.org/wiki/Bar%C4%B1%C5%9F_Man%C3%A7o'
      ),
      (
        'Cem Karaca',
        'Anadolu rock müziğinin kurucularından; Apaşlar, Moğollar, Dervişan gibi efsanevi gruplarla protest müziğin ve rock kültürünün öncüsü olan sanatçı.',
        'https://tr.wikipedia.org/wiki/Cem_Karaca'
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
    ('Bîrûnî', 'Bîrûnî: Doğum Yıl Dönümü', '0973-09-04 21:00:00+00', '0973-09-05 20:59:59+00', 'birth'),
    ('Bîrûnî', 'Bîrûnî: Vefat Yıl Dönümü', '1048-12-13 21:00:00+00', '1048-12-14 20:59:59+00', 'death'),
    
    ('Aziz Sancar', 'Aziz Sancar: Doğum Yıl Dönümü', '1946-09-08 21:00:00+00', '1946-09-09 20:59:59+00', 'birth'),
    
    ('Cahit Arf', 'Cahit Arf: Doğum Yıl Dönümü', '1910-10-11 21:00:00+00', '1910-10-12 20:59:59+00', 'birth'),
    ('Cahit Arf', 'Cahit Arf: Vefat Yıl Dönümü', '1997-12-26 21:00:00+00', '1997-12-27 20:59:59+00', 'death'),
    
    ('Ali Kuşçu', 'Ali Kuşçu: Vefat Yıl Dönümü', '1474-12-16 21:00:00+00', '1474-12-17 20:59:59+00', 'death'),
    
    ('Âşık Veysel', 'Âşık Veysel: Doğum Yıl Dönümü', '1894-10-25 21:00:00+00', '1894-10-26 20:59:59+00', 'birth'),
    ('Âşık Veysel', 'Âşık Veysel: Vefat Yıl Dönümü', '1973-03-21 21:00:00+00', '1973-03-22 20:59:59+00', 'death'),
    
    ('Hammamizade İsmail Dede Efendi', 'Hammamizade İsmail Dede Efendi: Doğum Yıl Dönümü', '1778-01-09 21:00:00+00', '1778-01-10 20:59:59+00', 'birth'),
    ('Hammamizade İsmail Dede Efendi', 'Hammamizade İsmail Dede Efendi: Vefat Yıl Dönümü', '1846-11-29 21:00:00+00', '1846-11-30 20:59:59+00', 'death'),
    
    ('Neşet Ertaş', 'Neşet Ertaş: Vefat Yıl Dönümü', '2012-09-25 21:00:00+00', '2012-09-26 20:59:59+00', 'death'),
    
    ('Oktay Sinanoğlu', 'Oktay Sinanoğlu: Doğum Yıl Dönümü', '1935-02-25 21:00:00+00', '1935-02-26 20:59:59+00', 'birth'),
    ('Oktay Sinanoğlu', 'Oktay Sinanoğlu: Vefat Yıl Dönümü', '2015-04-19 21:00:00+00', '2015-04-20 20:59:59+00', 'death'),
    
    ('Barış Manço', 'Barış Manço: Doğum Yıl Dönümü', '1943-01-02 21:00:00+00', '1943-01-03 20:59:59+00', 'birth'),
    ('Barış Manço', 'Barış Manço: Vefat Yıl Dönümü', '1999-02-01 21:00:00+00', '1999-02-02 20:59:59+00', 'death'),
    
    ('Cem Karaca', 'Cem Karaca: Doğum Yıl Dönümü', '1945-04-05 21:00:00+00', '1945-04-06 20:59:59+00', 'birth'),
    ('Cem Karaca', 'Cem Karaca: Vefat Yıl Dönümü', '2004-02-08 21:00:00+00', '2004-02-09 20:59:59+00', 'death')
) AS e(subject_name, title, start_date, end_date, kind)
  ON inserted.name = e.subject_name
WHERE NOT EXISTS (
  SELECT 1
  FROM public.events ev
  JOIN cat ON ev.category_id = cat.id
  WHERE ev.title = e.title
);
