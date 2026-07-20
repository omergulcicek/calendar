-- Create event_categories junction table
CREATE TABLE public.event_categories (
  event_id uuid NOT NULL REFERENCES public.events(id) ON DELETE CASCADE,
  category_id uuid NOT NULL REFERENCES public.categories(id) ON DELETE CASCADE,
  PRIMARY KEY (event_id, category_id)
);

-- Migrate existing categories
INSERT INTO public.event_categories (event_id, category_id)
SELECT id, category_id
FROM public.events
WHERE category_id IS NOT NULL;

-- Add Şampiyonlar Ligi to Fenerbahçe'nin maçları (eğer varsa) veya test için bir maç ekleyelim.
-- Önce Fenerbahçe - Şampiyonlar Ligi test maçı ekleyelim.
WITH fb AS (
  SELECT id FROM public.categories WHERE slug = 'fenerbahce'
),
sl AS (
  SELECT id FROM public.categories WHERE slug = 'sampiyonlar-ligi'
),
inserted AS (
  INSERT INTO public.events (
    title, description, start_date, end_date, is_all_day, status, recurrence
  )
  VALUES (
    'Fenerbahçe - FC Lugano',
    'Şampiyonlar Ligi 2. eleme turu',
    ('2026-07-23 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul'),
    ('2026-07-23 21:30:00'::timestamp AT TIME ZONE 'Europe/Istanbul') + interval '2 hours',
    false,
    'published',
    'none'
  )
  RETURNING id
)
INSERT INTO public.event_categories (event_id, category_id)
SELECT inserted.id, fb.id FROM inserted, fb
UNION ALL
SELECT inserted.id, sl.id FROM inserted, sl;

-- We can drop category_id from events later, but for now we keep it to not break things immediately.
-- Actually, let's drop it to force ourselves to fix the code.
ALTER TABLE public.events DROP COLUMN category_id;
