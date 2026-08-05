# Project Memories & Context

This file serves as a persistent memory bank for the project. It documents key decisions, context, and evolution of the codebase that might not be obvious from the code itself.

## Context

- **Project Goal:** Kategori bazlı takvim aboneliği; lig/kupa maçları ve diğer etkinlikler.
- **Core Domain:** Calendar events + ICS feed subscriptions (club/category based).

## Key Decisions

- **2026-08-02 - Süper Lig description:** Süper Lig maçlarına `description` yazılmaz (`NULL`). Title formatı: `Ev Sahibi - Deplasman`. Süre: başlangıç + 2 saat. Timezone: `Europe/Istanbul`. Sadece ilgili kulüp kategorisine bağlanır (ayrı Süper Lig kategorisi yok).
- **2026-08-03 - Event kural seti:** Tam şablon → [`docs/event-data-rules.md`](./event-data-rules.md) (maç ekleme, gol/sonuç, şahsiyet, tarihi olay). Eski ad: `event-ekleme-kurallari.md`.
- **2026-08-03 - Weekly fixture sync:** Invoke-only runbook → [`docs/weekly-fixture-sync.md`](./weekly-fixture-sync.md). Kapsam: 4 büyük + `sampiyonlar-ligi`; pencere: çağrı günü → +7 gün; bitmemiş maça skor yazılmaz; log: `docs/logs/YYYY-MM-DD-haftalik-kontrol.md`.
- **2026-08-03 - Saat belirsiz:** Kickoff henüz net değilse maçı atlama; `12:00` (`Europe/Istanbul`) placeholder ile ekle, saat netleşince `UPDATE` et.

## Evolution

- **2026-08-03 - Trabzonspor 2026/27 Süper Lig fikstürü:** 34 maç → `trabzonspor`. Opener `Kasımpaşa - Trabzonspor` (15.08 **19:00**, net saat korundu); diğerleri `12:00`. GS/FB/BJK derbilerine `trabzonspor` eklendi.
- **2026-08-03 - Beşiktaş 2026/27 Süper Lig fikstürü:** 33 maç (opener `Beşiktaş - Eyüpspor` hariç zaten vardı) → `besiktas`, `12:00` placeholder. GS/FB derbileri mevcut event’e `besiktas` eklendi. Önceden atlanan `Alanyaspor - Beşiktaş` (23.08) eklendi.
- **2026-08-03 - Fenerbahçe 2026/27 Süper Lig fikstürü:** 33 maç (opener `Gençlerbirliği - Fenerbahçe` hariç zaten vardı) → `fenerbahce`, `12:00` placeholder. GS derbileri tek event: `galatasaray` + `fenerbahce`.
- **2026-08-03 - Galatasaray 2026/27 Süper Lig fikstürü:** 34 maç → `galatasaray`, hepsi `12:00` placeholder. Opener title `Galatasaray - Çorum FK` (eski `Çorum` + 21:30 güncellendi). Deplasman: `Çorum FK - Galatasaray`.
- **2026-08-03 - Büyük kulüp derbisi:** Aynı maç için tek event; her iki kulüp kategorisi `event_categories` ile bağlanır (çift satır yok).
- **2026-08-02 - Süper Lig açılış maçları:**
  - `Galatasaray - Çorum FK` → `galatasaray` (2026-08-14 12:00 placeholder; önce 21:30 / `Çorum`)
  - `Gençlerbirliği - Fenerbahçe` → `fenerbahce` (2026-08-15 21:30–23:30)
- **2026-08-02 - Beşiktaş Ağustos maçları:**
  - `Hradec Králové - Beşiktaş` → `besiktas` (2026-08-06 20:00, Avrupa Ligi 3. eleme 1/2)
  - `Beşiktaş - Hradec Králové` → `besiktas` (2026-08-13 20:00, Avrupa Ligi 3. eleme 2/2)
  - `Beşiktaş - Eyüpspor` → `besiktas` (2026-08-16 21:30, Süper Lig; description yok)
  - `Alanyaspor - Beşiktaş` → `besiktas` (2026-08-23 12:00 placeholder; önce atlanmıştı)
