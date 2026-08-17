-- Beşiktaş 1 - 0 Eyüpspor (Süper Lig)

UPDATE public.events
SET
  title = 'Beşiktaş 1 - 0 Eyüpspor',
  description = NULLIF(E'Vaclav Cerny 25''

David Costa 68'' (Kırmızı kart)', '')
WHERE title = 'Beşiktaş - Eyüpspor'
   OR title = 'Beşiktaş 1 - 0 Eyüpspor';
