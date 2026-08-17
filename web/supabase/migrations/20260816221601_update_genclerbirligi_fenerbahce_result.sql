-- Gençlerbirliği 2 - 1 Fenerbahçe (Süper Lig)

UPDATE public.events
SET
  title = 'Gençlerbirliği 2 - 1 Fenerbahçe',
  description = NULLIF(E'Franco Tongya 37''
Oğulcan Ülgün 56''

Talisca 13''', '')
WHERE title = 'Gençlerbirliği - Fenerbahçe'
   OR title = 'Gençlerbirliği 2 - 1 Fenerbahçe';
