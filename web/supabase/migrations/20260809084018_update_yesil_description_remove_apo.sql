-- Yeşil açıklamasından (Apo) ifadesi kaldırıldı.

UPDATE public.subjects
SET
  description = replace(description, 'Abdullah Öcalan''ı (Apo)', 'Abdullah Öcalan''ı'),
  updated_at = now()
WHERE name = 'Yeşil (Mahmut Yıldırım)';
