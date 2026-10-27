// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ TEZ ŞABLONU (iusosbil.cls Karşılığı)
// ==============================================================================

#let iusosbil_tez(
  yazar: "",
  tez-turu: "DOKTORA TEZİ",
  body
) = {
  
  // ---------- Sayfa Kenar Boşlukları (Madde 4/a) ----------
  // Sol: 4cm, Üst: 4cm, Sağ: 2.5cm, Alt: 2.5cm
  // footskip: 1.3cm fancyhdr mantığı alt kenardan numara boşluğu ile ayarlandı.
  set page(
    paper: "a4",
    margin: (top: 4cm, bottom: 2.5cm, left: 4cm, right: 2.5cm),
    numbering: none, // İlk başta kapaklar için numarasız
  )
  
  // ---------- Motor Tespiti & Dil / Tipografi Yapılandırması ----------
  // Ana Metin: Times New Roman, 12 punto
  // Satır aralığı: yönerge Madde 4/b uyarınca 1,5 satır.
  set text(font: "Times New Roman", size: 12pt, lang: "tr")
  set par(
    justify: true, 
    leading: 1.5em, 
    first-line-indent: 1cm, 
    spacing: 1pt // Paragraflar arası ek boşluk bırakılmaz (\parskip=0pt)
  )

  // Yönerge başlık hiyerarşisi: 1, 1.1, 1.1.1, ...
  set heading(numbering: "1.1")
  
  // ---------- Başlık Biçimlendirmeleri (Madde 5/a) ----------
  // Tüm başlıklar (Kısım, bölüm, altbölüm) 14 punto ve KALIN (bfseries) olacaktır.
  
  // 1. Düzey Başlık (Bölüm / Chapter): 14pt, Kalın, Ortalı
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(0pt) // Üst boşluk
    align(center)[
      #text(size: 14pt, weight: "bold")[#it]
    ]
    v(20pt) // Alt boşluk
  }
  
  // 2. Düzey Başlık (Section): 14pt, Kalın, Sola Yaslı
  show heading.where(level: 2): it => {
    v(14pt)
    text(size: 14pt, weight: "bold")[#it]
    v(6pt)
  }
  
  // 3. Düzey Başlık (Subsection): 14pt, Kalın, Sola Yaslı
  show heading.where(level: 3): it => {
    v(12pt)
    text(size: 14pt, weight: "bold")[#it]
    v(4pt)
  }
  
  // 4. Düzey Başlık (Subsubsection): 14pt, Kalın, Sola Yaslı
  show heading.where(level: 4): it => {
    v(10pt)
    text(size: 14pt, weight: "bold")[#it]
    v(3pt)
  }

  // ---------- Dipnot Düzeni (Madde 4/b, 5/a, 19/a) ----------
  // Dipnotlar 10 punto, tek satır aralıklı (leading: 0.5em) ve iki yana yaslıdır.
  // Her yeni ana bölümde (level: 1 heading) dipnot sayacı otomatik sıfırlanır.
  show footnote.entry: set text(size: 10pt)
  show footnote.entry: set par(leading: 1em, justify: true, first-line-indent: 0cm)
  show heading.where(level: 1): it => {
    counter(footnote).update(0) // \counterwithin*{footnote}{chapter} karşılığı
    it
  }

  body
}

// ---------- Filolojik / Mısıroloji / Transliterasyon Fonksiyonları ----------
// .cls içindeki \translit, \alef, \ayin ve regex parantez dikleştirme makroları:
#let translit(body) = {
  set text(font: "Times New Roman", size: 11pt, style: "italic")
  set par(leading: 1em) // Tek satır aralığı
  
  // .cls dosyasındaki filolojik köşeli parantezleri (\textup) otomatik DÜZ yapma kuralı:
  show "[" : set text(style: "normal")
  show "]" : set text(style: "normal")
  show "⸢" : set text(style: "normal")
  show "⸣" : set text(style: "normal")
  show "⟨" : set text(style: "normal")
  show "⟩" : set text(style: "normal")
  
  body
}

#let alef = text(font: "Times New Roman", size: 11pt, style: "italic")[ꜣ]
#let ayin = text(font: "Times New Roman", size: 11pt, style: "italic")[ꜥ]
#let tabletrule = line(length: 40%, stroke: 0.5pt)

#let sumer(body) = text(font: "Times New Roman", style: "normal")[#body]
#let sup(body) = super(body)
