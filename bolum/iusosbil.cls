% ==============================================================================
% İstanbul Üniversitesi Sosyal Bilimler Enstitüsü Tez Şablonu Sınıf Dosyası
% İ.Ü. SBE Tez Hazırlama Yönergesi esas alınarak hazırlanmıştır.
% Texpad / Texifier (TexpadTeX dahili motoru) ve XeLaTeX ile tam uyumludur.
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iusosbil}[2026/10/25 İstanbul Üniversitesi Sosyal Bilimler Enstitüsü Tez Sınıfı]

% ---------- Temel Sınıf ----------
% Madde 2 & 5: A4 boyutunda, tek yüzlü (oneside), 12 punto temel yazı boyutu
\LoadClass[12pt,a4paper,oneside]{report}

% ---------- Sayfa Kenar Boşlukları ----------
% Madde 4/a: Sol: 4 cm, Üst: 4 cm, Sağ: 2.5 cm, Alt: 2.5 cm
% Madde 4: Sayfa numarası ile metin arasındaki boşluk 1.5 aralıklı bir satırdan az olmamalıdır.
\RequirePackage[
  a4paper,
  left=4cm,
  top=4cm,
  right=2.5cm,
  bottom=2.5cm,
  footskip=1.3cm,
  headheight=15pt
]{geometry}

% ---------- Motor Tespiti ve Dil/Tipografi Yapılandırması ----------
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\ifxetex
  % MacTeX / XeLaTeX Derleme Modu (Önerilen)
  \RequirePackage{fontspec}
  \RequirePackage{polyglossia}
  \setdefaultlanguage{turkish}
  \setotherlanguage{english}
  \RequirePackage{microtype}
  
  \IfFontExistsTF{Times New Roman}{
    \setmainfont{Times New Roman}
  }{
    \IfFontExistsTF{TeX Gyre Termes}{
      \setmainfont{TeX Gyre Termes}
    }{
      \setmainfont{Latin Modern Roman}
    }
  }

  % Transliterasyon fontu (Junicode, Charis SIL, Gentium Plus vb.)
  \IfFontExistsTF{Junicode}{
    \newfontfamily\egypto{Junicode}
  }{
    \IfFontExistsTF{Charis SIL}{
      \newfontfamily\egypto{Charis SIL}
    }{
      \IfFontExistsTF{Gentium Plus}{
        \newfontfamily\egypto{Gentium Plus}
      }{
        \IfFontExistsTF{Charis}{
          \newfontfamily\egypto{Charis}
        }{
          \newcommand{\egypto}{}
        }
      }
    }
  }

  % Özel Mısıroloji alef ve ayin harflerinin ana fontta (Times New Roman) eksik olması
  % durumunda otomatik olarak transliterasyon fontuna (Junicode) geçmesi sağlanır:
  \RequirePackage{newunicodechar}
  \newunicodechar{ꜣ}{{\egypto\textit{ꜣ}}}
  \newunicodechar{Ꜣ}{{\egypto\textit{Ꜣ}}}
  \newunicodechar{ꜥ}{{\egypto\textit{ꜥ}}}
  \newunicodechar{Ꜥ}{{\egypto\textit{Ꜥ}}}
  % Filolojik parantezler (Mısırca ve Hititçe) her zaman DİK / DÜZ (textup) ve Junicode fontuyla:
  \newunicodechar{⸢}{{\egypto\textup{⸢}}}
  \newunicodechar{⸣}{{\egypto\textup{⸣}}}
  \newunicodechar{⌈}{{\egypto\textup{⌈}}}
  \newunicodechar{⌉}{{\egypto\textup{⌉}}}
  \newunicodechar{⟦}{{\egypto\textup{⟦}}}
  \newunicodechar{⟧}{{\egypto\textup{⟧}}}
  \newunicodechar{⟨}{{\egypto\textup{⟨}}}
  \newunicodechar{⟩}{{\egypto\textup{⟩}}}
\else
  \ifluatex
    % LuaLaTeX Derleme Modu
    \RequirePackage{fontspec}
    \RequirePackage{polyglossia}
    \setdefaultlanguage{turkish}
    \setotherlanguage{english}
    \RequirePackage{microtype}
    
    \IfFontExistsTF{Times New Roman}{
      \setmainfont{Times New Roman}
    }{
      \setmainfont{TeX Gyre Termes}
    }

    \IfFontExistsTF{Junicode}{
      \newfontfamily\egypto{Junicode}
    }{
      \IfFontExistsTF{Charis SIL}{
        \newfontfamily\egypto{Charis SIL}
      }{
        \newcommand{\egypto}{}
      }
    }

    \RequirePackage{newunicodechar}
    \newunicodechar{ꜣ}{{\egypto\textit{ꜣ}}}
    \newunicodechar{Ꜣ}{{\egypto\textit{Ꜣ}}}
    \newunicodechar{ꜥ}{{\egypto\textit{ꜥ}}}
    \newunicodechar{Ꜥ}{{\egypto\textit{Ꜥ}}}
    \newunicodechar{⸢}{{\egypto\textup{⸢}}}
    \newunicodechar{⸣}{{\egypto\textup{⸣}}}
    \newunicodechar{⟨}{{\egypto\textup{⟨}}}
    \newunicodechar{⟩}{{\egypto\textup{⟩}}}
  \else
    % Texpad Dahili Motoru (TexpadTeX) veya Standart pdfLaTeX Modu:
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{mathptmx}         % Times New Roman metin ve eksiksiz matematik sembolleri
    \RequirePackage[turkish,english]{babel}
    \newcommand{\egypto}{}
  \fi
\fi

\RequirePackage{setspace}        % Satır aralığı yönetimi
\RequirePackage{ragged2e}        % İki yana yaslama kontrolleri
\RequirePackage{chngcntr}        % Sayaç yönetimi (dipnot sıfırlama vb.)

% \translit içindeki köşeli parantezleri de her zaman DİK / DÜZ yap:
\ifxetex
  \ExplSyntaxOn
  \tl_new:N \l__translit_arg_tl
  \cs_new_protected:Nn \translit_parse_brackets:n
   {
    \tl_set:Nn \l__translit_arg_tl { #1 }
    \regex_replace_all:nnN { \[ } { \c{textup}\cB\{[\cE\} } \l__translit_arg_tl
    \regex_replace_all:nnN { \] } { \c{textup}\cB\{]\cE\} } \l__translit_arg_tl
    \tl_use:N \l__translit_arg_tl
   }
  \cs_set_eq:NN \translitparsebrackets \translit_parse_brackets:n
  \ExplSyntaxOff
  \newcommand{\translit}[1]{{\setstretch{1.0}\fontsize{11pt}{13pt}\selectfont\egypto\itshape\translitparsebrackets{#1}}}
\else
  \newcommand{\translit}[1]{{\setstretch{1.0}\fontsize{11pt}{13pt}\selectfont\egypto\itshape #1}}
\fi

\newcommand{\alef}{{\fontsize{11pt}{13pt}\selectfont\egypto\itshape ꜣ}}
\newcommand{\ayin}{{\fontsize{11pt}{13pt}\selectfont\egypto\itshape ꜥ}}

% ---------- Satır Aralıkları ve Paragraf Düzeni ----------
% Madde 4/b: Tez metninde satırlar iki yana yaslı ve 1.5 aralıklı olmalıdır.
\setstretch{1.5}
\setlength{\parindent}{1cm}       % Paragraf başı girintisi
\setlength{\parskip}{0pt}         % Paragraflar arası ek boşluk bırakılmaz

% ---------- Sayfa Numaralandırma ve Başlık/Altlık Düzeni ----------
% Sayfa numaraları sayfanın alt orta kısmında yer alır.
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\fontsize{12pt}{14pt}\selectfont\thepage}

% Bölüm ilk sayfaları (plain stili) için de sağ alt numara
\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[C]{\fontsize{12pt}{14pt}\selectfont\thepage}
}

% Numaralandırma geçiş komutları
% Madde 3/a: Ön kısım küçük Romen rakamları (i, ii, iii...)
% Madde 3/b & 16/a: Girişten itibaren Arap rakamları (1, 2, 3...)
\newcommand{\baslatOnKisim}{%
  \pagenumbering{roman}%
  \setcounter{page}{3}% Kapak (i) ve Onay (ii) numarasız geçtiğinden Öz iii ile başlar
}
\newcommand{\baslatMetin}{%
  \clearpage%
  \pagenumbering{arabic}%
  \setcounter{page}{1}% Giriş 1. sayfadan başlar
}

% ---------- Başlık Biçimlendirmeleri ----------
% Madde 5/a: Tezin çeşitli kısım, bölüm, altbölümlerinin başlıkları için 14 punto kullanılmalıdır.
% NOT: TexpadTeX/LaTeX2e'de Türkçe karakterlerin (İ, Ş, Ğ vb.) bozulmaması için
% başlıklar doğrudan büyük harfle yazılır ve \MakeUppercase filtresi uygulanmaz.
\RequirePackage{titlesec}

% Bölüm (Chapter) Başlıkları: 14 punto, kalın, ortalı
\titleformat{\chapter}[hang]
  {\normalfont\fontsize{14pt}{18pt}\bfseries\centering}
  {\thechapter.}{0.8em}{}

% Numarasız Bölüm Başlıkları (GİRİŞ, ÖZ, ÖNSÖZ, SONUÇ, vb.): 14 punto, kalın, ortalı
\titleformat{name=\chapter,numberless}[hang]
  {\normalfont\fontsize{14pt}{18pt}\bfseries\centering}
  {}{0pt}{}

\titlespacing*{\chapter}{0pt}{0pt}{20pt}

% Alt Bölüm (Section) Başlıkları: 14 punto, kalın, sola yaslı
\titleformat{\section}[hang]
  {\normalfont\fontsize{14pt}{18pt}\bfseries}
  {\thesection}{0.8em}{}
\titlespacing*{\section}{0pt}{14pt}{6pt}

% İkinci Düzey Alt Bölüm (Subsection): 14 punto, kalın, sola yaslı
\titleformat{\subsection}[hang]
  {\normalfont\fontsize{14pt}{18pt}\bfseries}
  {\thesubsection}{0.8em}{}
\titlespacing*{\subsection}{0pt}{12pt}{4pt}

% Üçüncü Düzey Alt Bölüm (Subsubsection): 14 punto, kalın, sola yaslı
\titleformat{\subsubsection}[hang]
  {\normalfont\fontsize{14pt}{18pt}\bfseries}
  {\thesubsubsection}{0.8em}{}
\titlespacing*{\subsubsection}{0pt}{10pt}{3pt}

% ---------- Dipnot Düzeni ----------
% Madde 4/b: Dipnotlarda satırlar tek aralıklı yazılmalıdır.
% Madde 5/a: Dipnotlar için 10 punto kullanılmalıdır.
% Madde 19/a: Metinden tek satır aralık bırakılarak soldan başlayan kısa çizgiyle ayrılır.
% Madde 19/a: Dipnot numaraları her bölümün ilk sayfasında 1'den başlayarak her yeni bölümde tekrar 1'den başlar!
\counterwithin*{footnote}{chapter}

\renewcommand{\footnoterule}{%
  \kern -3pt
  \hrule width 5cm height 0.4pt
  \kern 3pt
}

\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont}

\makeatletter
\renewcommand{\@makefntext}[1]{%
  \begin{spacing}{1.0}%
  \noindent\textsuperscript{\@thefnmark}\,#1%
  \end{spacing}%
}
\makeatother

% ---------- Uzun Aktarmalar (Blok Alıntı) ----------
% Madde 4/b & Madde 18/e:
% Metindeki uzun aktarmalarda satırlar tek aralıklı ve metinden daha küçük puntolu yazılmalıdır.
% Alıntının ilk ve son satırları ile tez metni arasında en az çift aralıklı boşluk bırakılır.
\newenvironment{uzunalinti}{%
  \par\vspace{\baselineskip}%
  \begin{list}{}{%
    \setlength{\leftmargin}{1.5cm}%
    \setlength{\rightmargin}{1cm}%
    \setlength{\topsep}{0pt}%
    \setlength{\partopsep}{0pt}%
  }%
  \item\relax
  \fontsize{10.5pt}{13pt}\selectfont
  \begin{spacing}{1.0}%
}{%
  \end{spacing}%
  \end{list}%
  \vspace{\baselineskip}\par
}

% Standart quote ve quotation ortamlarını da yönergeye uygun hale getir
\renewenvironment{quote}{\begin{uzunalinti}}{\end{uzunalinti}}
\renewenvironment{quotation}{\begin{uzunalinti}}{\end{uzunalinti}}

% ---------- İçindekiler, Şekiller ve Tablolar Listesi ----------
% Madde 13, 14: İçindekiler'de bölüm ve alt bölümler başlangıç sayfa numaralarıyla belirtilir.
\RequirePackage{tocloft}
\renewcommand{\cftdot}{.}
\renewcommand{\cftdotsep}{1.5}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}

\setlength{\cftbeforechapskip}{0.6em}
\setlength{\cftbeforesecskip}{0.3em}

\renewcommand{\cftchapfont}{\normalfont\fontsize{12pt}{14pt}\bfseries}
\renewcommand{\cftsecfont}{\normalfont\fontsize{12pt}{14pt}\selectfont}
\renewcommand{\cftsubsecfont}{\normalfont\fontsize{12pt}{14pt}\selectfont}

\renewcommand{\cftchappagefont}{\normalfont\fontsize{12pt}{14pt}\bfseries}
\renewcommand{\cftsecpagefont}{\normalfont\fontsize{12pt}{14pt}\selectfont}
\renewcommand{\cftsubsecpagefont}{\normalfont\fontsize{12pt}{14pt}\selectfont}

% İçindekiler, Şekil ve Tablo başlıklarının ortalanması ve 14 punto olması
\renewcommand{\cfttoctitlefont}{\hfill\normalfont\fontsize{14pt}{18pt}\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill\normalfont\fontsize{14pt}{18pt}\bfseries}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\normalfont\fontsize{14pt}{18pt}\bfseries}
\renewcommand{\cftafterlottitle}{\hfill}

% ---------- Tablo ve Şekil Başlıkları (Caption) ----------
\RequirePackage{caption}
\captionsetup{
  font={small,stretch=1.0},
  labelfont=bf,
  labelsep=period,
  justification=centering
}

% ---------- Liste Ortamları ----------
\RequirePackage{enumitem}
\setlist{noitemsep, topsep=0.3em}

% ---------- Bağlantılar ve PDF İmleri ----------
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{bookmark}

% ---------- Kaynakça Yönetimi ----------
\RequirePackage{csquotes}        % biblatex için önerilen tırnak paketi
\DeclareQuoteStyle{turkish}{“}{”}{‘}{’}
\RequirePackage[
  backend=biber,
  style=authoryear,
  sorting=nyt,
  maxcitenames=3,
  mincitenames=1
]{biblatex}
\addbibresource{kaynakca.bib}

% Çok dar satır sonlarında küçük taşmaları önle.
\setlength{\emergencystretch}{1em}
