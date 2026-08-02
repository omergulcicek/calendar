# Project Memories & Context

This file serves as a persistent memory bank for the project. It documents key decisions, context, and evolution of the codebase that might not be obvious from the code itself.

## Context

- **Project Goal:** Kategori bazlı takvim aboneliği; lig/kupa maçları ve diğer etkinlikler.
- **Core Domain:** Calendar events + ICS feed subscriptions (club/category based).

## Key Decisions

- **2026-08-02 - Süper Lig description:** Süper Lig maçlarına `description` yazılmaz (`NULL`). Title formatı: `Ev Sahibi - Deplasman`. Süre: başlangıç + 2 saat. Timezone: `Europe/Istanbul`. Sadece ilgili kulüp kategorisine bağlanır (ayrı Süper Lig kategorisi yok).

## Evolution

- **2026-08-02 - Süper Lig açılış maçları:**
  - `Galatasaray - Çorum` → `galatasaray` (2026-08-14 21:30–23:30)
  - `Gençlerbirliği - Fenerbahçe` → `fenerbahce` (2026-08-15 21:30–23:30)
- **2026-08-02 - Beşiktaş Ağustos maçları:**
  - `Hradec Králové - Beşiktaş` → `besiktas` (2026-08-06 20:00, Avrupa Ligi 3. eleme 1/2)
  - `Beşiktaş - Hradec Králové` → `besiktas` (2026-08-13 20:00, Avrupa Ligi 3. eleme 2/2)
  - `Beşiktaş - Eyüpspor` → `besiktas` (2026-08-16 21:30, Süper Lig; description yok)
  - Atlandı: `Alanyaspor - Beşiktaş` (23.08, saat belirlenmedi)
