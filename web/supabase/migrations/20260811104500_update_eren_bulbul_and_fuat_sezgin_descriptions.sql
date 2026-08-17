-- Eren Bülbül açıklamasına Ferhat Gedik eklendi; Fuat Sezgin açıklaması genişletildi.

UPDATE public.subjects
SET
  description = $desc$Trabzon'un Maçka ilçesinde jandarmaya bölgeyi tanıtırken PKK'lı teröristlerin saldırısı sonucu şehit düşen 15 yaşındaki kahraman. Aynı saldırıda üzerine kapanarak kendini siper eden Jandarma Astsubay Kıdemli Başçavuş Ferhat Gedik de şehit olmuştur.$desc$,
  updated_at = now()
WHERE name = 'Eren Bülbül';

UPDATE public.subjects
SET
  description = $desc$Türk akademisyen; İslam tarihi ile bilim ve teknoloji tarihi alanındaki çalışmalarıyla tanınır. Hellmut Ritter yanında yetişmiş, Buhârî'nin Kaynakları teziyle tanınmış; 1960 darbesi sonrası Almanya'ya giderek Frankfurt Goethe Üniversitesi'nde profesör olmuştur. 13 ciltlik Geschichte des Arabischen Schrifttums (GAS) eserinin yazarı; Arap-İslam Bilimleri Tarihi Enstitüsü ile İstanbul İslam Bilim ve Teknoloji Müzesi'nin kuruluşunda öncü rol oynamıştır. Kral Faysal Ödülü ve Cumhurbaşkanlığı Kültür ve Sanat Büyük Ödülü sahibidir.$desc$,
  updated_at = now()
WHERE name = 'Fuat Sezgin';
