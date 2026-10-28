// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ TEZ ŞABLONU (iusosbil.cls Karşılığı)
// ==============================================================================

#let iusosbil_tez(
  yazar: "",
  tez-turu: "DOKTORA TEZİ",
  body
) = {
  
  // ---------- Sayfa Kenar Boşlukları (Madde 4/a) ----------
  set page(
    paper: "a4",
    margin: (top: 4cm, bottom: 2.5cm, left: 4cm, right: 2.5cm),
    numbering: none, // İlk başta kapaklar için numarasız
  )
  
  // ---------- Motor Tespiti & Dil / Tipografi Yapılandırması ----------
  set text(font: ("Times New Roman", "Times"), size: 12pt, lang: "tr")

  set par(
    justify: true,
    leading: 1.5em,                               // Satır arası boşluk (1.5 satır)
    first-line-indent: (amount: 1cm, all: true), // Her paragrafın ilk satırını 1 cm içeri alır
    spacing: 1.5em                                // Paragraf blokları arasındaki boşluk
  )

  // Yönerge başlık hiyerarşisi: 1, 1.1, 1.1.1, ...
  set heading(numbering: "1.1")
  
  // ---------- Başlık Biçimlendirmeleri (Madde 5/a) & Dipnot Sıfırlama ----------
  
  // 1. Düzey Başlık (Bölüm / Chapter): 14pt, Kalın, Ortalı + Dipnot Sayacı Sıfırlama
  show heading.where(level: 1): it => {
    counter(footnote).update(0) // Her yeni ana bölümde dipnot sayacını sıfırla
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
  // Dipnotlar 10 punto, tek satır aralıklı ve iki yana yaslı
  show footnote.entry: set text(size: 10pt)
  show footnote.entry: it => {
    set par(leading: 0.65em, justify: true, first-line-indent: 0cm)
    it
  }

  body
}

// ---------- Filolojik / Mısıroloji / Transliterasyon Fonksiyonları ----------
#let translit(body) = {
  set text(font: ("Times New Roman", "Times"), size: 11pt, style: "italic")
  set par(leading: 1em) // Tek satır aralığı
  
  // Filolojik köşeli parantezleri dik (normal) yapma kuralı
  show "[": set text(style: "normal")
  show "]": set text(style: "normal")
  show "⸢": set text(style: "normal")
  show "⸣": set text(style: "normal")
  show "⟨": set text(style: "normal")
  show "⟩": set text(style: "normal")
  
  body
}

#let alef = text(font: ("Times New Roman", "Times"), size: 11pt, style: "italic")[ꜣ]
#let ayin = text(font: ("Times New Roman", "Times"), size: 11pt, style: "italic")[ꜥ]
#let tabletrule = line(length: 40%, stroke: 0.5pt)

#let sumer(body) = text(font: ("Times New Roman", "Times"), style: "normal")[#body]
#let sup(body) = super(body)