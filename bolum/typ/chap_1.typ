// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ
// BÖLÜM 1 (Madde 16/c, d ve Madde 17/b - İkinci Sistem)
// ==============================================================================

#import "iusosbil.typ": sumer, sup

// --- BÖLÜM BAŞLIĞI ---
#heading(level: 1)[KURAMSAL ÇERÇEVE VE KAVRAMSAL YAKLAŞIMLAR]

#heading(level: 2)[Temel Kavramlar ve Yöntemsel İlkeler]

Sosyal bilim araştırmalarında kullanılan terimlerde ve üslupta birlik sağlanması yönergenin temel ilkelerindendir. Örneğin, metinde aynı anlama gelen terimlerin (örneğin ‘yasa’ / ‘kanun’ ya da ‘kuram’ / ‘teori’) hangisi seçildiyse o terimde tutarlılık gösterilmelidir.

// SBE Madde 19/a uyarınca dipnot ayarları: 10 punto ve tek satır aralığı (leading: 0.6em)
#show footnote.entry: set text(size: 10pt)
#show footnote.entry: set par(leading: 1em, justify: true)




#heading(level: 3)[Doğrudan Alıntılar ve Blok Aktarma Kuralları]

Bir cümleyi aşmayan kısa alıntılar metin içinde çift tırnak ("...") ile gösterilir (Madde 18/a). Daha uzun aktarmalarda ise alıntı ile metin arasında belirgin bir ayrım yapılmalıdır (Madde 18/e ve Madde 4/b):

// \begin{uzunalinti} karşılığı: Madde 4/b ve 18/e uyarınca daha küçük punto, tek satır aralığı ve blok girintisi
#block(
  inset: (left: 1.5cm, right: 1cm),
  above: 2em,
  below: 2em,
)[
  #set text(size: 12pt)
  #set par(leading: 1em, justify: true, first-line-indent: 0cm)
  Kaynaklardan aynen yapılan alıntılar, bir cümleyi aşmayacak uzunluktaysa, tez metni içinde verilirler. Daha uzun alıntılarda, alıntının ilk ve son satırları ile tez metni arasında en az çift aralıklı boşluk bırakılarak, alıntı ile metnin ayırt edilmesi sağlanır. Bu tür alıntılar için, tez metninde kullanılan puntodan daha küçük punto kullanılır ve satırlar tek aralıklı yazılır (Madde 4/b, 18/e).
]

#heading(level: 2)[Özel Karakterler ve Transliterasyon]
Tezde yabancı alfabeler, hiyeroglif veya çivi yazısı transliterasyonları kullanılması durumunda uygun yazı tipleri devreye girer:

// Mısıroloji / Transliterasyon Bloğu
 #block(width: 100%, inset: (left: 1.5cm, right: 1cm))[
  // Künye
  #set text(font: "Times New Roman", size: 12pt, weight: "bold")
  Mısır metni başlığı (kaynak) \
  Metin / bölüm bilgisi \
  sat. ...
  #v(0.25em)
  #block(width: 100%)[
    #line(length: 100%, stroke: 0.5pt)
  ]
  #v(0.35em)

  // Transliterasyon
  #set text(font: "Times New Roman", size: 11pt, weight: "regular")
  #set par(justify: true) // Dilbilimsel özel karakterleri destekleyen bir font
  1- _jr m ntw.f ḫr.tw sn.wy n wꜥ m(jw)t n wꜥ jt(j) jnpw rn pꜣ ꜥꜣ jw bꜣtꜣw rn pꜣ šrjw ḫr jr jnpw sw ẖry pr ẖry ḥmt_ \
  2- _jw pꜣy.f sn šrjw m-dj.f mj sḫrw n šrjw jw m ntw.f jrr.tw n.f ḥbsw jw.f ḥr šmyt m-sꜣ nꜣy.f jꜣwt r sḫtw_ \
  3- [_j_]_w m ntw.f jrr.tw skꜣ m ntw.f ꜥwꜣyw ḫr m ntw.f jrrt.n.f wpwt nb nty m sḫtw js.tw jw pꜣy.f sn šrjw_
  #v(0.8em)
]

// Hititçe Çivi Yazısı Transliterasyon Bloğu (\begin{htranslit})



#block(width: 100%, inset: (left: 1.5cm, right: 1cm))[
  

  // Künye
  #set text(font: "Times New Roman", size: 12pt, weight: "bold")

  I. Hattušili’nin Yıllıkları (CTH 4.2) \
  Öy. I \
  sat. 22–32

  #v(0.25em)
  #block(width: 100%)[
    #line(length: 100%, stroke: 0.5pt)
  ]
  #v(0.35em)

  // Transliterasyon
  #set text(font: "Times New Roman", size: 11pt, weight: "regular")
  #set par(leading: 1em, justify: true, first-line-indent: 0pt)

  1-[#sumer[LUGAL.GAL] _Ta-ba-ar_]_-⸢na⸣_ #sup[m]_Ḫa-at-tu-ši-li_ #sumer[LUGAL.GAL] \
  2-[#sumer[LUGAL] #sumer[KUR] #sup[URU]_Ḫa-at-_]_ti_ #sumer[LÚ] #sup[URU]_Ku-uš-šar_ #sumer[KUR] #sup[URU]_Ḫa-at-⸢ti⸣_ \
  3-[#sumer[LUGAL] _e-ez-zi-a-at_] _ŠA_ #sup[f]_Ta-wa-an-na-an-na_ #sumer[DUMU] #sumer[ŠEŠ]_-ŠU_ \
  4-[_I-NA_ #sup[URU]_Š_]_a-na-wi-it-ta pa-it ša-an na-at-ta_ \
  5-[_ḫar-ni-ik_]_-⸢t⸣a na ut-ni-eš še-it ḫar-ni-ik-ta_ \
  6-[_nu-kán_ ERÍN#sup[MEŠ]] 2 _AŠ-RA a-ša-an-du-la-ni da-\<la\>-⸢aḫ-ḫu⸣-un_ \
  7-[_ku-u_]_-e a-ša-u-wa-ar e-eš-_[_t_]_a_ \
  8-[_na-at A-⸢NA⸣_] ERÍN#sup[MEŠ] _a-ša-an-du-li pí-aḫ-ḫu-⸢un⸣_ \
  #v(0.25em)
  #block(width: 100%)[#line(length: 100%, stroke: 0.5pt)]
  #v(0.35em)
  9-[EGIR_-an-da_]_-ma I-NA_ #sup[URU]_Za-la-pa pa-a_[............]_-un_\
  10-[_na-an_]_⸢ha⸣r-ni-in-ku-un nu-uš-ši_ D#sup[MEŠ]_-ŠU ša-ra-a da-aḫ-ḫu-un_ \
  11-[_Ù_ 3 #sup[GIŠ]#sumer[GIGIR]#sup[MEŠ] _MA-AD-NA-NU A-NA_ #sup[D]#sumer[UTU] #sup[URU]#sumer[TÚL]_-na pí-aḫ-ḫu-un_|] \
  #v(0.25em)
  #block(width: 100%)[#line(length: 100%, stroke: 0.5pt)]
  #v(0.35em)
  12-[1 #sumer[GUD] KÙ.BABBAR 1 GEŠPU KÙ.BABBAR _I-NA_ #sumer[É] #sup[D]#sumer[IM] _pí-aḫ-ḫu-un_ |] \
  13-[[_a-aš-ir-ma_]_-kán ku-i-e-eš na-aš I-NA_ É #sup[D]_Me-ez-zu-ul-la_|] \
  14-[_pí-da-aḫ-ḫu_[.............................................]-_un_] 
  #v(0.25em)
  #block(width: 100%)[#line(length: 100%, stroke: 0.5pt)]
]
\
Bu sayede eskiçağ dilleri ve filolojik metinler özgün işaretleriyle bozulmadan aktarılabilmektedir.
