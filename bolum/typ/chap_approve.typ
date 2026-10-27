// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ
// TEZ ONAY SAYFASI (Madde 10)
// Madde 3/a uyarınca bu sayfada sayfa numarası yer almaz.
// ==============================================================================

// Bu sayfa için numara gösterimini kapatıyoruz (\thispagestyle{empty} karşılığı)
#set page(numbering: none)

#align(center)[
  #set text(size: 14pt, weight: "bold")
  TEZ ONAY SAYFASI
]

#v(1cm)

İstanbul Üniversitesi Sosyal Bilimler Enstitüsü *..................................* Anabilim Dalı *..................................* Bilim Dalı'nda *......................* numaralı *..................................*'nın hazırladığı *“................................................”* konulu *YÜKSEK LİSANS / DOKTORA TEZİ*, jürimiz tarafından *..... / ..... / 2026* tarihinde yapılan tez savunma sınavında başarılı bulunarak kabul edilmiştir.

#v(1.5cm)

#align(center)[
  #set text(weight: "bold")
  TEZ JÜRİSİ ÜYELERİ
]

#v(1cm)

// \begin{tabular*}{\textwidth} karşılığı: Sayfa genişliğine yayılan imza tablosu
#table(
  columns: (2fr, 1.5fr, 1fr), // Sütun genişlik oranları (Unvan-Ad, Üniversite, İmza)
  align: (left, left, right),  // l, l, r hizalama düzeni
  stroke: none,               // Çerçeve çizgilerini kaldırıyoruz
  row-gutter: 0.8cm,          // İmza satırları arasındaki boşluk
  
  [*Unvanı, Adı ve Soyadı*], [*Üniversitesi*], [ #align(center)[*İmza*] ],
  
  [1. Tez Danışmanı: ............................], [............................], [................],
  [2. Jüri Üyesi: .....................................], [............................], [................],
  [3. Jüri Üyesi: .....................................], [............................], [................],
  [4. Jüri Üyesi: .....................................], [............................], [................],
  [5. Jüri Üyesi: .....................................], [............................], [................]
)
