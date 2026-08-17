-- Hradec Králové 0 - 1 Beşiktaş (Avrupa Ligi)

UPDATE public.events
SET
  title = 'Hradec Králové 0 - 1 Beşiktaş',
  description = NULLIF(E'Kassoum Ouattara 71'' (Kırmızı kart)
Semih Kılıçsoy 80''', '')
WHERE title = 'Hradec Králové - Beşiktaş'
   OR title = 'Hradec Králové 0 - 1 Beşiktaş';
