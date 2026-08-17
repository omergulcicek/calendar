# Weekly fixture sync — 2026-08-06

- Invoked: 2026-08-06 21:53 (`Europe/Istanbul`)
- Window: 2026-08-06 → 2026-08-13
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.sofascore.com/football/match/besiktas-jk-fc-hradec-kralove/rUsalb — FT 0-1; Semih Kılıçsoy 80'
- https://arsiv.mackolik.com/Mac/4511723/Hradec-Kralove-Besiktas — MS 0-1; kickoff 20:00 TR
- https://www.takvim.com.tr/spor/besiktas/2026/08/06/canli-hradec-kralove-besiktas-avrupa-ligi-maci — Beşiktaş 1-0 galip; Semih 80'; Ouattara kırmızı 71'
- https://www.cumhuriyet.com.tr/spor/canli-yayin-hradec-kralove-besiktas-canli-anlatim-uefa-avrupa-ligi-3-eleme-turu-ilk-mac-2527039 — Hradec 0-1 Beşiktaş; Semih 80'; Ouattara kırmızı 71'
- https://sportscore.com/football/match/sturm-graz-vs-fenerbahce/ — Sturm Graz–Fenerbahçe 11.08 18:30 UTC (= 21:30 TR)
- https://www.advancescores.com/match-schedule/sturm-graz-vs-fenerbahce-zb3xjaj3-1607174 — aynı maç kickoff 21:30
- https://www.turkiyetoday.com/sports/besiktas-visits-hradec-kralove-with-100th-european-victory-in-sight-3225525 — rövanş 13.08 İstanbul; ilk maç 20:00 TR

## Events checked

| Event                     | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Hradec Králové - Beşiktaş | 2026-08-06 20:00 | 2026-08-06 20:00 | finished 0-1 | update result |
| Sturm Graz - Fenerbahçe   | 2026-08-11 21:30 | 2026-08-11 21:30 | scheduled    | none          |
| Beşiktaş - Hradec Králové | 2026-08-13 20:00 | 2026-08-13 20:00 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260806215500_update_hradec_besiktas_result.sql` — title `Hradec Králové 0 - 1 Beşiktaş`; gol Semih Kılıçsoy 80'; Ouattara 71' kırmızı (apply_migration OK)
- `supabase/migrations/20260806215700_fix_hradec_besiktas_description.sql` — açıklamadaki baştaki boş satır kaldırıldı (yalnız deplasman satırları)

## Skipped

- _(none)_

## Notes

- Window: **3** timed events for the five categories; no GS/TS events in range.
- Bugün tek maç: Hradec Králové–Beşiktaş. FT 0-1 (Sofascore Finished + Mackolik MS).
- Kickoff’lar kaynaklarla uyumlu → kickoff migration yok.
- 1 changed (result), 2 unchanged (upcoming), 0 skipped.
