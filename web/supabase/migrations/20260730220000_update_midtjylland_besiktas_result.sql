-- FC Midtjylland 0 - 2 Beşiktaş (Avrupa Ligi)

UPDATE public.events
SET
  title = 'FC Midtjylland 0 - 2 Beşiktaş',
  description = NULLIF(E'Martin Erlić 53'' (Kırmızı kart)

Milot Rashica 70''
Orkun Kökçü 76'' (Penaltı)', '')
WHERE title = 'FC Midtjylland - Beşiktaş'
   OR title = 'FC Midtjylland 0 - 2 Beşiktaş';
