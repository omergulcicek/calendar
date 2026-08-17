# Weekly Fixture Sync (Runbook)

**Trigger:** This runbook runs **only when this file is explicitly invoked** (referenced / attached / “run weekly-fixture-sync”). It is not a cron job.

**Purpose:** One pass over the next week of fixtures for the five tracked categories: correct kickoff date/time when the source differs, and write match results for **finished** games that still lack a score.

**Must follow:** [`docs/event-data-rules.md`](./event-data-rules.md) for every SQL change.

---

## Scope

### Categories (exactly five)

| Slug               | Role             |
| ------------------ | ---------------- |
| `galatasaray`      | Club             |
| `fenerbahce`       | Club             |
| `besiktas`         | Club             |
| `trabzonspor`      | Club             |
| `sampiyonlar-ligi` | Champions League |

Ignore all other categories for this job.

### Time window

```text
window_start = calendar date of the invocation (Europe/Istanbul)
window_end   = window_start + 7 days (inclusive of the 7th day end)
```

Only events whose `start_date` falls in that window and that are linked to at least one of the five slugs above.

Do **not** scan the rest of the season.

---

## Hard constraints (anti-hallucination)

1. **Never invent** kickoff times, scores, scorers, or cards.
2. Every factual claim must come from a **reliable public source** (official competition site, club site, or a well-known sports results source). Cite the source URL in the log.
3. **Unfinished match** → do not touch title/description for results. Leave as-is even if media speculate.
4. **Finished match** → update only if the event title is still **unscored** (no `N - N` score pattern). Skip if already scored unless the source proves a clear data error (then note it in the log; do not silently overwrite).
5. If kickoff was postponed and the new date is outside the window, still `UPDATE` `start_date`/`end_date` so the event leaves the wrong day on the calendar; record that in the log.
6. If a source is conflicting or incomplete → **skip that event**, log `skipped: ambiguous source`, write no migration for it.

---

## Single job procedure

Execute steps in order. Treat kickoff sync and result sync as **one job**, one log file.

### Step 1 — Load DB window

Query published timed events in the window linked to the five slugs. Prefer joining through `event_categories` → `categories`.

Collect per event:

- `id`, `title`, `description`, `start_date`, `end_date`
- category slugs
- whether title already matches a scored pattern (`~ '[0-9] - [0-9]'`)

### Step 2 — Verify each event against a source

For each event in the window:

| Check                               | If source differs / match finished                                                                                                                                                                                             |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Kickoff date/time (Europe/Istanbul) | Plan `UPDATE` of `start_date` / `end_date` (`end = start + 2 hours`; if that is **00:00** TR, use **23:55** same kickoff day; longer only if extra time already known for a finished match that went long — rare at this step) |
| Match status                        | If **FT / finished** and title unscored → plan result update per event-data-rules §3                                                                                                                                           |
| Match status                        | If **not finished** → no result fields; only kickoff update if needed                                                                                                                                                          |
| Postponed / rescheduled             | Update datetime; log old → new                                                                                                                                                                                                 |

Placeholder `12:00` kickoffs: if the source now has a confirmed kickoff, update them.

### Step 3 — Write migrations

For each planned change, add an idempotent migration under `supabase/migrations/`:

| Change       | Filename pattern                                                            |
| ------------ | --------------------------------------------------------------------------- |
| Kickoff only | `YYYYMMDDHHMMSS_update_<slug>_kickoff.sql` (or `fix_` for tiny corrections) |
| Result       | `YYYYMMDDHHMMSS_update_<slug>_result.sql`                                   |

Apply remotely with `apply_migration` when that is the project’s normal path. Do not invent SQL that does not match [`event-data-rules.md`](./event-data-rules.md).

If nothing changed → no migration files.

### Step 4 — Write the run log

Create:

```text
docs/logs/YYYY-MM-DD-haftalik-kontrol.md
```

Use the invocation date in `Europe/Istanbul` as `YYYY-MM-DD`. If a file for that day already exists, append a new `## Run <HH:MM TR>` section instead of overwriting.

#### Log template

```markdown
# Weekly fixture sync — YYYY-MM-DD

- Invoked: YYYY-MM-DD HH:MM (`Europe/Istanbul`)
- Window: YYYY-MM-DD → YYYY-MM-DD
- Categories: galatasaray, fenerbahce, besiktas, trabzonspor, sampiyonlar-ligi

## Sources

- <url> — <what it covered>

## Events checked

| Event       | Kickoff (DB)     | Kickoff (source) | Status       | Action         |
| ----------- | ---------------- | ---------------- | ------------ | -------------- |
| Home - Away | 2026-08-06 20:00 | 2026-08-06 20:00 | scheduled    | none           |
| Home - Away | 2026-08-03 12:00 | 2026-08-03 21:30 | scheduled    | update kickoff |
| Home - Away | 2026-08-02 21:00 | 2026-08-02 21:00 | finished 2-1 | update result  |

## Migrations

- `supabase/migrations/...sql` — short note
- _(none)_

## Skipped

- <title> — reason (e.g. ambiguous source / not finished)

## Notes

- …
```

---

## Result update reminder

Only for **finished + unscored** events. Follow event-data-rules exactly:

- Title → `Home <h> - <a> Away`
- Description → goal list (`E'...'`), or `NULL` if no goals / empty
- Replace any pre-match round description with the goal list
- Idempotent `WHERE title = 'Home - Away' OR title = 'Home X - Y Away'`

### Description layout (no leading blank)

Home lines, then a blank separator, then away lines — **but only when both sides have at least one line** (goal or red card).

| Situation               | Description starts with                |
| ----------------------- | -------------------------------------- |
| Only home has lines     | First home line (no trailing blank)    |
| Only away has lines     | First away line (**no leading blank**) |
| Both sides have lines   | Home lines → blank → away lines        |
| Neither (0-0, no cards) | `NULL`                                 |

Wrong (leading blank when home is empty):

```text

Kassoum Ouattara 71' (Kırmızı kart)
Semih Kılıçsoy 80'
```

Right:

```text
Kassoum Ouattara 71' (Kırmızı kart)
Semih Kılıçsoy 80'
```

Never invent scorers. If FT score is known but scorer list is not verified → update title/score only and set description carefully per rules (or skip description and log the gap). Prefer skipping the whole result update over guessing minutes/names.

---

## Out of scope

- Adding brand-new fixtures that do not already exist in the DB (use a normal add-event flow + event-data-rules)
- Non-football events, World Cup category, Europa-only categories beyond the five slugs
- Bulk season imports
- Guessing live scores or “about to finish” matches

---

## Agent checklist

1. Confirm this file was explicitly invoked
2. Compute Istanbul window: today → today+7d
3. Load events for the five slugs
4. Verify each against a reliable source (cite URLs)
5. Plan kickoff + finished-result updates only
6. Write/apply migrations when needed
7. Write `docs/logs/YYYY-MM-DD-haftalik-kontrol.md`
8. Summarize to the user: changed / skipped / unchanged counts
