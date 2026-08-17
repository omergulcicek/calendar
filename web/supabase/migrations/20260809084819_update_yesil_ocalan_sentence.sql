-- Yeşil açıklamasında Öcalan cümlesi güncellendi.

UPDATE public.subjects
SET
  description = replace(
    description,
    'Abdullah Öcalan''ı öldürmek üzere görevlendirilen ekiplerde adı geçmiştir.',
    'Abdullah Öcalan''ı öldürmek üzere görevlendirilen ekipteydi.'
  ),
  updated_at = now()
WHERE name = 'Yeşil (Mahmut Yıldırım)';
