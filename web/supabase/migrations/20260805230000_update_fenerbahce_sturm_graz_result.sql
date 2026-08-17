-- Fenerbahçe 2 - 0 Sturm Graz (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Fenerbahçe 2 - 0 Sturm Graz',
  description = NULLIF(E'Talisca 10''
Mason Greenwood 45''', '')
WHERE title = 'Fenerbahçe - Sturm Graz'
   OR title = 'Fenerbahçe 2 - 0 Sturm Graz';
