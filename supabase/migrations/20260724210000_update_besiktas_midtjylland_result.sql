-- Beşiktaş 1 - 0 FC Midtjylland (Avrupa Ligi)

UPDATE public.events
SET
  title = 'Beşiktaş 1 - 0 FC Midtjylland',
  description = NULLIF(E'Orkun Kökçü 26''', '')
WHERE title = 'Beşiktaş - FC Midtjylland';
