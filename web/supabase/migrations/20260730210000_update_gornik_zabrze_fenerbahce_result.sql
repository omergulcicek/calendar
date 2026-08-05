-- Górnik Zabrze 1 - 1 Fenerbahçe (Şampiyonlar Ligi)

UPDATE public.events
SET
  title = 'Górnik Zabrze 1 - 1 Fenerbahçe',
  description = NULLIF(E'Michal Sáček 45+10''

Talisca 12'' (Penaltı)', '')
WHERE title = 'Górnik Zabrze - Fenerbahçe'
   OR title = 'Górnik Zabrze 1 - 1 Fenerbahçe';
