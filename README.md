# Takvim Aboneliği

Kategori bazlı ICS / webcal takvim aboneliği. [ViraStack Start](https://www.virastack.com/start/docs/installation) (TanStack Start, i18n yok) üzerine kuruldu; aynı Supabase veritabanını kullanır.

## Geliştirme

```bash
pnpm install
cp .env.example .env.local   # Supabase + site URL
pnpm dev
```

## Ortam değişkenleri

| Değişken                                              | Açıklama                        |
| ----------------------------------------------------- | ------------------------------- |
| `VITE_APP_NAME`                                       | Site adı                        |
| `VITE_APP_URL`                                        | Uygulama URL’si (SEO)           |
| `VITE_SITE_URL`                                       | ICS abonelik linklerinin host’u |
| `VITE_SUPABASE_URL` / `VITE_SUPABASE_PUBLISHABLE_KEY` | Tarayıcı Supabase               |
| `SUPABASE_URL` / `SUPABASE_PUBLISHABLE_KEY`           | Sunucu Supabase                 |

## Yapı

- `src/features/calendar` — takvim UI, abonelik, SSS, nasıl eklerim
- `src/lib/feeds` — ICS feed üretimi
- `src/lib/supabase` — Supabase istemcileri
- `supabase/migrations` — mevcut DB migrasyonları
- `.agents/skills` — `emil-design-eng`, `make-interfaces-feel-better`

## Scriptler

```bash
pnpm dev
pnpm build
pnpm typecheck
pnpm lint
```
