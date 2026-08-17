-- Beşiktaş 1 - 0 Hradec Králové (Avrupa Ligi)

UPDATE public.events
SET
  title = 'Beşiktaş 1 - 0 Hradec Králové',
  description = NULLIF(E'Vaclav Cerny 40''', '')
WHERE title = 'Beşiktaş - Hradec Králové'
   OR title = 'Beşiktaş 1 - 0 Hradec Králové';
