-- 2026 FIFA Dünya Kupası grup maçları — Transfermarkt verilerine göre güncelleme.
-- Kaynak: transfermarkt.de, saatler Türkiye (Europe/Istanbul).


UPDATE public.events
SET
  title = E'🇲🇽 Meksika 2 - 0 Güney Afrika 🇿🇦',
  description = NULLIF(E'Julián Quiñones 9''
Raúl Jiménez 67''', ''),
  start_date = (E'2026-06-11 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-11 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Meksika' || '%'
  AND events.title LIKE '%' || E'Güney Afrika' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇰🇷 Güney Kore 2 - 1 Çekya 🇨🇿',
  description = NULLIF(E'In-beom Hwang 67''
Hyeon-gyu Oh 80''

Ladislav Krejci 59''', ''),
  start_date = (E'2026-06-12 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-12 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Güney Kore' || '%'
  AND events.title LIKE '%' || E'Çekya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇿 Çekya 1 - 1 Güney Afrika 🇿🇦',
  description = NULLIF(E'Michal Sadílek 6''

Teboho Mokoena 83'' (Penaltı)', ''),
  start_date = (E'2026-06-18 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-18 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Çekya' || '%'
  AND events.title LIKE '%' || E'Güney Afrika' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇲🇽 Meksika 1 - 0 Güney Kore 🇰🇷',
  description = NULLIF(E'Luis Romo 50''', ''),
  start_date = (E'2026-06-19 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-19 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Meksika' || '%'
  AND events.title LIKE '%' || E'Güney Kore' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇿 Çekya 0 - 3 Meksika 🇲🇽',
  description = NULLIF(E'Mateo Chávez 55''
Julián Quiñones 61''
Álvaro Fidalgo 90+4''', ''),
  start_date = (E'2026-06-25 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-25 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Çekya' || '%'
  AND events.title LIKE '%' || E'Meksika' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇿🇦 Güney Afrika 1 - 0 Güney Kore 🇰🇷',
  description = NULLIF(E'Thapelo Maseko 63''', ''),
  start_date = (E'2026-06-25 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-25 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Güney Afrika' || '%'
  AND events.title LIKE '%' || E'Güney Kore' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇦 Kanada 1 - 1 Bosna-Hersek 🇧🇦',
  description = NULLIF(E'Cyle Larin 78''

Jovo Lukić 21''', ''),
  start_date = (E'2026-06-12 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-12 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kanada' || '%'
  AND events.title LIKE '%' || E'Bosna-Hersek' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇶🇦 Katar 1 - 1 İsviçre 🇨🇭',
  description = NULLIF(E'Miro Muheim 90+4'' (Kendi Kalesine)

Breel Embolo 17'' (Penaltı)', ''),
  start_date = (E'2026-06-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-13 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Katar' || '%'
  AND events.title LIKE '%' || E'İsviçre' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇭 İsviçre 4 - 1 Bosna-Hersek 🇧🇦',
  description = NULLIF(E'Johan Manzambi 74'', 90''
Rubén Vargas 84''
Granit Xhaka 90+7'' (Penaltı)

Ermin Mahmic 90+3''', ''),
  start_date = (E'2026-06-18 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-18 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İsviçre' || '%'
  AND events.title LIKE '%' || E'Bosna-Hersek' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇦 Kanada 6 - 0 Katar 🇶🇦',
  description = NULLIF(E'Cyle Larin 16''
Jonathan David 29'', 45+3'', 90+2''
Nathan-Dylan Saliba 64''
Mohamed Manai 75'' (Kendi Kalesine)', ''),
  start_date = (E'2026-06-19 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-19 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kanada' || '%'
  AND events.title LIKE '%' || E'Katar' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇭 İsviçre 2 - 1 Kanada 🇨🇦',
  description = NULLIF(E'Rubén Vargas 46''
Johan Manzambi 57''

Promise David 76''', ''),
  start_date = (E'2026-06-24 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-24 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İsviçre' || '%'
  AND events.title LIKE '%' || E'Kanada' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇧🇦 Bosna-Hersek 3 - 1 Katar 🇶🇦',
  description = NULLIF(E'Kerim Alajbegovic 29''
Mahmoud Abunada 34'' (Kendi Kalesine)
Ermin Mahmic 80''

Hassan Al-Haydos 42''', ''),
  start_date = (E'2026-06-24 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-24 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Bosna-Hersek' || '%'
  AND events.title LIKE '%' || E'Katar' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇺🇸 ABD 4 - 1 Paraguay 🇵🇾',
  description = NULLIF(E'Damián Bobadilla 7'' (Kendi Kalesine)
Folarin Balogun 31'', 45+5''
Giovanni Reyna 90+8''

Mauricio 73''', ''),
  start_date = (E'2026-06-13 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-13 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'ABD' || '%'
  AND events.title LIKE '%' || E'Paraguay' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇦🇺 Avustralya 2 - 0 Türkiye 🇹🇷',
  description = NULLIF(E'Nestory Irankunda 27''
Connor Metcalfe 75''', ''),
  start_date = (E'2026-06-14 07:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-14 07:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Avustralya' || '%'
  AND events.title LIKE '%' || E'Türkiye' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇺🇸 ABD 2 - 0 Avustralya 🇦🇺',
  description = NULLIF(E'Cameron Burgess 11'' (Kendi Kalesine)
Alex Freeman 43''', ''),
  start_date = (E'2026-06-19 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-19 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'ABD' || '%'
  AND events.title LIKE '%' || E'Avustralya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇹🇷 Türkiye 0 - 1 Paraguay 🇵🇾',
  description = NULLIF(E'Matías Galarza 2''', ''),
  start_date = (E'2026-06-20 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-20 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Türkiye' || '%'
  AND events.title LIKE '%' || E'Paraguay' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇹🇷 Türkiye 3 - 2 ABD 🇺🇸',
  description = NULLIF(E'Arda Güler 10''
Barış Alper Yılmaz 31''
Kaan Ayhan 90+8''

Auston Trusty 3''
Sebastian Berhalter 49''', ''),
  start_date = (E'2026-06-26 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-26 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Türkiye' || '%'
  AND events.title LIKE '%' || E'ABD' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇵🇾 Paraguay 0 - 0 Avustralya 🇦🇺',
  description = NULLIF('', ''),
  start_date = (E'2026-06-26 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-26 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Paraguay' || '%'
  AND events.title LIKE '%' || E'Avustralya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇩🇪 Almanya 7 - 1 Curaçao 🇨🇼',
  description = NULLIF(E'Felix Nmecha 6''
Nico Schlotterbeck 38''
Kai Havertz 45+5'' (Penaltı), 88''
Jamal Musiala 47''
Nathaniel Brown 68''
Deniz Undav 78''

Livano Comenencia 21''', ''),
  start_date = (E'2026-06-14 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-14 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Almanya' || '%'
  AND events.title LIKE '%' || E'Curaçao' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇮 Fildişi Sahili 1 - 0 Ekvador 🇪🇨',
  description = NULLIF(E'Amad Diallo 90''', ''),
  start_date = (E'2026-06-15 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-15 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fildişi Sahili' || '%'
  AND events.title LIKE '%' || E'Ekvador' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇩🇪 Almanya 2 - 1 Fildişi Sahili 🇨🇮',
  description = NULLIF(E'Deniz Undav 68'', 90+4''

Franck Kessié 30''', ''),
  start_date = (E'2026-06-20 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-20 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Almanya' || '%'
  AND events.title LIKE '%' || E'Fildişi Sahili' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇪🇨 Ekvador 0 - 0 Curaçao 🇨🇼',
  description = NULLIF('', ''),
  start_date = (E'2026-06-21 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-21 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Ekvador' || '%'
  AND events.title LIKE '%' || E'Curaçao' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇪🇨 Ekvador 2 - 1 Almanya 🇩🇪',
  description = NULLIF(E'Nilson Angulo 9''
Gonzalo Plata 77''

Leroy Sané 2''', ''),
  start_date = (E'2026-06-25 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-25 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Ekvador' || '%'
  AND events.title LIKE '%' || E'Almanya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇼 Curaçao 0 - 2 Fildişi Sahili 🇨🇮',
  description = NULLIF(E'Nicolas Pépé 7'', 64''', ''),
  start_date = (E'2026-06-25 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-25 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Curaçao' || '%'
  AND events.title LIKE '%' || E'Fildişi Sahili' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇳🇱 Hollanda 2 - 2 Japonya 🇯🇵',
  description = NULLIF(E'Virgil van Dijk 51''
Crysencio Summerville 64''

Keito Nakamura 57''
Daichi Kamada 88''', ''),
  start_date = (E'2026-06-14 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-14 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Hollanda' || '%'
  AND events.title LIKE '%' || E'Japonya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇸🇪 İsveç 5 - 1 Tunus 🇹🇳',
  description = NULLIF(E'Yasin Ayari 7'', 90+6''
Alexander Isak 30''
Viktor Gyökeres 59''
Mattias Svanberg 84''

Omar Rekik 43''', ''),
  start_date = (E'2026-06-15 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-15 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İsveç' || '%'
  AND events.title LIKE '%' || E'Tunus' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇳🇱 Hollanda 5 - 1 İsveç 🇸🇪',
  description = NULLIF(E'Brian Brobbey 5'', 17''
Cody Gakpo 47'', 54''
Crysencio Summerville 89''

Anthony Elanga 59''', ''),
  start_date = (E'2026-06-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-20 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Hollanda' || '%'
  AND events.title LIKE '%' || E'İsveç' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇹🇳 Tunus 0 - 4 Japonya 🇯🇵',
  description = NULLIF(E'Daichi Kamada 4''
Ayase Ueda 31'', 83''
Junya Ito 69''', ''),
  start_date = (E'2026-06-21 07:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-21 07:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Tunus' || '%'
  AND events.title LIKE '%' || E'Japonya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇹🇳 Tunus 1 - 3 Hollanda 🇳🇱',
  description = NULLIF(E'Hazem Mastouri 54''

Ellyes Skhiri 3'' (Kendi Kalesine)
Brian Brobbey 7''
Jan Paul van Hecke 62''', ''),
  start_date = (E'2026-06-26 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-26 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Tunus' || '%'
  AND events.title LIKE '%' || E'Hollanda' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇯🇵 Japonya 1 - 1 İsveç 🇸🇪',
  description = NULLIF(E'Daizen Maeda 56''

Anthony Elanga 62''', ''),
  start_date = (E'2026-06-26 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-26 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Japonya' || '%'
  AND events.title LIKE '%' || E'İsveç' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇧🇪 Belçika 1 - 1 Mısır 🇪🇬',
  description = NULLIF(E'Mohamed Hany 66'' (Kendi Kalesine)

Emam Ashour 19''', ''),
  start_date = (E'2026-06-15 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-15 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Belçika' || '%'
  AND events.title LIKE '%' || E'Mısır' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇮🇷 İran 2 - 2 Yeni Zelanda 🇳🇿',
  description = NULLIF(E'Ramin Rezaeian 32''
Mohammad Mohebi 64''

Elijah Just 7'', 54''', ''),
  start_date = (E'2026-06-16 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-16 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İran' || '%'
  AND events.title LIKE '%' || E'Yeni Zelanda' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇧🇪 Belçika 0 - 0 İran 🇮🇷',
  description = NULLIF('', ''),
  start_date = (E'2026-06-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-21 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Belçika' || '%'
  AND events.title LIKE '%' || E'İran' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇳🇿 Yeni Zelanda 1 - 3 Mısır 🇪🇬',
  description = NULLIF(E'Finn Surman 15''

Mostafa Ziko 58''
Mohamed Salah 67''
Trezeguet 82''', ''),
  start_date = (E'2026-06-22 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-22 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Yeni Zelanda' || '%'
  AND events.title LIKE '%' || E'Mısır' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇳🇿 Yeni Zelanda 1 - 5 Belçika 🇧🇪',
  description = NULLIF(E'Elijah Just 84''

Leandro Trossard 28'', 50''
Kevin De Bruyne 66''
Romelu Lukaku 86''
Alexis Saelemaekers 90+4''', ''),
  start_date = (E'2026-06-27 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-27 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Yeni Zelanda' || '%'
  AND events.title LIKE '%' || E'Belçika' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇪🇬 Mısır 1 - 1 İran 🇮🇷',
  description = NULLIF(E'Mahmoud Saber 5''

Ramin Rezaeian 14''', ''),
  start_date = (E'2026-06-27 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-27 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Mısır' || '%'
  AND events.title LIKE '%' || E'İran' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇪🇸 İspanya 0 - 0 Yeşil Burun Adaları 🇨🇻',
  description = NULLIF('', ''),
  start_date = (E'2026-06-15 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-15 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND events.title LIKE '%' || E'Yeşil Burun Adaları' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇸🇦 Suudi Arabistan 1 - 1 Uruguay 🇺🇾',
  description = NULLIF(E'Abdulelah Al-Amri 41''

Maxi Araújo 80''', ''),
  start_date = (E'2026-06-16 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-16 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Suudi Arabistan' || '%'
  AND events.title LIKE '%' || E'Uruguay' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇪🇸 İspanya 4 - 0 Suudi Arabistan 🇸🇦',
  description = NULLIF(E'Lamine Yamal 10''
Mikel Oyarzabal 21'', 24''
Hassan Tambakti 49'' (Kendi Kalesine)', ''),
  start_date = (E'2026-06-21 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-21 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND events.title LIKE '%' || E'Suudi Arabistan' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇺🇾 Uruguay 2 - 2 Yeşil Burun Adaları 🇨🇻',
  description = NULLIF(E'Maxi Araújo 44''
Agustín Canobbio 45+6''

Kevin Pina 21''
Hélio Varela 61''', ''),
  start_date = (E'2026-06-22 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-22 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Uruguay' || '%'
  AND events.title LIKE '%' || E'Yeşil Burun Adaları' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇺🇾 Uruguay 0 - 1 İspanya 🇪🇸',
  description = NULLIF(E'Álex Baena 42''', ''),
  start_date = (E'2026-06-27 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-27 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Uruguay' || '%'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇻 Yeşil Burun Adaları 0 - 0 Suudi Arabistan 🇸🇦',
  description = NULLIF('', ''),
  start_date = (E'2026-06-27 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-27 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Yeşil Burun Adaları' || '%'
  AND events.title LIKE '%' || E'Suudi Arabistan' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇫🇷 Fransa 3 - 1 Senegal 🇸🇳',
  description = NULLIF(E'Kylian Mbappé 66'', 90+6''
Bradley Barcola 82''

Ibrahim Mbaye 90+5''', ''),
  start_date = (E'2026-06-16 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-16 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'Senegal' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇮🇶 Irak 1 - 4 Norveç 🇳🇴',
  description = NULLIF(E'Aymen Hussein 39''

Erling Haaland 29'', 43''
Leo Østigård 76''
Aymen Hussein 90+6'' (Kendi Kalesine)', ''),
  start_date = (E'2026-06-17 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-17 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Irak' || '%'
  AND events.title LIKE '%' || E'Norveç' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇫🇷 Fransa 3 - 0 Irak 🇮🇶',
  description = NULLIF(E'Kylian Mbappé 14'', 54''
Ousmane Dembélé 66''', ''),
  start_date = (E'2026-06-23 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-23 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'Irak' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇳🇴 Norveç 3 - 2 Senegal 🇸🇳',
  description = NULLIF(E'Marcus Pedersen 43''
Erling Haaland 48'', 58''

Ismaïla Sarr 53'', 90+3''', ''),
  start_date = (E'2026-06-23 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-23 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Norveç' || '%'
  AND events.title LIKE '%' || E'Senegal' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇳🇴 Norveç 1 - 4 Fransa 🇫🇷',
  description = NULLIF(E'Thelo Aasgaard 21''

Ousmane Dembélé 7'', 20'', 32''
Désiré Doué 90+4''', ''),
  start_date = (E'2026-06-26 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-26 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Norveç' || '%'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇸🇳 Senegal 5 - 0 Irak 🇮🇶',
  description = NULLIF(E'Habib Diarra 4''
Ismaïla Sarr 56''
Pape Gueye 59'', 71''
Iliman Ndiaye 82''', ''),
  start_date = (E'2026-06-26 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-26 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Senegal' || '%'
  AND events.title LIKE '%' || E'Irak' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇦🇷 Arjantin 3 - 0 Cezayir 🇩🇿',
  description = NULLIF(E'Lionel Messi 17'', 60'', 76''', ''),
  start_date = (E'2026-06-17 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-17 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND events.title LIKE '%' || E'Cezayir' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇦🇹 Avusturya 3 - 1 Ürdün 🇯🇴',
  description = NULLIF(E'Romano Schmid 21''
Yazan Al-Arab 76'' (Kendi Kalesine)
Marko Arnautovic 90+12'' (Penaltı)

Ali Olwan 50''', ''),
  start_date = (E'2026-06-17 07:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-17 07:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Avusturya' || '%'
  AND events.title LIKE '%' || E'Ürdün' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇦🇷 Arjantin 2 - 0 Avusturya 🇦🇹',
  description = NULLIF(E'Lionel Messi 38'', 90+5''', ''),
  start_date = (E'2026-06-22 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-22 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND events.title LIKE '%' || E'Avusturya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇯🇴 Ürdün 1 - 2 Cezayir 🇩🇿',
  description = NULLIF(E'Nizar Al-Rashdan 36''

Nadhir Benbouali 69''
Amine Gouiri 82''', ''),
  start_date = (E'2026-06-23 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-23 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Ürdün' || '%'
  AND events.title LIKE '%' || E'Cezayir' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇯🇴 Ürdün 1 - 3 Arjantin 🇦🇷',
  description = NULLIF(E'Mousa Tamari 55''

Giovani Lo Celso 19''
Lautaro Martínez 31'' (Penaltı)
Lionel Messi 80''', ''),
  start_date = (E'2026-06-28 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Ürdün' || '%'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇩🇿 Cezayir 3 - 3 Avusturya 🇦🇹',
  description = NULLIF(E'Rafik Belghali 45''
Riyad Mahrez 60'', 90+3''

Marko Arnautovic 28''
Marcel Sabitzer 55''
Sasa Kalajdzic 90+6''', ''),
  start_date = (E'2026-06-28 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Cezayir' || '%'
  AND events.title LIKE '%' || E'Avusturya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 4 - 2 Hırvatistan 🇭🇷',
  description = NULLIF(E'Harry Kane 12'' (Penaltı), 42''
Jude Bellingham 47''
Marcus Rashford 85''

Martin Baturina 36''
Petar Musa 45+5''', ''),
  start_date = (E'2026-06-17 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-17 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND events.title LIKE '%' || E'Hırvatistan' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇬🇭 Gana 1 - 0 Panama 🇵🇦',
  description = NULLIF(E'Caleb Yirenkyi 90+5''', ''),
  start_date = (E'2026-06-18 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-18 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Gana' || '%'
  AND events.title LIKE '%' || E'Panama' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 0 - 0 Gana 🇬🇭',
  description = NULLIF('', ''),
  start_date = (E'2026-06-23 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-23 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND events.title LIKE '%' || E'Gana' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇵🇦 Panama 0 - 1 Hırvatistan 🇭🇷',
  description = NULLIF(E'Ante Budimir 54''', ''),
  start_date = (E'2026-06-24 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-24 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Panama' || '%'
  AND events.title LIKE '%' || E'Hırvatistan' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇵🇦 Panama 0 - 2 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿',
  description = NULLIF(E'Jude Bellingham 62''
Harry Kane 67''', ''),
  start_date = (E'2026-06-28 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Panama' || '%'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇭🇷 Hırvatistan 2 - 1 Gana 🇬🇭',
  description = NULLIF(E'Petar Sučić 31''
Nikola Vlašić 83''

Derrick Luckassen 73''', ''),
  start_date = (E'2026-06-28 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Hırvatistan' || '%'
  AND events.title LIKE '%' || E'Gana' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇧🇷 Brezilya 1 - 1 Fas 🇲🇦',
  description = NULLIF(E'Vinicius Junior 32''

Ismael Saibari 21''', ''),
  start_date = (E'2026-06-14 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-14 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Brezilya' || '%'
  AND events.title LIKE '%' || E'Fas' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇭🇹 Haiti 0 - 1 İskoçya 🏴󠁧󠁢󠁳󠁣󠁴󠁿',
  description = NULLIF(E'John McGinn 28''', ''),
  start_date = (E'2026-06-14 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-14 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Haiti' || '%'
  AND events.title LIKE '%' || E'İskoçya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁳󠁣󠁴󠁿 İskoçya 0 - 1 Fas 🇲🇦',
  description = NULLIF(E'Ismael Saibari 2''', ''),
  start_date = (E'2026-06-20 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-20 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İskoçya' || '%'
  AND events.title LIKE '%' || E'Fas' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇧🇷 Brezilya 3 - 0 Haiti 🇭🇹',
  description = NULLIF(E'Matheus Cunha 23'', 36''
Vinicius Junior 45+3''', ''),
  start_date = (E'2026-06-20 03:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-20 03:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Brezilya' || '%'
  AND events.title LIKE '%' || E'Haiti' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁳󠁣󠁴󠁿 İskoçya 0 - 3 Brezilya 🇧🇷',
  description = NULLIF(E'Vinicius Junior 7'', 45+3''
Matheus Cunha 60''', ''),
  start_date = (E'2026-06-25 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-25 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İskoçya' || '%'
  AND events.title LIKE '%' || E'Brezilya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇲🇦 Fas 4 - 2 Haiti 🇭🇹',
  description = NULLIF(E'Achraf Hakimi 39''
Ismael Saibari 45+1''
Soufiane Rahimi 78''
Gessime Yassine 89''

Yassine Bounou 10'' (Kendi Kalesine)
Wilson Isidor 43''', ''),
  start_date = (E'2026-06-25 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-25 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fas' || '%'
  AND events.title LIKE '%' || E'Haiti' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇵🇹 Portekiz 1 - 1 Kongo DC 🇨🇩',
  description = NULLIF(E'João Neves 6''

Yoane Wissa 45+5''', ''),
  start_date = (E'2026-06-17 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-17 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Portekiz' || '%'
  AND events.title LIKE '%' || E'Kongo DC' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇺🇿 Özbekistan 1 - 3 Kolombiya 🇨🇴',
  description = NULLIF(E'Abbosbek Fayzullaev 60''

Daniel Muñoz 40''
Luis Díaz 65''
Jáminton Campaz 90+9''', ''),
  start_date = (E'2026-06-18 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-18 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Özbekistan' || '%'
  AND events.title LIKE '%' || E'Kolombiya' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇵🇹 Portekiz 5 - 0 Özbekistan 🇺🇿',
  description = NULLIF(E'Cristiano Ronaldo 6'', 39''
Nuno Mendes 17''
Abduvokhid Nematov 60'' (Kendi Kalesine)
Rafael Leão 87''', ''),
  start_date = (E'2026-06-23 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-23 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Portekiz' || '%'
  AND events.title LIKE '%' || E'Özbekistan' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇴 Kolombiya 1 - 0 Kongo DC 🇨🇩',
  description = NULLIF(E'Daniel Muñoz 76''', ''),
  start_date = (E'2026-06-24 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-24 05:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kolombiya' || '%'
  AND events.title LIKE '%' || E'Kongo DC' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇴 Kolombiya 0 - 0 Portekiz 🇵🇹',
  description = NULLIF('', ''),
  start_date = (E'2026-06-28 02:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 02:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kolombiya' || '%'
  AND events.title LIKE '%' || E'Portekiz' || '%'
  AND events.title ~ '[0-9] - [0-9]';


UPDATE public.events
SET
  title = E'🇨🇩 Kongo DC 3 - 1 Özbekistan 🇺🇿',
  description = NULLIF(E'Yoane Wissa 68'' (Penaltı), 90+1''
Fiston Mayele 78''

Eldor Shomurodov 10''', ''),
  start_date = (E'2026-06-28 02:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 02:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kongo DC' || '%'
  AND events.title LIKE '%' || E'Özbekistan' || '%'
  AND events.title ~ '[0-9] - [0-9]';


-- Son 32 (eleme turu)


UPDATE public.events
SET
  title = E'🇿🇦 Güney Afrika 0 - 1 Kanada 🇨🇦',
  description = NULLIF(E'Stephen Eustaquio 90+2''', ''),
  start_date = (E'2026-06-28 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-28 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Güney Afrika' || '%'
  AND events.title LIKE '%' || E'Kanada' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇧🇷 Brezilya 2 - 1 Japonya 🇯🇵',
  description = NULLIF(E'Casemiro 56''
Gabriel Martinelli 90+5''

Kaishu Sano 29''', ''),
  start_date = (E'2026-06-29 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-29 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Brezilya' || '%'
  AND events.title LIKE '%' || E'Japonya' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇩🇪 Almanya 1 - 1 Paraguay 🇵🇾',
  description = NULLIF(E'Kai Havertz 54''

Julio Enciso 42''', ''),
  start_date = (E'2026-06-29 23:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-29 23:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Almanya' || '%'
  AND events.title LIKE '%' || E'Paraguay' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇳🇱 Hollanda 1 - 1 Fas 🇲🇦',
  description = NULLIF(E'Cody Gakpo 72''

Issa Diop 90+1''', ''),
  start_date = (E'2026-06-30 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-30 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Hollanda' || '%'
  AND events.title LIKE '%' || E'Fas' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇨🇮 Fildişi Sahili 1 - 2 Norveç 🇳🇴',
  description = NULLIF(E'Amad Diallo 74''

Antonio Nusa 39''
Erling Haaland 86''', ''),
  start_date = (E'2026-06-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-06-30 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fildişi Sahili' || '%'
  AND events.title LIKE '%' || E'Norveç' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇫🇷 Fransa 3 - 0 İsveç 🇸🇪',
  description = NULLIF(E'Kylian Mbappé 45'', 74''
Bradley Barcola 53''', ''),
  start_date = (E'2026-07-01 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-01 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'İsveç' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇲🇽 Meksika 2 - 0 Ekvador 🇪🇨',
  description = NULLIF(E'Julián Quiñones 22''
Raúl Jiménez 31''', ''),
  start_date = (E'2026-07-01 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-01 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Meksika' || '%'
  AND events.title LIKE '%' || E'Ekvador' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 2 - 1 Kongo DC 🇨🇩',
  description = NULLIF(E'Harry Kane 75'', 86''

Brian Cipenga 7''', ''),
  start_date = (E'2026-07-01 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-01 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND events.title LIKE '%' || E'Kongo DC' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇧🇪 Belçika 3 - 2 Senegal 🇸🇳',
  description = NULLIF(E'Romelu Lukaku 86''
Youri Tielemans 89'', 120+5'' (Penaltı)

Habib Diarra 25''
Ismaïla Sarr 51''', ''),
  start_date = (E'2026-07-01 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-01 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Belçika' || '%'
  AND events.title LIKE '%' || E'Senegal' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇺🇸 ABD 2 - 0 Bosna-Hersek 🇧🇦',
  description = NULLIF(E'Folarin Balogun 45''
Malik Tillman 82''', ''),
  start_date = (E'2026-07-02 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-02 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'ABD' || '%'
  AND events.title LIKE '%' || E'Bosna-Hersek' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇪🇸 İspanya 3 - 0 Avusturya 🇦🇹',
  description = NULLIF(E'Mikel Oyarzabal 36'', 89''
Pedro Porro 66''', ''),
  start_date = (E'2026-07-02 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-02 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND events.title LIKE '%' || E'Avusturya' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇵🇹 Portekiz 2 - 1 Hırvatistan 🇭🇷',
  description = NULLIF(E'Cristiano Ronaldo 68'' (Penaltı)
Gonçalo Ramos 90+4''

Ivan Perišić 53''', ''),
  start_date = (E'2026-07-03 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-03 02:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Portekiz' || '%'
  AND events.title LIKE '%' || E'Hırvatistan' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇨🇭 İsviçre 2 - 0 Cezayir 🇩🇿',
  description = NULLIF(E'Breel Embolo 10''
Dan Ndoye 46''', ''),
  start_date = (E'2026-07-03 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-03 06:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İsviçre' || '%'
  AND events.title LIKE '%' || E'Cezayir' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇦🇺 Avustralya 1 - 1 Mısır 🇪🇬',
  description = NULLIF(E'Mohamed Hany 55'' (Kendi Kalesine)

Emam Ashour 13''', ''),
  start_date = (E'2026-07-03 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-03 21:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Avustralya' || '%'
  AND events.title LIKE '%' || E'Mısır' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇦🇷 Arjantin 3 - 2 Yeşil Burun Adaları 🇨🇻',
  description = NULLIF(E'Lionel Messi 29''
Lisandro Martínez 92''
Diney Borges 111'' (Kendi Kalesine)

Deroy Duarte 59''
Sidny Lopes Cabral 103''', ''),
  start_date = (E'2026-07-04 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-04 01:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND events.title LIKE '%' || E'Yeşil Burun' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇨🇴 Kolombiya 1 - 0 Gana 🇬🇭',
  description = NULLIF(E'Jhon Arias 14''', ''),
  start_date = (E'2026-07-04 04:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-04 04:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kolombiya' || '%'
  AND events.title LIKE '%' || E'Gana' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


-- Son 16 (eleme turu)


UPDATE public.events
SET
  title = E'🇨🇦 Kanada 0 - 3 Fas 🇲🇦',
  description = NULLIF(E'Azzedine Ounahi 50'', 82''
Soufiane Rahimi 90+8''', ''),
  start_date = (E'2026-07-04 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-04 20:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Kanada' || '%'
  AND events.title LIKE '%' || E'Fas' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇵🇾 Paraguay 0 - 1 Fransa 🇫🇷',
  description = NULLIF(E'Kylian Mbappé 70'' (Penaltı)', ''),
  start_date = (E'2026-07-05 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-05 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Paraguay' || '%'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇧🇷 Brezilya 1 - 2 Norveç 🇳🇴',
  description = NULLIF(E'Neymar 90+10'' (Penaltı)

Erling Haaland 79'', 90''', ''),
  start_date = (E'2026-07-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-05 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Brezilya' || '%'
  AND events.title LIKE '%' || E'Norveç' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇲🇽 Meksika 2 - 3 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿',
  description = NULLIF(E'Julián Quiñones 42''
Raúl Jiménez 69'' (Penaltı)

Jude Bellingham 36'', 38''
Harry Kane 60'' (Penaltı)', ''),
  start_date = (E'2026-07-06 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-06 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Meksika' || '%'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇵🇹 Portekiz 0 - 1 İspanya 🇪🇸',
  description = NULLIF(E'Mikel Merino 90+1''', ''),
  start_date = (E'2026-07-06 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-06 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Portekiz' || '%'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇺🇸 ABD 1 - 4 Belçika 🇧🇪',
  description = NULLIF(E'Malik Tillman 31''

Charles De Ketelaere 9'', 33''
Hans Vanaken 57''
Romelu Lukaku 90+3''', ''),
  start_date = (E'2026-07-07 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-07 03:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'ABD' || '%'
  AND events.title LIKE '%' || E'Belçika' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇦🇷 Arjantin 3 - 2 Mısır 🇪🇬',
  description = NULLIF(E'Cristian Romero 79''
Lionel Messi 83''
Enzo Fernández 90+2''

Yasser Ibrahim 15''
Mostafa Ziko 67''', ''),
  start_date = (E'2026-07-07 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-07 19:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND events.title LIKE '%' || E'Mısır' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇨🇭 İsviçre 0 - 0 Kolombiya 🇨🇴',
  description = NULL,
  start_date = (E'2026-07-07 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-07 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İsviçre' || '%'
  AND events.title LIKE '%' || E'Kolombiya' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


-- Çeyrek final


UPDATE public.events
SET
  title = E'🇫🇷 Fransa 2 - 0 Fas 🇲🇦',
  description = NULLIF(E'Kylian Mbappé 60''
Ousmane Dembélé 66''', ''),
  start_date = (E'2026-07-09 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-09 23:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'Fas' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇪🇸 İspanya 2 - 1 Belçika 🇧🇪',
  description = NULLIF(E'Fabián Ruiz 30''
Mikel Merino 88''

Charles De Ketelaere 41''', ''),
  start_date = (E'2026-07-10 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-10 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND events.title LIKE '%' || E'Belçika' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇦🇷 Arjantin 3 - 1 İsviçre 🇨🇭',
  description = NULLIF(E'Alexis Mac Allister 10''
Julián Alvarez 112''
Lautaro Martínez 120+1''

Dan Ndoye 67''', ''),
  start_date = (E'2026-07-12 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-12 04:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND events.title LIKE '%' || E'İsviçre' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🇳🇴 Norveç 1 - 2 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿',
  description = NULLIF(E'Andreas Schjelderup 36''

Jude Bellingham 45+2'', 93''', ''),
  start_date = (E'2026-07-12 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-12 00:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Norveç' || '%'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


-- Yarı final


UPDATE public.events
SET
  title = E'🇫🇷 Fransa - İspanya 🇪🇸',
  description = NULL,
  start_date = (E'2026-07-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-14 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'Fransa' || '%'
  AND events.title LIKE '%' || E'İspanya' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


UPDATE public.events
SET
  title = E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere - Arjantin 🇦🇷',
  description = NULL,
  start_date = (E'2026-07-15 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
  end_date = (E'2026-07-15 22:00:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  is_all_day = false
FROM public.categories c
WHERE events.category_id = c.id
  AND c.slug = 'dunya-kupasi'
  AND events.title LIKE '%' || E'İngiltere' || '%'
  AND events.title LIKE '%' || E'Arjantin' || '%'
  AND NOT (events.title ~ '[0-9] - [0-9]');


INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT cat.id, v.title, NULLIF(v.description, ''),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul'),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false, 'published', 'none', NULL
FROM public.categories cat
CROSS JOIN (VALUES

    (E'🇲🇽 Meksika 2 - 0 Güney Afrika 🇿🇦', E'Julián Quiñones 9''
Raúl Jiménez 67''', E'2026-06-11 22:00:00', E'Meksika', E'Güney Afrika'),
    (E'🇰🇷 Güney Kore 2 - 1 Çekya 🇨🇿', E'In-beom Hwang 67''
Hyeon-gyu Oh 80''

Ladislav Krejci 59''', E'2026-06-12 05:00:00', E'Güney Kore', E'Çekya'),
    (E'🇨🇿 Çekya 1 - 1 Güney Afrika 🇿🇦', E'Michal Sadílek 6''

Teboho Mokoena 83'' (Penaltı)', E'2026-06-18 19:00:00', E'Çekya', E'Güney Afrika'),
    (E'🇲🇽 Meksika 1 - 0 Güney Kore 🇰🇷', E'Luis Romo 50''', E'2026-06-19 04:00:00', E'Meksika', E'Güney Kore'),
    (E'🇨🇿 Çekya 0 - 3 Meksika 🇲🇽', E'Mateo Chávez 55''
Julián Quiñones 61''
Álvaro Fidalgo 90+4''', E'2026-06-25 04:00:00', E'Çekya', E'Meksika'),
    (E'🇿🇦 Güney Afrika 1 - 0 Güney Kore 🇰🇷', E'Thapelo Maseko 63''', E'2026-06-25 04:00:00', E'Güney Afrika', E'Güney Kore'),
    (E'🇨🇦 Kanada 1 - 1 Bosna-Hersek 🇧🇦', E'Cyle Larin 78''

Jovo Lukić 21''', E'2026-06-12 22:00:00', E'Kanada', E'Bosna-Hersek'),
    (E'🇶🇦 Katar 1 - 1 İsviçre 🇨🇭', E'Miro Muheim 90+4'' (Kendi Kalesine)

Breel Embolo 17'' (Penaltı)', E'2026-06-13 22:00:00', E'Katar', E'İsviçre'),
    (E'🇨🇭 İsviçre 4 - 1 Bosna-Hersek 🇧🇦', E'Johan Manzambi 74'', 90''
Rubén Vargas 84''
Granit Xhaka 90+7'' (Penaltı)

Ermin Mahmic 90+3''', E'2026-06-18 22:00:00', E'İsviçre', E'Bosna-Hersek'),
    (E'🇨🇦 Kanada 6 - 0 Katar 🇶🇦', E'Cyle Larin 16''
Jonathan David 29'', 45+3'', 90+2''
Nathan-Dylan Saliba 64''
Mohamed Manai 75'' (Kendi Kalesine)', E'2026-06-19 01:00:00', E'Kanada', E'Katar'),
    (E'🇨🇭 İsviçre 2 - 1 Kanada 🇨🇦', E'Rubén Vargas 46''
Johan Manzambi 57''

Promise David 76''', E'2026-06-24 22:00:00', E'İsviçre', E'Kanada'),
    (E'🇧🇦 Bosna-Hersek 3 - 1 Katar 🇶🇦', E'Kerim Alajbegovic 29''
Mahmoud Abunada 34'' (Kendi Kalesine)
Ermin Mahmic 80''

Hassan Al-Haydos 42''', E'2026-06-24 22:00:00', E'Bosna-Hersek', E'Katar'),
    (E'🇺🇸 ABD 4 - 1 Paraguay 🇵🇾', E'Damián Bobadilla 7'' (Kendi Kalesine)
Folarin Balogun 31'', 45+5''
Giovanni Reyna 90+8''

Mauricio 73''', E'2026-06-13 04:00:00', E'ABD', E'Paraguay'),
    (E'🇦🇺 Avustralya 2 - 0 Türkiye 🇹🇷', E'Nestory Irankunda 27''
Connor Metcalfe 75''', E'2026-06-14 07:00:00', E'Avustralya', E'Türkiye'),
    (E'🇺🇸 ABD 2 - 0 Avustralya 🇦🇺', E'Cameron Burgess 11'' (Kendi Kalesine)
Alex Freeman 43''', E'2026-06-19 22:00:00', E'ABD', E'Avustralya'),
    (E'🇹🇷 Türkiye 0 - 1 Paraguay 🇵🇾', E'Matías Galarza 2''', E'2026-06-20 06:00:00', E'Türkiye', E'Paraguay'),
    (E'🇹🇷 Türkiye 3 - 2 ABD 🇺🇸', E'Arda Güler 10''
Barış Alper Yılmaz 31''
Kaan Ayhan 90+8''

Auston Trusty 3''
Sebastian Berhalter 49''', E'2026-06-26 05:00:00', E'Türkiye', E'ABD'),
    (E'🇵🇾 Paraguay 0 - 0 Avustralya 🇦🇺', '', E'2026-06-26 05:00:00', E'Paraguay', E'Avustralya'),
    (E'🇩🇪 Almanya 7 - 1 Curaçao 🇨🇼', E'Felix Nmecha 6''
Nico Schlotterbeck 38''
Kai Havertz 45+5'' (Penaltı), 88''
Jamal Musiala 47''
Nathaniel Brown 68''
Deniz Undav 78''

Livano Comenencia 21''', E'2026-06-14 20:00:00', E'Almanya', E'Curaçao'),
    (E'🇨🇮 Fildişi Sahili 1 - 0 Ekvador 🇪🇨', E'Amad Diallo 90''', E'2026-06-15 02:00:00', E'Fildişi Sahili', E'Ekvador'),
    (E'🇩🇪 Almanya 2 - 1 Fildişi Sahili 🇨🇮', E'Deniz Undav 68'', 90+4''

Franck Kessié 30''', E'2026-06-20 23:00:00', E'Almanya', E'Fildişi Sahili'),
    (E'🇪🇨 Ekvador 0 - 0 Curaçao 🇨🇼', '', E'2026-06-21 03:00:00', E'Ekvador', E'Curaçao'),
    (E'🇪🇨 Ekvador 2 - 1 Almanya 🇩🇪', E'Nilson Angulo 9''
Gonzalo Plata 77''

Leroy Sané 2''', E'2026-06-25 23:00:00', E'Ekvador', E'Almanya'),
    (E'🇨🇼 Curaçao 0 - 2 Fildişi Sahili 🇨🇮', E'Nicolas Pépé 7'', 64''', E'2026-06-25 23:00:00', E'Curaçao', E'Fildişi Sahili'),
    (E'🇳🇱 Hollanda 2 - 2 Japonya 🇯🇵', E'Virgil van Dijk 51''
Crysencio Summerville 64''

Keito Nakamura 57''
Daichi Kamada 88''', E'2026-06-14 23:00:00', E'Hollanda', E'Japonya'),
    (E'🇸🇪 İsveç 5 - 1 Tunus 🇹🇳', E'Yasin Ayari 7'', 90+6''
Alexander Isak 30''
Viktor Gyökeres 59''
Mattias Svanberg 84''

Omar Rekik 43''', E'2026-06-15 05:00:00', E'İsveç', E'Tunus'),
    (E'🇳🇱 Hollanda 5 - 1 İsveç 🇸🇪', E'Brian Brobbey 5'', 17''
Cody Gakpo 47'', 54''
Crysencio Summerville 89''

Anthony Elanga 59''', E'2026-06-20 20:00:00', E'Hollanda', E'İsveç'),
    (E'🇹🇳 Tunus 0 - 4 Japonya 🇯🇵', E'Daichi Kamada 4''
Ayase Ueda 31'', 83''
Junya Ito 69''', E'2026-06-21 07:00:00', E'Tunus', E'Japonya'),
    (E'🇹🇳 Tunus 1 - 3 Hollanda 🇳🇱', E'Hazem Mastouri 54''

Ellyes Skhiri 3'' (Kendi Kalesine)
Brian Brobbey 7''
Jan Paul van Hecke 62''', E'2026-06-26 02:00:00', E'Tunus', E'Hollanda'),
    (E'🇯🇵 Japonya 1 - 1 İsveç 🇸🇪', E'Daizen Maeda 56''

Anthony Elanga 62''', E'2026-06-26 02:00:00', E'Japonya', E'İsveç'),
    (E'🇧🇪 Belçika 1 - 1 Mısır 🇪🇬', E'Mohamed Hany 66'' (Kendi Kalesine)

Emam Ashour 19''', E'2026-06-15 22:00:00', E'Belçika', E'Mısır'),
    (E'🇮🇷 İran 2 - 2 Yeni Zelanda 🇳🇿', E'Ramin Rezaeian 32''
Mohammad Mohebi 64''

Elijah Just 7'', 54''', E'2026-06-16 04:00:00', E'İran', E'Yeni Zelanda'),
    (E'🇧🇪 Belçika 0 - 0 İran 🇮🇷', '', E'2026-06-21 22:00:00', E'Belçika', E'İran'),
    (E'🇳🇿 Yeni Zelanda 1 - 3 Mısır 🇪🇬', E'Finn Surman 15''

Mostafa Ziko 58''
Mohamed Salah 67''
Trezeguet 82''', E'2026-06-22 04:00:00', E'Yeni Zelanda', E'Mısır'),
    (E'🇳🇿 Yeni Zelanda 1 - 5 Belçika 🇧🇪', E'Elijah Just 84''

Leandro Trossard 28'', 50''
Kevin De Bruyne 66''
Romelu Lukaku 86''
Alexis Saelemaekers 90+4''', E'2026-06-27 06:00:00', E'Yeni Zelanda', E'Belçika'),
    (E'🇪🇬 Mısır 1 - 1 İran 🇮🇷', E'Mahmoud Saber 5''

Ramin Rezaeian 14''', E'2026-06-27 06:00:00', E'Mısır', E'İran'),
    (E'🇪🇸 İspanya 0 - 0 Yeşil Burun Adaları 🇨🇻', '', E'2026-06-15 19:00:00', E'İspanya', E'Yeşil Burun Adaları'),
    (E'🇸🇦 Suudi Arabistan 1 - 1 Uruguay 🇺🇾', E'Abdulelah Al-Amri 41''

Maxi Araújo 80''', E'2026-06-16 01:00:00', E'Suudi Arabistan', E'Uruguay'),
    (E'🇪🇸 İspanya 4 - 0 Suudi Arabistan 🇸🇦', E'Lamine Yamal 10''
Mikel Oyarzabal 21'', 24''
Hassan Tambakti 49'' (Kendi Kalesine)', E'2026-06-21 19:00:00', E'İspanya', E'Suudi Arabistan'),
    (E'🇺🇾 Uruguay 2 - 2 Yeşil Burun Adaları 🇨🇻', E'Maxi Araújo 44''
Agustín Canobbio 45+6''

Kevin Pina 21''
Hélio Varela 61''', E'2026-06-22 01:00:00', E'Uruguay', E'Yeşil Burun Adaları'),
    (E'🇺🇾 Uruguay 0 - 1 İspanya 🇪🇸', E'Álex Baena 42''', E'2026-06-27 03:00:00', E'Uruguay', E'İspanya'),
    (E'🇨🇻 Yeşil Burun Adaları 0 - 0 Suudi Arabistan 🇸🇦', '', E'2026-06-27 03:00:00', E'Yeşil Burun Adaları', E'Suudi Arabistan'),
    (E'🇫🇷 Fransa 3 - 1 Senegal 🇸🇳', E'Kylian Mbappé 66'', 90+6''
Bradley Barcola 82''

Ibrahim Mbaye 90+5''', E'2026-06-16 22:00:00', E'Fransa', E'Senegal'),
    (E'🇮🇶 Irak 1 - 4 Norveç 🇳🇴', E'Aymen Hussein 39''

Erling Haaland 29'', 43''
Leo Østigård 76''
Aymen Hussein 90+6'' (Kendi Kalesine)', E'2026-06-17 01:00:00', E'Irak', E'Norveç'),
    (E'🇫🇷 Fransa 3 - 0 Irak 🇮🇶', E'Kylian Mbappé 14'', 54''
Ousmane Dembélé 66''', E'2026-06-23 00:00:00', E'Fransa', E'Irak'),
    (E'🇳🇴 Norveç 3 - 2 Senegal 🇸🇳', E'Marcus Pedersen 43''
Erling Haaland 48'', 58''

Ismaïla Sarr 53'', 90+3''', E'2026-06-23 03:00:00', E'Norveç', E'Senegal'),
    (E'🇳🇴 Norveç 1 - 4 Fransa 🇫🇷', E'Thelo Aasgaard 21''

Ousmane Dembélé 7'', 20'', 32''
Désiré Doué 90+4''', E'2026-06-26 22:00:00', E'Norveç', E'Fransa'),
    (E'🇸🇳 Senegal 5 - 0 Irak 🇮🇶', E'Habib Diarra 4''
Ismaïla Sarr 56''
Pape Gueye 59'', 71''
Iliman Ndiaye 82''', E'2026-06-26 22:00:00', E'Senegal', E'Irak'),
    (E'🇦🇷 Arjantin 3 - 0 Cezayir 🇩🇿', E'Lionel Messi 17'', 60'', 76''', E'2026-06-17 04:00:00', E'Arjantin', E'Cezayir'),
    (E'🇦🇹 Avusturya 3 - 1 Ürdün 🇯🇴', E'Romano Schmid 21''
Yazan Al-Arab 76'' (Kendi Kalesine)
Marko Arnautovic 90+12'' (Penaltı)

Ali Olwan 50''', E'2026-06-17 07:00:00', E'Avusturya', E'Ürdün'),
    (E'🇦🇷 Arjantin 2 - 0 Avusturya 🇦🇹', E'Lionel Messi 38'', 90+5''', E'2026-06-22 20:00:00', E'Arjantin', E'Avusturya'),
    (E'🇯🇴 Ürdün 1 - 2 Cezayir 🇩🇿', E'Nizar Al-Rashdan 36''

Nadhir Benbouali 69''
Amine Gouiri 82''', E'2026-06-23 06:00:00', E'Ürdün', E'Cezayir'),
    (E'🇯🇴 Ürdün 1 - 3 Arjantin 🇦🇷', E'Mousa Tamari 55''

Giovani Lo Celso 19''
Lautaro Martínez 31'' (Penaltı)
Lionel Messi 80''', E'2026-06-28 05:00:00', E'Ürdün', E'Arjantin'),
    (E'🇩🇿 Cezayir 3 - 3 Avusturya 🇦🇹', E'Rafik Belghali 45''
Riyad Mahrez 60'', 90+3''

Marko Arnautovic 28''
Marcel Sabitzer 55''
Sasa Kalajdzic 90+6''', E'2026-06-28 05:00:00', E'Cezayir', E'Avusturya'),
    (E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 4 - 2 Hırvatistan 🇭🇷', E'Harry Kane 12'' (Penaltı), 42''
Jude Bellingham 47''
Marcus Rashford 85''

Martin Baturina 36''
Petar Musa 45+5''', E'2026-06-17 23:00:00', E'İngiltere', E'Hırvatistan'),
    (E'🇬🇭 Gana 1 - 0 Panama 🇵🇦', E'Caleb Yirenkyi 90+5''', E'2026-06-18 02:00:00', E'Gana', E'Panama'),
    (E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 0 - 0 Gana 🇬🇭', '', E'2026-06-23 23:00:00', E'İngiltere', E'Gana'),
    (E'🇵🇦 Panama 0 - 1 Hırvatistan 🇭🇷', E'Ante Budimir 54''', E'2026-06-24 02:00:00', E'Panama', E'Hırvatistan'),
    (E'🇵🇦 Panama 0 - 2 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿', E'Jude Bellingham 62''
Harry Kane 67''', E'2026-06-28 00:00:00', E'Panama', E'İngiltere'),
    (E'🇭🇷 Hırvatistan 2 - 1 Gana 🇬🇭', E'Petar Sučić 31''
Nikola Vlašić 83''

Derrick Luckassen 73''', E'2026-06-28 00:00:00', E'Hırvatistan', E'Gana'),
    (E'🇧🇷 Brezilya 1 - 1 Fas 🇲🇦', E'Vinicius Junior 32''

Ismael Saibari 21''', E'2026-06-14 01:00:00', E'Brezilya', E'Fas'),
    (E'🇭🇹 Haiti 0 - 1 İskoçya 🏴󠁧󠁢󠁳󠁣󠁴󠁿', E'John McGinn 28''', E'2026-06-14 04:00:00', E'Haiti', E'İskoçya'),
    (E'🏴󠁧󠁢󠁳󠁣󠁴󠁿 İskoçya 0 - 1 Fas 🇲🇦', E'Ismael Saibari 2''', E'2026-06-20 01:00:00', E'İskoçya', E'Fas'),
    (E'🇧🇷 Brezilya 3 - 0 Haiti 🇭🇹', E'Matheus Cunha 23'', 36''
Vinicius Junior 45+3''', E'2026-06-20 03:30:00', E'Brezilya', E'Haiti'),
    (E'🏴󠁧󠁢󠁳󠁣󠁴󠁿 İskoçya 0 - 3 Brezilya 🇧🇷', E'Vinicius Junior 7'', 45+3''
Matheus Cunha 60''', E'2026-06-25 01:00:00', E'İskoçya', E'Brezilya'),
    (E'🇲🇦 Fas 4 - 2 Haiti 🇭🇹', E'Achraf Hakimi 39''
Ismael Saibari 45+1''
Soufiane Rahimi 78''
Gessime Yassine 89''

Yassine Bounou 10'' (Kendi Kalesine)
Wilson Isidor 43''', E'2026-06-25 01:00:00', E'Fas', E'Haiti'),
    (E'🇵🇹 Portekiz 1 - 1 Kongo DC 🇨🇩', E'João Neves 6''

Yoane Wissa 45+5''', E'2026-06-17 20:00:00', E'Portekiz', E'Kongo DC'),
    (E'🇺🇿 Özbekistan 1 - 3 Kolombiya 🇨🇴', E'Abbosbek Fayzullaev 60''

Daniel Muñoz 40''
Luis Díaz 65''
Jáminton Campaz 90+9''', E'2026-06-18 05:00:00', E'Özbekistan', E'Kolombiya'),
    (E'🇵🇹 Portekiz 5 - 0 Özbekistan 🇺🇿', E'Cristiano Ronaldo 6'', 39''
Nuno Mendes 17''
Abduvokhid Nematov 60'' (Kendi Kalesine)
Rafael Leão 87''', E'2026-06-23 20:00:00', E'Portekiz', E'Özbekistan'),
    (E'🇨🇴 Kolombiya 1 - 0 Kongo DC 🇨🇩', E'Daniel Muñoz 76''', E'2026-06-24 05:00:00', E'Kolombiya', E'Kongo DC'),
    (E'🇨🇴 Kolombiya 0 - 0 Portekiz 🇵🇹', '', E'2026-06-28 02:30:00', E'Kolombiya', E'Portekiz'),
    (E'🇨🇩 Kongo DC 3 - 1 Özbekistan 🇺🇿', E'Yoane Wissa 68'' (Penaltı), 90+1''
Fiston Mayele 78''

Eldor Shomurodov 10''', E'2026-06-28 02:30:00', E'Kongo DC', E'Özbekistan'),
    (E'🇿🇦 Güney Afrika 0 - 1 Kanada 🇨🇦', E'Stephen Eustaquio 90+2''', E'2026-06-28 22:00:00', E'Güney Afrika', E'Kanada'),
    (E'🇧🇷 Brezilya 2 - 1 Japonya 🇯🇵', E'Casemiro 56''
Gabriel Martinelli 90+5''

Kaishu Sano 29''', E'2026-06-29 20:00:00', E'Brezilya', E'Japonya'),
    (E'🇩🇪 Almanya 1 - 1 Paraguay 🇵🇾', E'Kai Havertz 54''

Julio Enciso 42''', E'2026-06-29 23:30:00', E'Almanya', E'Paraguay'),
    (E'🇳🇱 Hollanda 1 - 1 Fas 🇲🇦', E'Cody Gakpo 72''

Issa Diop 90+1''', E'2026-06-30 04:00:00', E'Hollanda', E'Fas'),
    (E'🇨🇮 Fildişi Sahili 1 - 2 Norveç 🇳🇴', E'Amad Diallo 74''

Antonio Nusa 39''
Erling Haaland 86''', E'2026-06-30 20:00:00', E'Fildişi Sahili', E'Norveç'),
    (E'🇫🇷 Fransa 3 - 0 İsveç 🇸🇪', E'Kylian Mbappé 45'', 74''
Bradley Barcola 53''', E'2026-07-01 00:00:00', E'Fransa', E'İsveç'),
    (E'🇲🇽 Meksika 2 - 0 Ekvador 🇪🇨', E'Julián Quiñones 22''
Raúl Jiménez 31''', E'2026-07-01 04:00:00', E'Meksika', E'Ekvador'),
    (E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere 2 - 1 Kongo DC 🇨🇩', E'Harry Kane 75'', 86''

Brian Cipenga 7''', E'2026-07-01 19:00:00', E'İngiltere', E'Kongo DC'),
    (E'🇧🇪 Belçika 3 - 2 Senegal 🇸🇳', E'Romelu Lukaku 86''
Youri Tielemans 89'', 120+5'' (Penaltı)

Habib Diarra 25''
Ismaïla Sarr 51''', E'2026-07-01 23:00:00', E'Belçika', E'Senegal'),
    (E'🇺🇸 ABD 2 - 0 Bosna-Hersek 🇧🇦', E'Folarin Balogun 45''
Malik Tillman 82''', E'2026-07-02 03:00:00', E'ABD', E'Bosna-Hersek'),
    (E'🇪🇸 İspanya 3 - 0 Avusturya 🇦🇹', E'Mikel Oyarzabal 36'', 89''
Pedro Porro 66''', E'2026-07-02 22:00:00', E'İspanya', E'Avusturya'),
    (E'🇵🇹 Portekiz 2 - 1 Hırvatistan 🇭🇷', E'Cristiano Ronaldo 68'' (Penaltı)
Gonçalo Ramos 90+4''

Ivan Perišić 53''', E'2026-07-03 02:00:00', E'Portekiz', E'Hırvatistan'),
    (E'🇨🇭 İsviçre 2 - 0 Cezayir 🇩🇿', E'Breel Embolo 10''
Dan Ndoye 46''', E'2026-07-03 06:00:00', E'İsviçre', E'Cezayir'),
    (E'🇦🇺 Avustralya 1 - 1 Mısır 🇪🇬', E'Mohamed Hany 55'' (Kendi Kalesine)

Emam Ashour 13''', E'2026-07-03 21:00:00', E'Avustralya', E'Mısır'),
    (E'🇦🇷 Arjantin 3 - 2 Yeşil Burun Adaları 🇨🇻', E'Lionel Messi 29''
Lisandro Martínez 92''
Diney Borges 111'' (Kendi Kalesine)

Deroy Duarte 59''
Sidny Lopes Cabral 103''', E'2026-07-04 01:00:00', E'Arjantin', E'Yeşil Burun Adaları'),
    (E'🇨🇴 Kolombiya 1 - 0 Gana 🇬🇭', E'Jhon Arias 14''', E'2026-07-04 04:30:00', E'Kolombiya', E'Gana'),
    (E'🇨🇦 Kanada 0 - 3 Fas 🇲🇦', E'Azzedine Ounahi 50'', 82''
Soufiane Rahimi 90+8''', E'2026-07-04 20:00:00', E'Kanada', E'Fas'),
    (E'🇵🇾 Paraguay 0 - 1 Fransa 🇫🇷', E'Kylian Mbappé 70'' (Penaltı)', E'2026-07-05 00:00:00', E'Paraguay', E'Fransa'),
    (E'🇧🇷 Brezilya 1 - 2 Norveç 🇳🇴', E'Neymar 90+10'' (Penaltı)

Erling Haaland 79'', 90''', E'2026-07-05 23:00:00', E'Brezilya', E'Norveç'),
    (E'🇲🇽 Meksika 2 - 3 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿', E'Julián Quiñones 42''
Raúl Jiménez 69'' (Penaltı)

Jude Bellingham 36'', 38''
Harry Kane 60'' (Penaltı)', E'2026-07-06 03:00:00', E'Meksika', E'İngiltere'),
    (E'🇵🇹 Portekiz 0 - 1 İspanya 🇪🇸', E'Mikel Merino 90+1''', E'2026-07-06 22:00:00', E'Portekiz', E'İspanya'),
    (E'🇺🇸 ABD 1 - 4 Belçika 🇧🇪', E'Malik Tillman 31''

Charles De Ketelaere 9'', 33''
Hans Vanaken 57''
Romelu Lukaku 90+3''', E'2026-07-07 03:00:00', E'ABD', E'Belçika'),
    (E'🇦🇷 Arjantin 3 - 2 Mısır 🇪🇬', E'Cristian Romero 79''
Lionel Messi 83''
Enzo Fernández 90+2''

Yasser Ibrahim 15''
Mostafa Ziko 67''', E'2026-07-07 19:00:00', E'Arjantin', E'Mısır'),
    (E'🇨🇭 İsviçre 0 - 0 Kolombiya 🇨🇴', '', E'2026-07-07 23:00:00', E'İsviçre', E'Kolombiya'),
    (E'🇫🇷 Fransa 2 - 0 Fas 🇲🇦', E'Kylian Mbappé 60''
Ousmane Dembélé 66''', E'2026-07-09 23:00:00', E'Fransa', E'Fas'),
    (E'🇪🇸 İspanya 2 - 1 Belçika 🇧🇪', E'Fabián Ruiz 30''
Mikel Merino 88''

Charles De Ketelaere 41''', E'2026-07-10 22:00:00', E'İspanya', E'Belçika'),
    (E'🇳🇴 Norveç 1 - 2 İngiltere 🏴󠁧󠁢󠁥󠁮󠁧󠁿', E'Andreas Schjelderup 36''

Jude Bellingham 45+2'', 93''', E'2026-07-12 00:00:00', E'Norveç', E'İngiltere'),
    (E'🇦🇷 Arjantin 3 - 1 İsviçre 🇨🇭', E'Alexis Mac Allister 10''
Julián Alvarez 112''
Lautaro Martínez 120+1''

Dan Ndoye 67''', E'2026-07-12 04:00:00', E'Arjantin', E'İsviçre')

) AS v(title, description, local_start, home_name, away_name)
WHERE cat.slug = 'dunya-kupasi'
  AND NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.category_id = cat.id
      AND e.title LIKE '%' || v.home_name || '%'
      AND e.title LIKE '%' || v.away_name || '%'
      AND e.title ~ '[0-9] - [0-9]'
  );


INSERT INTO public.events (
  category_id, title, description, start_date, end_date, is_all_day, status, recurrence, subject_id
)
SELECT cat.id, v.title, NULL,
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul'),
  (v.local_start::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
  false, 'published', 'none', NULL
FROM public.categories cat
CROSS JOIN (VALUES
    (E'🇫🇷 Fransa - İspanya 🇪🇸', E'2026-07-14 22:00:00'),
    (E'🏴󠁧󠁢󠁥󠁮󠁧󠁿 İngiltere - Arjantin 🇦🇷', E'2026-07-15 22:00:00')
) AS v(title, local_start)
WHERE cat.slug = 'dunya-kupasi'
  AND NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.category_id = cat.id
      AND e.title = v.title
  );


-- Maç bitiş saatleri: normal +2h30m, uzatma +3h15m, eleme beraberlik (penaltı) +3h30m, oynanmamış eleme +3h
UPDATE public.events e
SET end_date = e.start_date + CASE
  WHEN e.title !~ '[0-9] - [0-9]' THEN interval '3 hours'
  WHEN e.description ~ '(^|[\n, ])(9[2-9]|1[0-2][0-9])(\+[0-9]+)?''' THEN interval '3 hours 15 minutes'
  WHEN e.title ~ '[0-9]+ - [0-9]+'
    AND (regexp_match(e.title, '([0-9]+) - ([0-9]+)'))[1] = (regexp_match(e.title, '([0-9]+) - ([0-9]+)'))[2]
    AND e.start_date AT TIME ZONE 'Europe/Istanbul' >= '2026-06-28' THEN interval '3 hours 30 minutes'
  ELSE interval '2 hours 30 minutes'
END
FROM public.categories c
WHERE e.category_id = c.id
  AND c.slug = 'dunya-kupasi';
