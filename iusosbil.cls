
% İstanbul Üniversitesi Sosyal Bilimler Enstitüsü Tez Şablonu Sınıf Dosyası
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iusosbil}[2025/06/21 İstanbul Üniversitesi Sosyal Bilimler Enstitüsü Tez Sınıfı]

\LoadClass[12pt,a4paper,oneside]{report}

% Paketler
\RequirePackage[top=4cm, bottom=2.5cm, left=4cm, right=2.5cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[turkish]{babel}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{fontspec}
\RequirePackage{enumitem}
\RequirePackage{sectsty}

% Yazı tipi
\setmainfont{Times New Roman}
\setsansfont{Arial}


% Satır aralığı
\onehalfspacing


% ---------------------
% Sayfa numarası alt orta
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}

% Başlık ayarları
\titleformat{\chapter}[hang]{\Large\bfseries}{\thechapter.}{1em}{}
\titleformat{\section}[hang]{\large\bfseries}{\thesection}{1em}{}

% Sayfa numaralandırma komutları
\newcommand{\romanpagenumber}{\renewcommand{\thepage}{\roman{page}}}
\newcommand{\arabicpagenumber}{\renewcommand{\thepage}{\arabic{page}}}
