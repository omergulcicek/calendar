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

ALTER TABLE public.events DROP COLUMN category_id;
