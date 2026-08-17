-- Çanakkale şiir bloğuna boş satır ve tırnak eklendi.

UPDATE public.subjects
SET
  description = $desc$1915–1916 yıllarında İtilaf Devletleri'nin Çanakkale Boğazı'nı geçerek İstanbul'u ele geçirme girişimine karşı Osmanlı ordusunun verdiği savunma savaşlarıdır.

Savaşın kaderini tayin eden en kritik unsurlardan biri ise Sultan II. Abdülhamid döneminde Boğaz'ın iki yakasına inşa ettirilen ve modernize edilen tabyalar olmuştur. Özellikle Anadolu Hamidiye, Mecidiye ve Dardanos gibi tabyalara yerleştirilen ağır topçu bataryaları ve korunaklı sığınak mimarisi, 18 Mart 1915'te İtilaf donanmasının yoğun bombardımanına direnmiş; Nusret Mayın Gemisi'nin hattıyla koordineli bir çapraz ateş oluşturarak düşman zırhlılarının Boğaz'ı geçmesini engellemiştir.

Mehmet Akif'in Çanakkale Şehitlerine şiirinden:

"Vurulup tertemiz alnından uzanmış yatıyor;
Bir hilâl uğruna, yâ Rab, ne güneşler batıyor!
Ey, bu topraklar için toprağa düşmüş asker!
Gökten ecdâd inerek öpse o pâk alnı değer.

Ne büyüksün ki kanın kurtarıyor Tevhîd'i...
Bedr'in arslanları ancak, bu kadar şanlı idi."
$desc$,
  updated_at = now()
WHERE name = 'Çanakkale Savaşları';
