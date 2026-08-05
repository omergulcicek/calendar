ALTER TABLE public.event_categories ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public can read event_categories" ON public.event_categories;

CREATE POLICY "Public can read event_categories"
  ON public.event_categories
  FOR SELECT
  TO anon, authenticated
  USING (true);

DROP POLICY IF EXISTS "Authenticated can insert event_categories" ON public.event_categories;

CREATE POLICY "Authenticated can insert event_categories"
  ON public.event_categories
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can update event_categories" ON public.event_categories;

CREATE POLICY "Authenticated can update event_categories"
  ON public.event_categories
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

DROP POLICY IF EXISTS "Authenticated can delete event_categories" ON public.event_categories;

CREATE POLICY "Authenticated can delete event_categories"
  ON public.event_categories
  FOR DELETE
  TO authenticated
  USING (true);

GRANT SELECT ON public.event_categories TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.event_categories TO authenticated;
