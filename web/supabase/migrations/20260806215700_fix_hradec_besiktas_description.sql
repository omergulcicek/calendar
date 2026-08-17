-- Fix: Hradec–Beşiktaş açıklamasındaki baştaki boş satırı kaldır

UPDATE public.events
SET
  description = NULLIF(E'Kassoum Ouattara 71'' (Kırmızı kart)
Semih Kılıçsoy 80''', '')
WHERE title = 'Hradec Králové 0 - 1 Beşiktaş';
