-- Sturm Graz 0 - 1 Fenerbahçe (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Sturm Graz 0 - 1 Fenerbahçe',
  description = NULLIF(E'Talisca 66'' (Penaltı)', '')
WHERE title = 'Sturm Graz - Fenerbahçe'
   OR title = 'Sturm Graz 0 - 1 Fenerbahçe';
