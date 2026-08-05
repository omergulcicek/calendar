-- Mohaç açıklamasındaki baştaki boş satırı kaldır.

UPDATE public.subjects
SET
  description = ltrim(description, E'\n'),
  updated_at = now()
WHERE name = 'Mohaç Meydan Muharebesi'
  AND description LIKE E'\n%';
