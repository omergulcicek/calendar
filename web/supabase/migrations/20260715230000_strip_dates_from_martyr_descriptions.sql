-- Şehit açıklamalarından tarih bilgisini kaldır (etkinlik tarihinden zaten belli).

UPDATE public.subjects
SET description = 'Darbe girişiminde Özel Kuvvetler Komutanlığı''nı ele geçirmeye çalışan darbe yanlısı Tuğgeneral Semih Terzi''yi durdurduktan sonra darbeci askerlerce şehit düşen kahraman.'
WHERE name = 'Ömer Halisdemir';

UPDATE public.subjects
SET description = 'Trabzon''un Maçka ilçesinde jandarmaya bölgeyi tanıtırken PKK''lı teröristlerin saldırısı sonucu şehit düşen 15 yaşındaki kahraman.'
WHERE name = 'Eren Bülbül';

UPDATE public.subjects
SET description = 'İzmir Adliyesi''ne yönelik bombalı terör saldırısında teröristlerle çatışarak olası bir faciayı önleyen ve şehit düşen polis memuru.'
WHERE name = 'Fethi Sekin';
