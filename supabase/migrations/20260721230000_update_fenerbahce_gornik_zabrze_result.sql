-- Fenerbahçe 1 - 0 Górnik Zabrze (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Fenerbahçe 1 - 0 Górnik Zabrze',
  description = NULLIF(E'Talisca 37''', '')
WHERE title = 'Fenerbahçe - Górnik Zabrze';
