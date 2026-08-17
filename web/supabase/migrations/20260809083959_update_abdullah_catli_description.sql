-- Abdullah Çatlı açıklaması güncellendi (organize suç / mafya ifadesi kaldırıldı).

UPDATE public.subjects
SET
  description = $desc$Ülkücü hareketten gelen; Bahçelievler Katliamı başta olmak üzere birçok cinayetle adı anılan, 12 Eylül sonrası yurt dışında uyuşturucu kaçakçılığı nedeniyle yargılanıp hapisten kaçan isimdir. Derin devlet ve kontrgerilla operasyonlarıyla ilişkilendirilmiş; 3 Kasım 1996'da Susurluk kazasında vefat etmiştir.$desc$,
  updated_at = now()
WHERE name = 'Abdullah Çatlı';
