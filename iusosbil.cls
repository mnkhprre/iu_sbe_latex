% İstanbul Üniversitesi Sosyal Bilimler Enstitüsü Tez Şablonu Sınıf Dosyası
\NeedsTeXFormat{LaTeX2e} % Bu sınıf dosyasının LaTeX2e sürümünü gerektirdiğini belirtir.
\ProvidesClass{iusosbil}[2025/06/22 İstanbul Üniversitesi Sosyal Bilimler Enstitüsü Tez Sınıfı]
% Sınıf dosyasının adını ve tarihini bildirir. Diğer belgeler bunu tanıdığı zaman bu bilgiyi kullanabilir.

% ---------- Temel Sınıf ----------
\LoadClass[12pt,a4paper,oneside]{report}
% report sınıfını temel alır.
% - 12pt: Yazı boyutu 12 punto
% - a4paper: A4 kağıt boyutu
% - oneside: Tek sayfa düzeni (iki yüzlü baskı için twoside kullanılır)

% ---------- Temel Paketler ----------
\RequirePackage[top=4cm,bottom=2.5cm,left=4cm,right=2.5cm]{geometry} % Sayfa kenar boşluklarını ayarlar. (Tez için üst/sol: 4 cm, alt/sağ: 2.5 cm)
\RequirePackage{fontspec} % XeLaTeX veya LuaLaTeX ile sistem yazı tiplerini kullanmak için gerekli.
\RequirePackage{microtype} % Tipografi iyileştirmeleri sağlar (karakter aralıkları, taşmalar vb.).
\RequirePackage{polyglossia} % Çok dilli destek sağlar; XeLaTeX ile birlikte kullanılır.
\RequirePackage{titlesec} % Başlık biçimlendirme ayarlarını özelleştirmek için kullanılır (bölüm, alt bölüm vb.).
\RequirePackage{fancyhdr} % Sayfa başlıkları ve altlıklarını özelleştirmek için kullanılır.
\RequirePackage{hyperref} % PDF dosyasında bağlantı ve yer imi desteği sağlar (içindekilerden tıklama gibi).

\RequirePackage{enumitem} % Liste (itemize/enumerate) yapılarını özelleştirmeye yarar (madde aralıkları vb.).
\RequirePackage{bookmark} % PDF yer imlerini daha doğru ve hızlı oluşturmak için hyperref ile birlikte çalışır.
\RequirePackage{caption} % Şekil ve tablo başlıklarını özelleştirmek için kullanılır.

\RequirePackage{tocloft}
% İçindekiler, şekil ve tablo listelerinin biçimlendirmesini değiştirir.
\renewcommand{\cftdot}{.} % Nokta dizisini etkinleştir (nokta karakteri)
\renewcommand{\cftdotsep}{1.5} % Noktalar arası boşluk (ayarlanabilir)
% Ana başlık (chapter) ile sayfa numarası arasında nokta dizisi aktif et
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

% Diğer başlıklar için (section, subsection) nokta dizisi zaten varsa:
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

% Yazı tipi ve aralık ayarları
\setlength{\cftbeforesecskip}{0.5em} % İçindekilerde bölüm ve alt bölümler arası dikey boşluk
\renewcommand{\cftchapfont}{\bfseries} % İçindekilerde bölüm başlıkları kalın yazılır
\renewcommand{\cftsecfont}{\rmfamily} % İçindekilerde section başlıkları normal (roman) fontta
\renewcommand{\cftsubsecfont}{\rmfamily} % İçindekilerde subsection başlıkları normal fontta
\renewcommand{\cftchappagefont}{\bfseries} % İçindekilerde bölüm sayfa numarası kalın yazılır
\renewcommand{\cftsecpagefont}{\rmfamily} % İçindekilerde section sayfa numarası normal fontta
\renewcommand{\cftsubsecpagefont}{\rmfamily} % İçindekilerde subsection sayfa numarası normal fontta

\RequirePackage[
  backend=biber, % Kaynakça motoru olarak biber kullanılır (modern ve gelişmiş)
  style=authoryear, % Yazar-tarih biçimli alıntılama (örn. (Yılmaz 2020))
  sorting=nyt % Kaynakça sıralaması: name → year → title (adı, yılı, başlığına göre)
]{biblatex}

% ---------- Dil Ayarları ----------
\setdefaultlanguage{turkish} % Belgenin ana dili Türkçe olarak ayarlanır (tireleme, tarih formatı, çeviriler vs.).
\setotherlanguage{english} % İngilizce ikinci dil olarak tanımlanır (çift dilli belgeler için kullanılabilir).

% ---------- Yazı Tipi ----------
\setmainfont{Times New Roman} % Ana yazı tipi olarak Times New Roman sistem fontu kullanılır.
\newfontfamily\egypto[
  UprightFont = {*}, % Normal stil için ana font
  ItalicFont = {* Italic} % İtalik stil için özel olarak italic varyantı tanımlanır
]{Charis} % Transliterasyon için kullanılan Charis fontu tanımlanır (Unicode destekli, özel karakterler için uygundur).
% ---------- Transliterasyon Komutları ----------
\newcommand{\alef}{{\egypto\textit{ꜣ}}} % Hiyeroglif transliterasyonundaki 'ꜣ' karakteri için komut (italik ve Charis fontu ile)
\newcommand{\ayin}{{\egypto\textit{ꜥ}}} % Hiyeroglif transliterasyonundaki 'ꜥ' karakteri için komut (italik ve Charis fontu ile)
\newcommand{\translit}[1]{{\egypto\textit{#1}}} % Transliterasyon metnini Charis fontuyla ve italik şekilde yazmak için genel amaçlı komut

% İçindekilerde bölüm başlıkları arasındaki dikey boşluk
\setlength{\cftbeforesecskip}{0.5em} % Bölümler arasındaki boşluk okunabilirlik için artırılır
% İçindekilerde bölüm başlıklarının ve sayfa numaralarının fontları
\renewcommand{\cftchapfont}{\bfseries} % Bölüm başlıkları kalın yazılır
\renewcommand{\cftsecfont}{\rmfamily} % Section başlıkları normal fontta
\renewcommand{\cftsubsecfont}{\rmfamily} % Subsection başlıkları normal fontta
\renewcommand{\cftchappagefont}{\bfseries} % Bölüm sayfa numarası kalın yazılır
\renewcommand{\cftsecpagefont}{\rmfamily} % Section sayfa numarası normal fontta
\renewcommand{\cftsubsecpagefont}{\rmfamily} % Subsection sayfa numarası normal fontta

% ---------- Başlık Biçimi ----------
\titleformat{\chapter}{\centering\bfseries}{\thechapter.}{1em}{} % Chapter başlıkları ortalanır ve kalın yazılır
\titleformat{\section}{\bfseries}{\thesection}{1em}{} % Section başlıkları kalın yazılır
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection}{1em}{} % Subsection başlıkları normal boyut ve kalın yazılır

\titleformat{\subsubsection}{\normalsize\itshape}{\thesubsubsection}{1em}{} % Subsubsection başlıkları normal boyut ve italik yazılır

% ---------- Sayfa Numaraları ----------
\pagestyle{fancy} % fancyhdr paketi ile sayfa düzeni özelleştirilir
\fancyhf{} % Tüm varsayılan üst ve alt bilgiler temizlenir
\renewcommand{\headrulewidth}{0pt} % Üst çizgi kaldırılır
\renewcommand{\footrulewidth}{0pt} % Alt çizgi kaldırılır

\fancyfoot[C]{\thepage} % Sayfa numarası alt orta kısma yerleştirilir

% ---------- Sayfa Numaralandırma Komutları ----------
\newcommand{\romanpagenumber}{\pagenumbering{roman}} % Roma rakamıyla sayfa numaralandırma için komut (örn. önkısım)
\newcommand{\arabicpagenumber}{\pagenumbering{arabic}} % Normal Arap rakamlarıyla sayfa numaralandırma için komut (örn. giriş ve sonrası)

% ---------- Kaynakça ----------
\addbibresource{kaynakca.bib} % Kaynakça dosyasını belirtir; burada 'kaynakca.bib' isimli dosya kullanılacak
