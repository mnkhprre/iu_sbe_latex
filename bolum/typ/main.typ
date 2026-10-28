// ==============================================================================
// İSTANBUL ÜNİVERSİTESİ SOSYAL BİLİMLER ENSTİTÜSÜ TEZ MASTER DOSYASI
// ==============================================================================

// 1. iusosbil.typ dosyasındaki kuralları ve filolojik fonksiyonları içeri aktar
#import "iusosbil.typ": iusosbil_tez,

// 2. Şablon fonksiyonunu tüm belgeye giydir
#show: iusosbil_tez.with(
  yazar: "Adı SOYADI",
  tez-turu: "DOKTORA TEZİ"
)

// ==============================================================================
// A. ÖN KISIM (Madde 8/A)
// ==============================================================================

// 1. İç Kapak (Madde 9 & Örnek 1 - Sayfa numarası görünmez, sayfa i kabul edilir)
#include "kapak.typ"

// 2. Tez Onay Sayfası (Madde 10 - Sayfa numarası görünmez, sayfa ii kabul edilir)
#include "chap_approve.typ"

// 3. Öz (iii), Abstract (iv), Önsöz, İçindekiler, Tablo/Şekil/Kısaltma Listeleri
// .cls Madde 3/a uyarınca numaralar ALT ORTADA roma rakamları (iii) ile başlar.
#set page(
  numbering: "i",
  number-align: bottom + center
)
#counter(page).update(3) // i ve ii kapak sayıldığı için otomatik olarak iii'ten başlatıyoruz

#include "chap_frontmatter.typ"

// ==============================================================================
// B. METİN KISMI (Madde 8/B)
// Giriş'ten itibaren Arap rakamlarıyla (1, 2, 3...) alt-ortada başlar (Madde 16/a).
// ==============================================================================

#set page(
  numbering: "1",
  number-align: bottom + center
)
#counter(page).update(1) // Giriş kısmında sayfa numarasını 1'e sıfırla


#include "chap_intro.typ" // Giriş Bölümü (Madde 16/a, b) - Numarasız başlık
#include "chap_1.typ" //Tezin Bölümleri(Madde 16/c,d-Giriş hariç en az üç bölümden oluşur)
#include "chap_2.typ"
#include "chap_3.typ"
#include "chap_result.typ" // Sonuç Bölümü (Madde 16/e) - Numarasız başlık
#include "bibliyografi.typ" // Kaynakça / Bibliyografya (Madde 22)
#include "chap_attach.typ" // Ekler (Madde 23)
#include "CV.typ"// Özgeçmiş (Madde 8/B ve Madde 3 - Doktora tezleri için zorunludur)