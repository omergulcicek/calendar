-- Mevlid Kandili açıklamasını güncelle

UPDATE public.events
SET
  description = $desc$Sevgili Peygamberimiz Hz. Muhammed'in (s.a.v.) dünyayı şereflendirdiği bu mübarek gece, Müslümanlar için rahmet ve sevginin sembolüdür. Diyanet takvimine göre Rebiülevvel ayının 11. gecesi kandil olarak idrak edilir. Bu gece pek çok yerde mevlid okunur, salavat getirilir ve Peygamberimizin hayatı, ahlakı ve öğretileri anılır.$desc$,
  updated_at = now()
WHERE title = 'Mevlid Kandili';
