# Weekly fixture sync — 2026-08-16

- Invoked: 2026-08-16 21:37 (`Europe/Istanbul`)
- Window: 2026-08-16 → 2026-08-23
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.sporx.com/besiktas-eyupspor-maci-canli-5904711 — Beşiktaş–Eyüpspor canlı ~7'; 0-0; kickoff 21:30 TR
- http://www.tff.org/default.aspx?ftxtID=51102&pageID=201 — TFF 2–3. hafta duyurusu (7.08.2026); Alanyaspor–BJK yalnızca Konferans Ligi play-off olursa 22.08’e alınır
- https://www.aksam.com.tr/spor/super-ligde-2-ve-3-haftanin-programi-aciklandi/haber-1688815 — TFF 2. hafta: Erzurumspor–GS 21.08 21:30; FB–Konyaspor 22.08 21:30; TS–Başakşehir 23.08 19:00; Alanyaspor–BJK 23.08 21:30
- https://www.takvim.com.tr/spor/2026/08/07/super-ligde-2-ve-3-haftanin-programi-aciklandi — aynı TFF programı
- https://www.star.com.tr/spor/tff-acikladi-super-ligde-2-ve-3-haftanin-programi-belli-oldu-haber-2032710/ — aynı TFF programı
- https://www.fotomac.com.tr/fenerbahce/2026/08/12/fenerbahce-lyon-sampiyonlar-ligi-maci-saat-kacta-hangi-kanalda — FB–Lyon UCL play-off 18.08 22:00 (DB’de yok)
- https://www.birgun.net/haber/besiktas-kauno-zalgiris-maci-hangi-gun-saat-kacta-ve-hangi-kanalda-uefa-avrupa-ligi-play-off-729450 — BJK–Kauno Žalgiris 20.08 20:00 (DB’de yok)

## Events checked

| Event                        | Kickoff (DB)     | Kickoff (source) | Status    | Action         |
| ---------------------------- | ---------------- | ---------------- | --------- | -------------- |
| Beşiktaş - Eyüpspor          | 2026-08-16 21:30 | 2026-08-16 21:30 | live 0-0  | none           |
| Erzurumspor FK - Galatasaray | 2026-08-23 12:00 | 2026-08-21 21:30 | scheduled | update kickoff |
| Fenerbahçe - Konyaspor       | 2026-08-23 12:00 | 2026-08-22 21:30 | scheduled | update kickoff |
| Trabzonspor - Başakşehir     | 2026-08-23 12:00 | 2026-08-23 19:00 | scheduled | update kickoff |
| Alanyaspor - Beşiktaş        | 2026-08-23 12:00 | 2026-08-23 21:30 | scheduled | update kickoff |

## Migrations

- `supabase/migrations/20260816214000_update_erzurumspor_galatasaray_kickoff.sql` — 23.08 12:00 → 21.08 21:30 (apply_migration OK)
- `supabase/migrations/20260816214001_update_fenerbahce_konyaspor_kickoff.sql` — 23.08 12:00 → 22.08 21:30 (apply_migration OK)
- `supabase/migrations/20260816214002_update_trabzonspor_basaksehir_kickoff.sql` — 23.08 12:00 → 23.08 19:00 (apply_migration OK)
- `supabase/migrations/20260816214003_update_alanyaspor_besiktas_kickoff.sql` — 23.08 12:00 → 23.08 21:30 (apply_migration OK)

## Skipped

- Beşiktaş - Eyüpspor — not finished (live); no result fields

## Notes

- Window: **5** timed events for the five categories; no UCL events already in DB.
- Beşiktaş–Eyüpspor kickoff TFF/Sporx ile uyumlu; sonuç yazılmadı.
- 2. hafta 12:00 placeholder’ları TFF programına çekildi. Alanyaspor–BJK TFF’de Pazar 21:30; Konferans Ligi şartı gerçekleşmedi (BJK Avrupa Ligi play-off).
- Yeni maç eklenmedi (out of scope): Fenerbahçe–Lyon 18.08 22:00; Beşiktaş–Kauno Žalgiris 20.08 20:00.
- 4 changed (kickoff), 1 unchanged (live), 0 skipped for source ambiguity.

## Run 22:16 TR

Catch-up: 15.08 matches were outside the 16→23 window on the first pass; user asked to update them.

### Sources

- https://www.aa.com.tr/tr/spor/kasimpasa-evinde-trabzonspor-ile-1-1-berabere-kaldi/4028397 — Kasımpaşa 1-1 Trabzonspor; Saviolo 42'; Benedyczak 55' (Penaltı)
- https://www.star.com.tr/spor/mac-sonucu-kasimpasa-1-trabzonspor-1-haber-2034098/ — aynı skor; Goller: Dk. 42 Saviolo, Dk. 55 Benedyczak
- https://www.ntvspor.net/futbol/galeri-genclerbirligi-fenerbahce-canli-anlatim-427951 — Gençlerbirliği 2-1 Fenerbahçe; Talisca 13'; Tongya 37'; Oğulcan Ülgün 56'
- https://www.haberturk.com/spor/genclerbirligi-fenerbahce-maci-canli-anlatim-fb-genclerbirligi-super-lig-1-hafta-maci-kac-kac-mac-sk-3905768 — aynı skor ve dakikalar

### Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Kasımpaşa - Trabzonspor     | 2026-08-15 19:00 | 2026-08-15 19:00 | finished 1-1 | update result |
| Gençlerbirliği - Fenerbahçe | 2026-08-15 21:30 | 2026-08-15 21:30 | finished 2-1 | update result |

### Migrations

- `supabase/migrations/20260816221600_update_kasimpasa_trabzonspor_result.sql` — title `Kasımpaşa 1 - 1 Trabzonspor`; Benedyczak 55' (Penaltı); Saviolo 42' (apply_migration OK)
- `supabase/migrations/20260816221601_update_genclerbirligi_fenerbahce_result.sql` — title `Gençlerbirliği 2 - 1 Fenerbahçe`; Tongya 37'; Ülgün 56'; Talisca 13' (apply_migration OK)

## Run 23:24 TR

Today’s match: Beşiktaş–Eyüpspor, now FT.

### Sources

- https://spor.haber7.com/canli-anlatim/1891-besiktas-jk-eyupspor — FT 1-0; Vaclav Cerny 25'; David Costa 68' ikinci sarı/kırmızı
- https://www.yenisafak.com/spor/besiktas-eyupspor-canli-mac-izle-besiktas-eyupspor-maci-kac-kac-4848548 — aynı skor; Cerny 25'; Costa 68' kırmızı
- https://www.sporx.com/besiktas-eyupspor-maci-canli-5904711 — MS 1-0 (İY 1-0); Cerny 25'

### Events checked

| Event               | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Beşiktaş - Eyüpspor | 2026-08-16 21:30 | 2026-08-16 21:30 | finished 1-0 | update result |

### Migrations

- `supabase/migrations/20260816232500_update_besiktas_eyupspor_result.sql` — title `Beşiktaş 1 - 0 Eyüpspor`; Cerny 25'; Costa 68' kırmızı (apply_migration OK)
