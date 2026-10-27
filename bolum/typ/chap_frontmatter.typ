// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ
// ÖN KISIM (Madde 8/A)
// ==============================================================================

// ------------------------------------------------------------------------------
// 1. ÖZ (TÜRKÇE) (Madde 11)
// Sayfa başında tezin başlığı ve yazar adı yer almalıdır (250 kelimeyi geçmemelidir).
// İtalik yazı, simge, formül içermemelidir (Madde 5/c).
// ------------------------------------------------------------------------------
#heading(level: 1, numbering: none, outlined: true)[ÖZ]

#align(center)[
  #set text(size: 14pt, weight: "bold")
  TEZİN BAŞLIĞI BURAYA GELECEK
  
  #v(0.4cm)
  #set text(size: 12pt, weight: "bold")
  Adı SOYADI
]

#v(0.8cm)

Bu çalışmada, İstanbul Üniversitesi Sosyal Bilimler Enstitüsü tez hazırlama yönergesine uygun olarak belirlenen araştırma problemi, yöntemi ve elde edilen temel bulgular özetlenmektedir. Araştırmada incelenen sorunsal, kullanılan kavramsal çerçeve, yöntem ve teknikler ile varılan sonuçlar bu kısımda özlü ve açık bir dille ortaya konulmuştur. Öz metni 250 kelimeyi aşmayacak şekilde yapılandırılmıştır.

#v(1cm)
*Anahtar Kelimeler:* Sosyal Bilimler, Tez Yazımı, İstanbul Üniversitesi, LaTeX Şablonu, Akademik Standartlar.

#pagebreak()

// ------------------------------------------------------------------------------
// 2. ABSTRACT (İNGİLİZCE) (Madde 11)
// İngilizce başlık ve yazar adı ile başlar (250 kelimeyi geçmemelidir).
// ------------------------------------------------------------------------------
#heading(level: 1, numbering: none, outlined: true)[ABSTRACT]

// \begin{otherlanguage}{english} karşılığı: Bu blok için dili İngilizceye çekiyoruz
#set text(lang: "en")

#align(center)[
  #set text(size: 14pt, weight: "bold")
  THESIS TITLE IN ENGLISH
  
  #v(0.4cm)
  #set text(size: 12pt, weight: "bold")
  Author NAME SURNAME
]

#v(0.8cm)

In this thesis, the research questions, methodology, and primary findings are summarized in accordance with the Istanbul University Institute of Social Sciences thesis preparation guidelines. The conceptual framework, qualitative/quantitative methods, and conclusive findings are presented concisely without exceeding 250 words.

#v(1cm)
*Keywords:* Social Sciences, Thesis Guidelines, Istanbul University, LaTeX Template, Academic Standards.

#pagebreak()

// ------------------------------------------------------------------------------
// 3. ÖNSÖZ (Madde 12)
// Tezin amacı, önemi, karşılaşılan güçlükler ve teşekkür içerir. En fazla 2 sayfadır.
// ------------------------------------------------------------------------------
#heading(level: 1, numbering: none, outlined: true)[ÖNSÖZ]

// Önsöz paragrafları arasında okunabilir ayırma
#set par(spacing: 0.8em, leading: 1.5em, first-line-indent: 1cm)

Bu tez çalışması, İstanbul Üniversitesi Sosyal Bilimler Enstitüsü bünyesinde yürütülmüş olup alan yazına katkı sağlamayı amaçlamaktadır.

Çalışmanın her aşamasında değerli bilgi, öneri ve eleştirileriyle yol gösteren, desteğini esirgemeyen saygıdeğer danışmanım Sayın Prof. Dr. Adı SOYADI'na en içten teşekkürlerimi sunarım.

Ayrıca, araştırmam süresince maddi ve manevi desteklerini daima yanımda hissettiğim aileme ve çalışma arkadaşlarıma teşekkür ederim.

#v(1.5cm)
#align(right)[
  Adı SOYADI \
  İstanbul, 20XX
]

#pagebreak()

// ------------------------------------------------------------------------------
// 4. İÇİNDEKİLER (Madde 13)
// Öz'den başlayarak tezin tüm kısımlarını sayfa numaralarıyla listeler.
// ------------------------------------------------------------------------------
// İçindekiler başlığının kendisini dizine eklememek için outlined: false yapıyoruz
#heading(level: 1, numbering: none, outlined: false)[İÇİNDEKİLER]
#outline(title: none, indent: 1.5em)

#pagebreak()

// ------------------------------------------------------------------------------
// 5. TABLOLAR VE ŞEKİLLER LİSTELERİ (Madde 14)
// ------------------------------------------------------------------------------
#heading(level: 1, numbering: none, outlined: true)[ŞEKİLLER LİSTESİ]
#outline(title: none, target: figure.where(kind: image))

#pagebreak()

#heading(level: 1, numbering: none, outlined: true)[TABLOLAR LİSTESİ]
#outline(title: none, target: figure.where(kind: table))

#pagebreak()

// ------------------------------------------------------------------------------
// 6. KISALTMALAR LİSTESİ (Madde 15)
// Alfabetik sırayla alt alta dizilir, karşısında açık halleri yer alır.
// ------------------------------------------------------------------------------
#heading(level: 1, numbering: none, outlined: true)[KISALTMALAR]

// LaTeX description ortamı yerine hizalı ve temiz Typst terim listesi
#set terms(separator: [: ], hanging-indent: 2.5cm)

/ a.e.: Aynı eser
/ a.g.e.: Adı geçen eser
/ a.y.: Aynı yer
/ bs.: Basım
/ bsk.: Baskı
/ C.: Cilt
/ Çev.: Çeviren
/ Ed.: Editör
/ İ.Ü.: İstanbul Üniversitesi
/ No.: Numara
/ s.: Sayfa
/ SBE: Sosyal Bilimler Enstitüsü
/ T.C.: Türkiye Cumhuriyeti
/ t.y.: Tarih yok
/ v.d.: Ve diğerleri
/ y.y.: Yayım yeri yok / Yayımcı yok
