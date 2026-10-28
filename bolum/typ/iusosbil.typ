// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ TEZ ŞABLONU (iusosbil.cls Karşılığı)
// ==============================================================================
#let kt = "”" // Kapanış Tırnağı Kısayolu

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
    leading: 1.5em,                             // Satır arası boşluk (1.5 satır)
    first-line-indent: (amount: 1cm, all: true), // Her paragrafın ilk satırını 1 cm içeri alır
    spacing: 1.5em                               // Paragraf blokları arasındaki boşluk
  )

  // Yönerge başlık hiyerarşisi: 1, 1.1, 1.1.1, ...
  set heading(numbering: "1.1")
  
  // ---------- Başlık Biçimlendirmeleri (Madde 5/a) & Dipnot Sıfırlama ----------
  show heading.where(level: 1): it => {
    counter(footnote).update(0) // Her yeni ana bölümde dipnot sayacını sıfırla
    pagebreak(weak: true)
    v(0pt) // Üst boşluk
    align(center)[
      #text(size: 14pt, weight: "bold")[#it]
    ]
    v(20pt) // Alt boşluk
  }
  
  show heading.where(level: 2): it => { v(14pt); text(size: 14pt, weight: "bold")[#it]; v(6pt) }
  show heading.where(level: 3): it => { v(12pt); text(size: 14pt, weight: "bold")[#it]; v(4pt) }
  show heading.where(level: 4): it => { v(10pt); text(size: 14pt, weight: "bold")[#it]; v(3pt) }

  // ---------- Dipnot Düzeni ----------
  show footnote.entry: set text(size: 10pt)
  show footnote.entry: it => {
    set par(leading: 0.65em, justify: true, first-line-indent: 0cm)
    it
  }

  // ---------- Akıllı Tırnak & Otomatik Yönlendirme ----------
  set smartquote(quotes: "“”", enabled: true)
  
  // İtalik sonundaki ("_") veya kelime/noktalama sonrasındaki düz tırnağı (") zorla KAPANIŞ tırnağı (”) yapar
  show regex("(_|\\w|\\.|,|!|\\?)\""): it => it.text.slice(0, -1) + "”"

  body
}

// ---------- Filolojik / Mısıroloji / Transliterasyon Fonksiyonları ----------
#let translit(body) = {
  set text(font: ("Times New Roman", "Times"), size: 11pt, style: "italic")
  set par(leading: 1em)
  
  show "[": set text(style: "normal")
  show "]": set text(style: "normal")
  show "⸢": set text(style: "normal")
  show "⸣": set text(style: "normal")
  show "⟨": set text(style: "normal")
  show "⟩": set text(style: "normal")
  
  body
}

#let tabletrule = line(length: 40%, stroke: 0.5pt)
#let sup(body) = super(body)
#let hiero(body) = text(font: "Aegyptus", body)
#let cunei(body) = text(font: "Noto Sans Cuneiform", body)

// ==============================================================================
// Mısıroloji Transliterasyon & Çeviri Bloğu
// ==============================================================================
#let eb(
  b: "", 
  m: "", 
  s: "", 
  ceviri: none, 
  body
) = [
  #v(0.15em)
  #block(width: 100%, inset: (left: 1.2cm, right: 0.8cm))[
    // Künye Bilgisi
    #set text(font: ("Times New Roman", "Times"), size: 10.5pt, weight: "bold")
    #set par(leading: 0.35em, spacing: 0.2em)
    
    #[
      #show footnote: it => box(width: 0pt, height: 0pt)[#text(size: 0pt)[#hide(it)]]
      #if b != "" [#b \ ]
      #if m != "" [#m \ ]
      #if s != "" [sat. #s]
    ]
    
    #v(0.15em)
    #line(length: 100%, stroke: 0.5pt)
    #v(0.25em)

    // 1. TRANSLİTERASYON BLOĞU
    #set text(font: ("Antinoou"), size: 10pt, weight: "regular", style: "normal")
    #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)

    #show "[": set text(style: "normal")
    #show "]": set text(style: "normal")
    #show "(": set text(style: "normal")
    #show ")": set text(style: "normal")
    #show "?": set text(style: "normal")
    #show "“": set text(style: "normal")
    #show "”": set text(style: "normal")

    #body

    // 2. TÜRKÇE ÇEVİRİ BLOĞU (Sola/Dışarı Kaydırılmış)
    #if ceviri != none [
      #v(0.35em)
      #block(inset: (left: -1cm))[
        #set text(style: "normal", size: 10pt)
        #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)
        #ceviri
      ]
    ]
  ]
  #v(0.15em)
]

// ==============================================================================
// Hititçe Transliterasyon & Çeviri Bloğu (Görünmez Dipnot Çözümlü)
// ==============================================================================
#let hb(
  b: "", 
  m: "", 
  s: "", 
  ceviri: none, 
  body
) = [
  #v(0.15em)
  #block(width: 100%, inset: (left: 1.2cm, right: 0.8cm))[
    // Künye Bilgisi
    #set text(font: ("Times New Roman", "Times"), size: 10.5pt, weight: "bold")
    #set par(leading: 0.35em, spacing: 0.2em)
    
    #[
      #show footnote: it => box(width: 0pt, height: 0pt)[#text(size: 0pt)[#hide(it)]]
      #if b != "" [#b \ ]
      #if m != "" [#m \ ]
      #if s != "" [#s]
    ]
    
    #v(0.15em)
    #line(length: 100%, stroke: 0.5pt)
    #v(0.25em)

    // 1. HİTİTÇE TRANSLİTERASYON BLOĞU & FİLOLOJİK DİKLEŞTİRME KURALLARI
    #set text(font: ("Times New Roman", "Times"), size: 10pt, weight: "regular")
    #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)

    #show "[": set text(style: "normal")
    #show "]": set text(style: "normal")
    #show "⸢": set text(style: "normal")
    #show "⸣": set text(style: "normal")
    #show "⟨": set text(style: "normal")
    #show "⟩": set text(style: "normal")
    #show "<": set text(style: "normal")
    #show ">": set text(style: "normal")
    #show "|": set text(style: "normal")
    #show "(": set text(style: "normal")
    #show ")": set text(style: "normal")
    #show "?": set text(style: "normal")
    #show "“": set text(style: "normal")
    #show "”": set text(style: "normal")

    #body

    // 2. TÜRKÇE ÇEVİRİ BLOĞU (Sola/Dışarı Kaydırılmış)
    #if ceviri != none [
      #v(0.35em)
      #block(inset: (left: -1cm))[
        #set text(style: "normal", size: 10pt)
        #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)
        #ceviri
      ]
    ]
  ]
  #v(0.15em)
]
// ==============================================================================
// Eski Yunanca Transliterasyon & Çeviri Bloğu (Epigrafi / Klasik Metin)
// ==============================================================================
#let yb(
  b: "", 
  m: "", 
  s: "", 
  ceviri: none, 
  body
) = [
  #v(0.15em)
  #block(width: 100%, inset: (left: 1.2cm, right: 0.8cm))[
    // Künye Bilgisi
    #set text(font: ("Times New Roman", "Times"), size: 10.5pt, weight: "bold")
    #set par(leading: 0.35em, spacing: 0.2em)
    
    #[
      #show footnote: it => box(width: 0pt, height: 0pt)[#text(size: 0pt)[#hide(it)]]
      #if b != "" [#b \ ]
      #if m != "" [#m \ ]
      #if s != "" [#s]
    ]
    
    #v(0.15em)
    #line(length: 100%, stroke: 0.5pt)
    #v(0.25em)

    // 1. GREEK / YUNANCA METİN BLOĞU (Klasik Times New Roman / İtalik veya Normal)
    #set text(font: ("Times New Roman", "Times"), size: 10pt, weight: "regular", style: "normal")
    #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)

    // Epigrafik İşaret Dikleştirme Kuralları (Köşeli parantezler ve şüpheli harfler)
    #show "[": set text(style: "normal")
    #show "]": set text(style: "normal")
    #show "(": set text(style: "normal")
    #show ")": set text(style: "normal")
    #show "⸢": set text(style: "normal")
    #show "⸣": set text(style: "normal")
    #show "⟨": set text(style: "normal")
    #show "⟩": set text(style: "normal")
    #show ".": set text(style: "normal") // Noktalı alt harfler için
    #show "?": set text(style: "normal")
    #show "“": set text(style: "normal")
    #show "”": set text(style: "normal")

    #body

    // 2. TÜRKÇE ÇEVİRİ BLOĞU (Sola/Dışarı Kaydırılmış)
    #if ceviri != none [
      #v(0.35em)
      #block(inset: (left: -1cm))[
        #set text(style: "normal", size: 10pt)
        #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)
        #ceviri
      ]
    ]
  ]
  #v(0.15em)
]

// ==============================================================================
// Latince Transliterasyon & Çeviri Bloğu (Epigrafi / Klasik Metin)
// ==============================================================================
#let lb(
  b: "", 
  m: "", 
  s: "", 
  ceviri: none, 
  body
) = [
  #v(0.15em)
  #block(width: 100%, inset: (left: 1.2cm, right: 0.8cm))[
    // Künye Bilgisi
    #set text(font: ("Times New Roman", "Times"), size: 10.5pt, weight: "bold")
    #set par(leading: 0.35em, spacing: 0.2em)
    
    #[
      #show footnote: it => box(width: 0pt, height: 0pt)[#text(size: 0pt)[#hide(it)]]
      #if b != "" [#b \ ]
      #if m != "" [#m \ ]
      #if s != "" [#s]
    ]
    
    #v(0.15em)
    #line(length: 100%, stroke: 0.5pt)
    #v(0.25em)

    // 1. LATİNCE METİN BLOĞU (Klasik Times New Roman / Genellikle İtalik veya Normal)
    #set text(font: ("Times New Roman", "Times"), size: 10pt, weight: "regular", style: "normal")
    #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)

    // Epigrafik İşaret Dikleştirme Kuralları (Leiden Sistemi İşaretleri)
    #show "[": set text(style: "normal")
    #show "]": set text(style: "normal")
    #show "(": set text(style: "normal")
    #show ")": set text(style: "normal")
    #show "⸢": set text(style: "normal")
    #show "⸣": set text(style: "normal")
    #show "⟨": set text(style: "normal")
    #show "⟩": set text(style: "normal")
    #show ".": set text(style: "normal") // Noktalı alt harfler için
    #show "?": set text(style: "normal")
    #show "“": set text(style: "normal")
    #show "”": set text(style: "normal")

    #body

    // 2. TÜRKÇE ÇEVİRİ BLOĞU (Sola/Dışarı Kaydırılmış)
    #if ceviri != none [
      #v(0.35em)
      #block(inset: (left: -1cm))[
        #set text(style: "normal", size: 10pt)
        #set par(justify: true, first-line-indent: 0pt, leading: 0.45em, spacing: 0.35em)
        #ceviri
      ]
    ]
  ]
  #v(0.15em)
]