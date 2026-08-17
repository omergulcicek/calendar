# Weekly fixture sync — 2026-08-13

- Invoked: 2026-08-13 23:05 (`Europe/Istanbul`)
- Window: 2026-08-13 → 2026-08-20
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- https://spor.haber7.com/besiktas/haber/3651101-besiktas-avrupayi-garantiledi — Beşiktaş 1-0 Hradec Králové FT; Vaclav Cerny 40'; play-off
- https://www.turkiyetoday.com/sports/besiktas-secures-european-football-with-1-0-playoff-win-over-hradec-kralove-3226048 — same score; Cerny 40' (Olaitan assist)
- https://spor.haber7.com/canli-anlatim/1887-besiktas-jk-fc-hradec-kralove — canlı anlatım; kickoff 20:00 TR; gol 40' Cerny
- https://t24.com.tr/spor/super-ligde-2026-2027-sezonunun-perdesi-aciliyor-iste-ilk-hafta-programi,1341573 — TFF 1. hafta (13.08): GS–Çorum 14.08 21:30; Kasımpaşa–TS 15.08 19:00; Gençlerbirliği–FB 15.08 21:30; BJK–Eyüpspor 16.08 21:30
- https://www.birgun.net/haber/super-lig-ne-zaman-basliyor-super-lig-2026-2027-sezonu-ilk-hafta-mac-programi-726856 — aynı Süper Lig saatleri

## Events checked

| Event                       | Kickoff (DB)     | Kickoff (source) | Status       | Action        |
| --------------------------- | ---------------- | ---------------- | ------------ | ------------- |
| Beşiktaş - Hradec Králové   | 2026-08-13 20:00 | 2026-08-13 20:00 | finished 1-0 | update result |
| Galatasaray - Çorum FK      | 2026-08-14 21:30 | 2026-08-14 21:30 | scheduled    | none          |
| Kasımpaşa - Trabzonspor     | 2026-08-15 19:00 | 2026-08-15 19:00 | scheduled    | none          |
| Gençlerbirliği - Fenerbahçe | 2026-08-15 21:30 | 2026-08-15 21:30 | scheduled    | none          |
| Beşiktaş - Eyüpspor         | 2026-08-16 21:30 | 2026-08-16 21:30 | scheduled    | none          |

## Migrations

- `supabase/migrations/20260813230500_update_besiktas_hradec_result.sql` — title `Beşiktaş 1 - 0 Hradec Králové`; Vaclav Cerny 40' (apply_migration OK)

## Skipped

- _(none)_

## Notes

- Window: **5** timed events for the five categories; no UCL / Trabzonspor extra fixtures beyond the listed Super Lig opener.
- Bugün: Beşiktaş–Hradec rövanş FT 1-0 (toplam 2-0); play-off rakibi Kauno Žalgiris (20/27.08) — yeni maç eklenmedi (out of scope).
- Süper Lig 1. hafta kickoff’ları TFF/T24 ile uyumlu; 12:00 placeholder kalmadı.
- 1 changed (result), 4 unchanged (upcoming), 0 skipped.
