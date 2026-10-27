# İstanbul Üniversitesi SBE Tez Projesi

Bu proje, İstanbul Üniversitesi Sosyal Bilimler Enstitüsü tez yönergesine göre hazırlanmış Typst tez şablonudur. Eski XeLaTeX kaynakları `bolum/tex/` altında, güncel Typst kaynakları ise `bolum/typ/` altında bulunur.

## Hızlı başlangıç

Proje kök dizinindeyken ana belgeyi derleyin:

```sh
typst compile --diagnostic-format short bolum/typ/thesis.typ thesis.pdf
```

PDF’yi açmadan yalnızca hata kontrolü yapmak için aynı komut yeterlidir. `thesis.typ` ana dosyadır; alt dosyalar doğrudan değil, bu dosyaya `#include` ile eklenir.

## Dosya yapısı

- `bolum/typ/thesis.typ`: Tezin sırasını ve ana ayarlarını yönetir.
- `bolum/typ/iusosbil.typ`: Sayfa, yazı, paragraf, başlık, dipnot ve yardımcı komut ayarları.
- `bolum/typ/kapak.typ`: İç kapak.
- `bolum/typ/chap_frontmatter.typ`: Öz, Abstract, önsöz ve listeler.
- `bolum/typ/chap_intro.typ`: Giriş.
- `bolum/typ/chap_1.typ`, `chap_2.typ`, `chap_3.typ`: Tez bölümleri.
- `bolum/typ/chap_result.typ`: Sonuç.
- `bolum/typ/bibliyografi.typ`: Kaynakça.
- `bolum/typ/chap_attach.typ`: Ekler.
- `bolum/typ/CV.typ`: Özgeçmiş.
- `bolum/typ/kaynakca.bib`: BibLaTeX kaynakça verisi.
- `tez_hazırlama_yönergesi.pdf`: Biçimlendirme için başvurulan yönerge.

## Yeni bölüm ekleme

1. Yeni dosyayı `bolum/typ/chap_4.typ` gibi oluşturun.
2. Bölüm başlığını `#heading(level: 1)[...]` ile yazın.
3. Alt başlıklar için `level: 2`, `level: 3` ve `level: 4` kullanın.
4. Dosyayı `thesis.typ` içinde uygun sıraya ekleyin:

```typst
#include "chap_4.typ"
#pagebreak()
```

Başlık numaraları otomatik olarak `1`, `1.1`, `1.1.1` biçiminde üretilir.

## Tipografi kuralları

- Normal metin: Times New Roman, 12 punto, 1,5 satır.
- Dipnot: 10 punto, tek satır.
- Mısırca ve Hititçe transliterasyon blokları: Times New Roman, 11 punto, tek satır.
- Başlıklar: 14 punto, kalın.
- Sayfa numaraları alt ortadadır; ön kısım Roma rakamı, metin kısmı Arap rakamı kullanır.

Bu ayarları bölüm dosyalarında tekrar tanımlamak yerine `iusosbil.typ` içinden değiştirin. Sadece özel bir blok için farklı değer gerekiyorsa o bloğun içine yerel `#set text(...)` veya `#set par(...)` ekleyin.

## Filolojik dizgi yardımcıları

`thesis.typ` veya bölüm dosyasında yardımcıları içe aktarabilirsiniz:

```typst
#import "iusosbil.typ": sumer, sup, translit, alef, ayin
```

- `#sumer[LUGAL.GAL]`: Sümerogramı düz yazıyla gösterir.
- `#sup[URU]`: Üst simge üretir. Örneğin `#sumer[KUR] #sup[URU]`.
- `#translit[...]`: İtalik transliterasyon metni için kullanılır.
- `#alef` ve `#ayin`: Mısırbilimde kullanılan özel işaretlerdir.

Sümerogramların italik görünmemesi için Sümerogramı `#sumer[...]` içine alın. Üst simgeyi ayrıca `#sup[...]` ile yazın; iki komutu tek bir metin parçasında gerektiği kadar birlikte kullanabilirsiniz.

## Kaynakça

Kaynakları `bolum/typ/kaynakca.bib` dosyasına ekleyin. Kaynakça görünümü `bibliyografi.typ` içinde düzenlenir. `thesis.typ` içindeki bibliyografya ekleme satırını silmeden veya çoğaltmadan kullanın.

## Derleme sorunlarını giderme

Önce ana dosyayı derleyin ve hata satırını okuyun:

```sh
typst compile --diagnostic-format short bolum/typ/thesis.typ thesis.pdf
```

Sık görülen nedenler:

- Yeni dosya `thesis.typ` içine `#include` edilmemiştir.
- Köşeli parantez veya blok kapanışı eksiktir.
- Üst simge için `#sup[...]` yerine kapanmamış bir komut kullanılmıştır.
- Fontta bulunmayan özel karakter kullanılmıştır.
- Aynı kaynakça veya bölüm iki kez eklenmiştir.

Değişikliklerden sonra PDF önizlemesini yenileyin. Editör otomatik derlemiyorsa komut satırından yukarıdaki `typst compile` komutunu çalıştırın.

## Eski XeLaTeX kaynakları

`bolum/tex/` klasörü önceki XeLaTeX sürümünü içerir. Typst sürümünde çalışırken esas alınacak dosyalar `bolum/typ/` altındadır; iki sürümde aynı değişikliği elle yapmak gerekebilir.
