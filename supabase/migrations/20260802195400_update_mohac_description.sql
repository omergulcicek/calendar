-- Mohaç Meydan Muharebesi açıklamasına Akıncılar şiiri eklendi.

UPDATE public.subjects
SET
  description = $desc$1526'da Kanuni Sultan Süleyman ile Macar kralı II. Lajos arasında Mohaç Ovası'nda yapılan savaş; Macaristan'ın Osmanlı egemenliğine girmesinin başlangıcıdır.

Yahya Kemal Beyatlı'nın "Akıncılar" şiiri, Mohaç Savaşı'ndaki akıncı birliklerini ve Malkoçoğlu Bali Bey önderliğinde kazanılan bu tarihi zaferin coşkusunu anlatır. Şiir, 1526'da 2 saat gibi kısa bir sürede kazanılan zaferdeki akıncı cesaretini ve Osmanlı ordusunun gücünü simgeler.

Akıncılar şiiri

"Bin atlı, akınlarda çocuklar gibi şendik;
Bin atlı o gün dev gibi bir orduyu yendik!

Ak tolgalı beylerbeyi haykırdı: İlerle!
Bir yaz günü geçtik Tuna'dan kaafilelerle...

Şimşek gibi bir semte atıldık yedi koldan.
Şimşek gibi Türk atlarının geçtiği yoldan.

Bir gün dolu dizgin boşanan atlarımızla
Yerden yedi kat arşa kanatlandık o hızla...

Cennette bugün gülleri açmış görürüz de
Hâlâ o kızıl hatıra titrer gözümüzde!

Bin atlı, akınlarda çocuklar gibi şendik;
Bin atlı o gün dev gibi bir orduyu yendik!"
$desc$,
  updated_at = now()
WHERE name = 'Mohaç Meydan Muharebesi';
