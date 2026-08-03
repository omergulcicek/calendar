# Etkinlik Ekleme ve Güncelleme Kuralları

Bu belge, Takvim projesinde Supabase’e etkinlik eklerken / skor-gol güncellerken uyulacak **şablon kural setidir**. Kaynak: mevcut migration kalıpları + `docs/MEMORIES.md`.

> **Uygulama yolu:** `supabase/migrations/YYYYMMDDHHMMSS_<fiil>_<slug>.sql` yaz → remote’a `apply_migration` ile uygula.  
> Eski stil (`events.category_id`) kullanma; her zaman `event_categories` junction kullan.

---

## 1. Genel kurallar

| Kural      | Açıklama                                                                          |
| ---------- | --------------------------------------------------------------------------------- |
| Timezone   | Timed maçlar: `('YYYY-MM-DD HH:MM:SS'::timestamp AT TIME ZONE 'Europe/Istanbul')` |
| Süre (maç) | `end_date = start_date + interval '2 hours'` (uzatma varsa ayrıca uzat)           |
| Status     | `'published'`                                                                     |
| Idempotent | `NOT EXISTS` (title ± start_date) + `ON CONFLICT DO NOTHING` (junction)           |
| Saat yoksa | **12:00** placeholder (`Europe/Istanbul`); saat netleşince `UPDATE` et            |
| Dil        | Title/description Türkçe; kulüp adları ekrandaki / resmi yazıma sadık             |

### Migration dosya adı

```text
YYYYMMDDHHMMSS_<fiil>_<konu>.sql
```

| Fiil                   | Ne zaman                   |
| ---------------------- | -------------------------- |
| `add_`                 | Yeni etkinlik              |
| `update_*_result`      | Maç sonucu (skor + goller) |
| `update_*_description` | Açıklama düzeltmesi        |
| `fix_`                 | Küçük hata düzeltmesi      |
| `replace_`             | Rakip / maç değişimi       |

Dosya başında kısa Türkçe yorum satırı yaz.

---

## 2. Futbol maçı ekleme

### 2.1 Title (maç öncesi)

```text
Ev Sahibi - Deplasman
```

Örnekler: `Galatasaray - Çorum`, `Hradec Králové - Beşiktaş`, `Fenerbahçe - Sturm Graz`

Skor **yazılmaz**.

### 2.2 Description (maç öncesi)

| Turnuva                | Description                                                   |
| ---------------------- | ------------------------------------------------------------- |
| Süper Lig              | **`NULL`** — yazma                                            |
| Avrupa Ligi eleme      | `'Avrupa Ligi … eleme turu ilk maç'` / `'… rövanş maçı'`      |
| Şampiyonlar Ligi eleme | `'Şampiyonlar Ligi … eleme turu ilk maç'` / `'… rövanş maçı'` |

### 2.3 Kategori bağlama

| Maç türü         | `event_categories` slug’ları                                                                                                  |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Süper Lig        | İlgili kulüp(ler): `galatasaray` \| `fenerbahce` \| `besiktas` \| `trabzonspor` — derbide her iki kulüp aynı event’e bağlanır |
| Şampiyonlar Ligi | Kulüp **+** `sampiyonlar-ligi`                                                                                                |
| Avrupa Ligi      | Şimdilik sadece kulüp (`avrupa-ligi` kategorisi yok)                                                                          |
| Dünya Kupası     | `dunya-kupasi`                                                                                                                |

> Ayrı bir **Süper Lig** kategorisi yok.

### 2.4 Şablon SQL (maç)

```sql
-- Kısa açıklama: hangi maç / turnuva

WITH inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  SELECT
    'Ev Sahibi - Deplasman',
    NULL, -- veya Avrupa/ŞL tur metni
    ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  WHERE NOT EXISTS (
    SELECT 1 FROM public.events e
    WHERE e.title = 'Ev Sahibi - Deplasman'
      AND e.start_date = ('2026-08-14 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul')
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, c.id
FROM inserted
CROSS JOIN public.categories c
WHERE c.slug IN ('kulup-slug') -- ŞL ise: IN ('kulup-slug', 'sampiyonlar-ligi')
ON CONFLICT DO NOTHING;
```

### 2.5 Checklist (yeni maç)

1. Title: `Ev - Dep` (skorsuz)
2. Saat net mi? Değilse `12:00` placeholder
3. `Europe/Istanbul` + `+ 2 hours`
4. Süper Lig → `description NULL`, yalnız kulüp
5. ŞL → tur description + kulüp + `sampiyonlar-ligi`
6. `NOT EXISTS` + `ON CONFLICT DO NOTHING`
7. `is_all_day = false`, `recurrence = 'none'`, `status = 'published'`

---

## 3. Maç sonucu ve gol ekleme

Maç bitince **yeni satır ekleme**; mevcut event’i `UPDATE` et.

### 3.1 Title (maç sonrası)

```text
Ev Sahibi <ev_gol> - <dep_gol> Deplasman
```

Örnek: `Beşiktaş 1 - 0 FC Midtjylland`, `FC Midtjylland 0 - 2 Beşiktaş`

### 3.2 Description (gol listesi)

Format (escape string `E'...'`):

```text
<Ev sahibi golcüleri, her satırda bir kayıt>

<boş satır>

<Deplasman golcüleri, her satırda bir kayıt>
```

Satır kalıbı:

```text
Oyuncu Adı <dakika>''
Oyuncu Adı <dakika>'' (Penaltı)
Oyuncu Adı <dakika>'' (Kırmızı kart)
Oyuncu Adı 37'', 45+1'', 87'' (Penaltı)   -- aynı oyuncu birden fazla
```

Kurallar:

| Kural            | Detay                                                                            |
| ---------------- | -------------------------------------------------------------------------------- |
| Apostrof         | SQL’de dakika: `37''` → görünen `37'`                                            |
| Sıra             | Önce ev sahibi golleri, boş satır, sonra deplasman                               |
| Annotasyon       | `(Penaltı)`, `(Kırmızı kart)`, kendi kalesine: `(kk)`                            |
| Gol yok          | `description = NULL` (`NULLIF(E'', '')`)                                         |
| Tur metni        | Sonuç gelince tur description’ı **gol listesiyle değiştirilir**                  |
| Idempotent WHERE | Eski title **veya** skorlu title: `WHERE title = 'A - B' OR title = 'A 1 - 0 B'` |

### 3.3 Şablon SQL (sonuç)

```sql
-- Ev Sahibi X - Y Deplasman (Turnuva)

UPDATE public.events
SET
  title = 'Ev Sahibi 1 - 0 Deplasman',
  description = NULLIF(E'Golcü 26''

Rakip Golcü 70'' (Penaltı)', '')
WHERE title = 'Ev Sahibi - Deplasman'
   OR title = 'Ev Sahibi 1 - 0 Deplasman';
```

### 3.4 Dünya Kupası farkları

- Title’da bayrak: `🇫🇷 Fransa 0 - 2 İspanya 🇪🇸`
- Uzatma / penaltı: `end_date` 2 saatten uzun olabilir (`2 hours 30 minutes`, `3 hours 15 minutes`)
- WHERE: kategori + takım `LIKE` + henüz skorsuz: `NOT (title ~ '[0-9] - [0-9]')`

---

## 4. Önemli şahsiyetler (`onemli-sahsiyetler`)

1. `subjects` ekle (biyografi + `source_url`, genelde Wikipedia)
2. Yıldönümü event(leri) ekle → `event_categories` ile kategoriye bağla

### Title

| Tür   | Title                    | `kind`  |
| ----- | ------------------------ | ------- |
| Doğum | `{Ad}: Doğum Yıl Dönümü` | `birth` |
| Vefat | `{Ad}: Vefat Yıl Dönümü` | `death` |

### Tarih (all-day, Gregorian)

İstanbul gününü UTC+3 penceresiyle yaz:

```text
start: 'YYYY-MM-DD 21:00:00+00'   -- TR gece 00:00 (önceki gün 21:00 UTC)
end:   'YYYY-MM-DD+1 20:59:59+00'
is_all_day: true
recurrence: 'yearly'
```

### Diğer

- Event `description`: genelde `NULL` (metin subject’te)
- Subject description’da **tarih tekrarı yok** (tarih event’ten belli)
- `subject_id` zorunlu

---

## 5. Tarihi olaylar (`tarihi-olaylar`)

1. Subject (olay adı + anlatım + kaynak)
2. Event: title çoğu zaman subject adı veya `… Anma Günü`
3. `kind = 'commemoration'` (savaş başlangıç/bitiş için `start` / `end`)
4. `calendar_system = 'gregorian'`, `recurrence = 'yearly'`, `is_all_day = true`
5. Event description genelde `NULL`

Subject yoksa insert et; varsa id’yi `UNION ALL` ile al (bkz. Kanije migration).

---

## 6. Dini / kültürel günler (özet)

| Kategori                   | Tipik alanlar                                     |
| -------------------------- | ------------------------------------------------- |
| `dini-gunler`              | Hicri; `recurrence = 'hijri_yearly'`; subject yok |
| `islam-tarihi`             | Hicri anmalar                                     |
| `milli-ve-kulturel-gunler` | All-day yearly; subject genelde yok               |

Hicri günlerde `start_date`/`end_date` çoğu zaman override tablosuyla yönetilir; yeni eklemeden önce mevcut dini-gün migration’larına bak.

---

## 7. Alan özeti

| Alan               | Maç (saatli)               | Yıldönümü / anma                        |
| ------------------ | -------------------------- | --------------------------------------- |
| `title`            | Ev - Dep / skorlu          | `{Ad}: … Yıl Dönümü` veya olay adı      |
| `description`      | Tur / goller / `NULL` (SL) | Genelde `NULL`                          |
| `start` / `end`    | Istanbul + 2s              | All-day UTC penceresi                   |
| `is_all_day`       | `false`                    | `true`                                  |
| `recurrence`       | `none`                     | `yearly`                                |
| `event_categories` | Kulüp ± turnuva            | Kategori slug                           |
| `subject_id`       | —                          | Var                                     |
| `kind`             | —                          | `birth` / `death` / `commemoration` / … |
| `calendar_system`  | (default)                  | `gregorian` veya `hijri`                |

---

## 8. Yeni kategori eklerken

SQL’de kategori seed’inin yanı sıra UI’ı da güncelle:

- `src/features/calendar/helpers/categories.ts` → renk map
- `src/features/calendar/helpers/category-groups.ts` → grup sırası

---

## 9. İş akışı (agent / insan)

1. Kullanıcı ekran görüntüsü / veri verir → önce **kısa text özet** (ne eklenecek)
2. Onay sonrası migration yaz + remote’a uygula
3. `SELECT` ile title, saat (TR), kategori, description doğrula
4. Süper Lig / özel kararları gerekirse `docs/MEMORIES.md` Evolution’a not düş

### Hızlı karar tablosu

| Durum                  | Ne yap                                          |
| ---------------------- | ----------------------------------------------- |
| Süper Lig maçı         | Description yok; yalnız kulüp                   |
| Avrupa / ŞL eleme      | Tur description; ŞL’de + `sampiyonlar-ligi`     |
| Saat yok               | `12:00` placeholder; netleşince güncelle        |
| Maç bitti              | `update_*_result`: skor title + gol description |
| Şahsiyet / tarihi olay | Subject + yearly all-day event                  |
| Rakip değişti          | `replace_`: eskiyi sil, yeniyi ekle             |
