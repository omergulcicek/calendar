# Weekly fixture sync — 2026-08-11

- Invoked: 2026-08-11 23:21 (`Europe/Istanbul`)
- Window: 2026-08-11 → 2026-08-18
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.fanatik.com.tr/fenerbahce/live-ve-fenerbahce-sampiyonlar-liginde-play-offta-avusturyada-tek-gollu-galibiyet-mac-ozeti-sturm-graz-2633844 — Sturm Graz 0-1 Fenerbahçe FT; Talisca 66' (Penaltı); play-off
- https://www.takvim.com.tr/spor/fenerbahce/2026/08/11/canli-sturm-graz-fenerbahce-sampiyonlar-ligi-maci — aynı skor; Talisca penaltı
- https://beinsports.com.tr/haber/trendyol-super-ligde-ilk-haftanin-programi-aciklandi — TFF 1. hafta: GS–Çorum 14.08 21:30; Kasımpaşa–TS 15.08 19:00; Gençlerbirliği–FB 15.08 21:30; BJK–Eyüpspor 16.08 21:30
- https://www.birgun.net/haber/super-lig-ne-zaman-basliyor-super-lig-2026-2027-sezonu-ilk-hafta-mac-programi-726856 — aynı Süper Lig saatleri
- https://www.milliyet.com.tr/galeri/besiktas-hradec-kralove-maci-ne-zaman-saat-kacta-bjk-avrupa-ligi-3-on-eleme-rovans-maci-hangi-kanalda-sifresiz-mi-7638734 — BJK–Hradec rövanş 13.08 20:00

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status       | Action         |
| --------------------------- | ---------------- | ---------------- | ------------ | -------------- |
| Sturm Graz - Fenerbahçe     | 2026-08-11 21:30 | 2026-08-11 21:30 | finished 0-1 | update result  |
| Beşiktaş - Hradec Králové   | 2026-08-13 20:00 | 2026-08-13 20:00 | scheduled    | none           |
| Galatasaray - Çorum FK      | 2026-08-14 12:00 | 2026-08-14 21:30 | scheduled    | update kickoff |
| Kasımpaşa - Trabzonspor     | 2026-08-15 19:00 | 2026-08-15 19:00 | scheduled    | none           |
| Gençlerbirliği - Fenerbahçe | 2026-08-15 21:30 | 2026-08-15 21:30 | scheduled    | none           |
| Beşiktaş - Eyüpspor         | 2026-08-16 21:30 | 2026-08-16 21:30 | scheduled    | none           |

## Migrations

- `supabase/migrations/20260811202418_update_sturm_graz_fenerbahce_result.sql` — title `Sturm Graz 0 - 1 Fenerbahçe`; Talisca 66' (Penaltı) (apply_migration OK)
- `supabase/migrations/20260811202345_update_galatasaray_corum_kickoff.sql` — 12:00 → 21:30 (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **6** timed events for the five categories.
- Bugün: Sturm Graz–Fenerbahçe FT 0-1; Fenerbahçe toplamda 3-0 ile play-off’a yükseldi.
- GS–Çorum açılış maçı TFF/beIN programında 21:30; DB’deki 12:00 placeholder güncellendi.
- Diğer Süper Lig ve BJK–Hradec kickoff’ları kaynaklarla uyumlu.
- 2 changed (1 result, 1 kickoff), 4 unchanged (upcoming), 0 skipped.
