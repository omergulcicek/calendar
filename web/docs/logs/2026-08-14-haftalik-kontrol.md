# Weekly fixture sync — 2026-08-14

- Invoked: 2026-08-14 23:33 (`Europe/Istanbul`)
- Window: 2026-08-14 → 2026-08-21
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://spor.haber7.com/canli-anlatim/1888-galatasaray-sk-corum-fk — Galatasaray 2-2 Çorum FK FT; Osimhen 53', 90'; Kyziridis 59'; Ramírez 61'; Kyziridis 70' kırmızı; kickoff 21:30 TR
- https://www.sofascore.com/football/match/corum-fk-galatasaray/llbsEcG — aynı skor ve dakikalar; FT; 18:30 UTC (= 21:30 TR)
- https://www.mynet.com/spor/canli-mac-anlatimi-ve-sonuclari/2057615-galatasaray-corum-fk — aynı skor; Osimhen 53'/90'; Kyziridis 59'; Ramirez 61'; Kyziridis 70' kırmızı
- https://www.birgun.net/haber/trendyol-super-lig-1-hafta-fiksturu-maclar-hangi-gun-ve-saat-kacta-728722 — TFF 1. hafta: GS–Çorum 14.08 21:30; Kasımpaşa–TS 15.08 19:00; Gençlerbirliği–FB 15.08 21:30; BJK–Eyüpspor 16.08 21:30
- https://www.birgun.net/haber/kasimpasa-trabzonspor-maci-hangi-gun-saat-kacta-ve-hangi-kanalda-729089 — Kasımpaşa–Trabzonspor 15.08 19:00
- https://www.hurriyet.com.tr/sporarena/fenerbahce-lyon-maci-ne-zaman-oynanacak-fenerbahcenin-sampiyonlar-ligi-play-off-maci-ne-zaman-43270248 — FB–Lyon UCL play-off ilk maç 18.08 (DB’de yok)
- https://www.yenisafak.com/galeri/spor/besiktas-kauno-zalgiris-maci-ne-zaman-saat-kacta-hangi-kanalda-yayinlanacak-4847883 — BJK–Kauno Žalgiris 20.08; kickoff henüz net değil (DB’de yok)

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Galatasaray - Çorum FK      | 2026-08-14 21:30 | 2026-08-14 21:30 | finished 2-2 | update result |
| Kasımpaşa - Trabzonspor     | 2026-08-15 19:00 | 2026-08-15 19:00 | scheduled    | none          |
| Gençlerbirliği - Fenerbahçe | 2026-08-15 21:30 | 2026-08-15 21:30 | scheduled    | none          |
| Beşiktaş - Eyüpspor         | 2026-08-16 21:30 | 2026-08-16 21:30 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260814233500_update_galatasaray_corum_result.sql` — title `Galatasaray 2 - 2 Çorum FK`; Osimhen 53', 90'; Kyziridis 59'; Ramírez 61'; Kyziridis 70' kırmızı (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **4** timed events for the five categories; no UCL events already in DB.
- Bugün: Galatasaray–Çorum FK FT 2-2; Çorum 10 kişi (Kyziridis 70' kırmızı).
- Süper Lig 1. hafta kalan kickoff’ları TFF/Birgün ile uyumlu.
- Yeni maç eklenmedi (out of scope): Fenerbahçe–Lyon UCL play-off 18.08; Beşiktaş–Kauno Žalgiris Avrupa Ligi play-off 20.08.
- 1 changed (result), 3 unchanged (upcoming), 0 skipped.
