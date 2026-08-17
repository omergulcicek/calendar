-- Seyit Onbaşı açıklamasına 276 kg top mermisi bilgisi eklendi.

UPDATE public.subjects
SET
  description = $desc$Çanakkale Cephesi'nde Rumeli Mecidiye Tabyası'nda görev yapan Türk asker. 18 Mart 1915'te yaklaşık 276 kg'lık top mermisini sırtlayarak ateş etmiş; İngiliz Ocean zırhlısını vurarak mayına çarpıp batmasına yol açmıştır.$desc$,
  updated_at = now()
WHERE name = 'Seyit Onbaşı';
