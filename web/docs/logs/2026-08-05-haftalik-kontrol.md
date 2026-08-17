# Weekly fixture sync — 2026-08-05

- Invoked: 2026-08-05 22:51 (`Europe/Istanbul`)
- Window: 2026-08-05 → 2026-08-12
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://www.sporx.com/fenerbahce-sturm-graz-maci-goller-kartlar-5954870 — Fenerbahçe–Sturm Graz canlı: ~86', 2-0 (İY 2-0); FT değil
- https://spor.haber7.com/canli-anlatim/1884-fenerbahce-sk-sk-sturm-graz — aynı maç canlı anlatım (son olaylar ~84'); skor 2-0
- https://www.foxsports.com/soccer/champions-league-fenerbahce-vs-sk-sturm-graz-aug-05-2026-game-boxscore-953397 — Talisca 10', Greenwood 45'; HT 2-0
- https://www.referee.observer/match/47498 — Hradec Králové–Beşiktaş: 19:00 CEST (= 20:00 TR)
- https://www.futmetrix.com/matches/hradec-kralove-vs-besiktas-2026-08-06-1700 — aynı maç 17:00 UTC (= 20:00 TR)
- https://www.uefa.com/uefachampionsleague/news/02a6-20e5a8be4e63-ae971c582f8c-1000--champions-league-qualifying-fixtures-results-dates-how-it-/ — Sturm Graz–Fenerbahçe rövanş listesi 20:30 (CEST → 21:30 TR)

## Events checked

| Event                     | Kickoff (DB)     | Kickoff (source) | Status          | Action |
| ------------------------- | ---------------- | ---------------- | --------------- | ------ |
| Fenerbahçe - Sturm Graz   | 2026-08-05 21:00 | 2026-08-05 21:00 | live ~86' (2-0) | none   |
| Hradec Králové - Beşiktaş | 2026-08-06 20:00 | 2026-08-06 20:00 | scheduled       | none   |
| Sturm Graz - Fenerbahçe   | 2026-08-11 21:30 | 2026-08-11 21:30 | scheduled       | none   |

## Migrations

- _(none)_

## Skipped

- Fenerbahçe - Sturm Graz — not finished (live); result update deferred until FT confirmed

## Notes

- Window: **3** timed events for the five categories; no GS/TS events in range.
- Bugün tek maç: Fenerbahçe–Sturm Graz. Kontrol anında (~22:51 TR) maç bitmemiş → skor/title güncellemesi yok.
- Kickoff’lar kaynaklarla uyumlu → kickoff migration yok.
- FT sonrası: title `Fenerbahçe 2 - 0 Sturm Graz` + gol listesi (Talisca / Greenwood — FT teyidi şart); canlı skor nihai kabul edilmez.

## Run 22:59 TR

- Invoked: 2026-08-05 22:59 (`Europe/Istanbul`)
- Window: 2026-08-05 → 2026-08-12 (same)

### Sources

- https://www.sportsnet.ca/soccer/champions-league/games/0906abc8-5634-3949-816f-55a91deddc9c — **FT 2-0**; Talisca 10', M. Greenwood 45'; Second Half 2-0
- https://spor.haber7.com/canli-anlatim/1884-fenerbahce-sk-sk-sturm-graz — goller: Talisca 10', Mason Greenwood 45'
- https://www.sporx.com/fenerbahce-sturm-graz-maci-goller-kartlar-5954870 — 2-0 (İY 2-0); kontrol anında 90'+

### Events checked

| Event                     | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| ------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Fenerbahçe - Sturm Graz   | 2026-08-05 21:00 | 2026-08-05 21:00 | finished 2-0 | update result |
| Hradec Králové - Beşiktaş | 2026-08-06 20:00 | 2026-08-06 20:00 | scheduled    | none          |
| Sturm Graz - Fenerbahçe   | 2026-08-11 21:30 | 2026-08-11 21:30 | scheduled    | none          |

### Migrations

- `supabase/migrations/20260805230000_update_fenerbahce_sturm_graz_result.sql` — title `Fenerbahçe 2 - 0 Sturm Graz`; goller Talisca 10', Mason Greenwood 45' (apply_migration OK)

### Skipped

- _(none)_

### Notes

- 1 changed (result), 2 unchanged (upcoming), 0 skipped.
