-- Beşiktaş - FC Midtjylland açıklama metni.

UPDATE public.events e
SET description = 'Avrupa Ligi ikinci eleme turu ilk maç'
FROM public.categories c
WHERE e.category_id = c.id
  AND c.slug = 'besiktas'
  AND e.title = 'Beşiktaş - FC Midtjylland';
