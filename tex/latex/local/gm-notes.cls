\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{gm-notes}[2019/04/20]

\RequirePackage{xkeyval}
\RequirePackage{xifthen}

\newboolean{@gm@thmsecnum}\setboolean{@gm@thmsecnum}{true}
\DeclareOptionX[gm]{nosec}{\setboolean{@gm@thmsecnum}{false}}

\DeclareOptionX[gm]{notoc}{\AtBeginDocument{\renewcommand{\tableofcontents}{}}}

\newboolean{@gm@nosubsec}
\DeclareOptionX[gm]{nosubsec}{\setboolean{@gm@nosubsec}{true}}

\newboolean{@gm@titlepage}
\DeclareOptionX[gm]{titlepage}{\setboolean{@gm@titlepage}{true}}

\newboolean{@gm@wide}
\DeclareOptionX[gm]{wide}{\setboolean{@gm@wide}{true}}

\newboolean{@gm@ref}
\DeclareOptionX[gm]{ref}{\setboolean{@gm@ref}{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tufte-handout}}

\ProcessOptionsX*[gm]\relax

\ifthenelse{\boolean{@gm@wide}}{
  \PassOptionsToPackage{letterpaper,margin=1in}{geometry}
}{
 \PassOptionsToPackage{letterpaper,left=1in,top=1in,bottom=0.9in ,headsep=2\baselineskip,textwidth=26pc,marginparsep=2pc,marginparwidth=12pc,headheight=\baselineskip}{geometry}
}

\PassOptionsToClass{symmetric,nobib}{tufte-handout}
\LoadClass{tufte-handout}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsxtra}
\RequirePackage{amsfonts}

\hypersetup{colorlinks,
  bookmarksdepth=subsection,
  citecolor=DarkGreen,
  linkcolor=Maroon,
  urlcolor=DarkBlue}

\RequirePackage{cleveref}

\RequirePackage{fontspec}

\RequirePackage{newpxmath}

\setmainfont{texgyrepagella}[
  Extension=.otf,
  UprightFont=*-regular,
  ItalicFont=*-italic,
  BoldFont=*-bold,
  BoldItalicFont=*-bolditalic,
  Numbers={OldStyle,Proportional},
  Ligatures=TeX]

\RequirePackage{csquotes}

\newfontfamily\gk{GFS Porson}
\RequirePackage{polyglossia}
\setmainlanguage{english}
\setotherlanguage[variant=ancient]{greek}

\RequirePackage{enumitem}
\setlist[enumerate]{itemsep=1pt,topsep=3pt,leftmargin=2em}
\renewcommand{\theenumi}{\alph{enumi}} \renewcommand{\labelenumi}{\theenumi)} \renewcommand{\theenumii}{\roman{enumii}}

\ifthenelse{\boolean{@gm@ref}}
{\RequirePackage[style=chicago-authordate,autocite=footnote,backend=biber]{biblatex}
\usepackage{xparse}
\usepackage{xpatch}
\makeatletter
\xpatchcmd{\@footnotetext}%
{\color@begingroup}
{\color@begingroup\toggletrue{blx@footnote}}
{}
{}
\makeatother
\DeclareCiteCommand{\sidecitehelper}
{\usebibmacro{prenote}}
{\usebibmacro{citeindex}%
\usebibmacro{cite}}
{\multicitedelim}
{\usebibmacro{cite:postnote}}
\ExplSyntaxOn
\NewDocumentCommand\sidecite{D<>{}O{}om}{%
\iftoggle{blx@footnote}
{\cs_set_protected_nopar:Npn \__sct_wrapper:nn ##1 ##2 {\mkbibparens{##2}}}
{\cs_set_protected_nopar:Npn \__sct_wrapper:nn ##1 ##2 {\sidenote[][##1]{##2}}}
{\IfNoValueTF{#3}
{\__sct_wrapper:nn{#1}{\sidecitehelper[#2]{#4}}}
{\__sct_wrapper:nn{#1}{\sidecitehelper[#2][#3]{#4}}}}
}
\ExplSyntaxOff}
{}

\RequirePackage{tikz}
\RequirePackage{thmtools}
\RequirePackage[framemethod=tikz]{mdframed}
\mdfsetup{skipabove=0.75em plus 0.25em minus 0.25em,skipbelow=0.1em minus 0.1em}

\colorlet{ThmColor}{Blue}
\colorlet{PropColor}{FireBrick}
\colorlet{ExColor}{ForestGreen}
\colorlet{DefColor}{Gainsboro}
\colorlet{CorColor}{DimGrey}
\colorlet{RemColor}{Moccasin} % Dandelion
\colorlet{ConjColor}{Moccasin}

\declaretheoremstyle[
headfont=\color{MediumBlue}\normalfont\scshape,
bodyfont=\normalfont\itshape,
postheadspace=0.5em,
mdframed={backgroundcolor=ThmColor!5,
linecolor=ThmColor!50,
linewidth=1pt,
leftline=false,
rightline=false,
innerrightmargin=2.25em,}]{thm}

\declaretheoremstyle[
headfont=\color{DarkRed!75}\normalfont\scshape,
bodyfont=\normalfont\itshape,
postheadspace=0.5em,
mdframed={backgroundcolor=PropColor!5,
linecolor=PropColor!40,
linewidth=1pt,
leftline=false,
rightline=false,
innerrightmargin=2.25em,}]{prop}

\declaretheoremstyle[
headfont=\normalfont\scshape,
bodyfont=\normalfont\itshape,
postheadspace=0.5em,
mdframed={backgroundcolor=CorColor!10,
linecolor=CorColor!50,
linewidth=1pt,
leftline=false,
rightline=false,
innerrightmargin=2.25em,}]{cor}

\declaretheoremstyle[
headfont=\color{Green}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=ExColor!5,
linecolor=ExColor!50,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,
innerrightmargin=2.25em,}]{ex}

\declaretheoremstyle[
headfont=\color{DimGray}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=DefColor!20,
linecolor=DefColor,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,
innerrightmargin=2.25em,}]{def}

\declaretheoremstyle[
headfont=\color{Goldenrod}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=RemColor!25,
linecolor=RemColor!80,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,
innerrightmargin=2.25em,}]{rem}

\declaretheoremstyle[
headfont=\color{Goldenrod}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=ConjColor!25,
linecolor=ConjColor!80,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,
innerrightmargin=2.25em,}]{conj}

\declaretheoremstyle[
headfont=\normalfont\scshape,
spaceabove=10pt,
spacebelow=10pt,
postheadspace=0.5em
]{plain}

\ifthenelse{\boolean{@gm@thmsecnum}}
{\declaretheorem[style=thm,numberwithin=section,name=theorem]{theorem}}
{\declaretheorem[style=thm,name=theorem]{theorem}}

\declaretheorem[style=prop,sibling=theorem,name=proposition]{proposition}
\declaretheorem[style=prop,sibling=theorem,name=lemma]{lemma}
\declaretheorem[style=cor,sibling=theorem,name=corollary]{corollary}
\declaretheorem[style=cor,sibling=theorem,name=claim]{claim}
\declaretheorem[style=rem,sibling=theorem,name=conjecture]{conjecture}
\declaretheorem[style=rem,sibling=theorem,name=remark]{remark}
\declaretheorem[style=rem,sibling=theorem,name=fact]{fact}
\declaretheorem[style=def,sibling=theorem,name=definition]{definition}
\declaretheorem[style=ex,sibling=theorem,name=example]{ex}
\declaretheorem[style=plain,sibling=theorem]{exercise}
\declaretheorem[style=plain]{problem}

\ifthenelse{\boolean{@gm@wide}}{\renewenvironment{fullwidth}{}{}}{}

\makeatletter
\gdef\@author{Gautam Manohar}

\ifthenelse{\boolean{@gm@titlepage}}
{\newcommand*{\@course}{Course}
  \newcommand*{\course}[1]{\gdef\@course{#1}}
  \renewcommand{\maketitle}{}
  \AtBeginDocument{%
    \newgeometry{letterpaper,left=1in,top=1in,bottom=0.9in}
    \begin{titlepage}
      \raggedleft
      \rule{1pt}{\textheight}
      \hspace{0.05\textwidth}
      \parbox[b]{0.75\textwidth}{
        {\Huge\bfseries \@title}\\[1.5\baselineskip]
        {\large\itshape \@course}\\[9\baselineskip]
        {\Large\scshape \@author}\\
        \vspace{0.42\textheight}
        {\noindent \@date}\\[\baselineskip]}
    \end{titlepage}
  \ifthenelse{\boolean{@gm@wide}}{\baselineskip}{
 \newgeometry{letterpaper,left=1in,top=1in,bottom=0.9in ,headsep=2\baselineskip,textwidth=26pc,marginparsep=2pc,marginparwidth=12pc,headheight=\baselineskip}}}}
{\renewcommand{\maketitle}{%
    \begin{fullwidth}
      \centering
      {\LARGE\so{\MakeUppercase{\@title}}}\par
      \vspace{0.1\baselineskip}
      \large\scshape\MakeLowercase{\@author}\par
      \vspace{0.1\baselineskip}
      \large\scshape\MakeLowercase{\@date}\par
      \vspace{\baselineskip}
    \end{fullwidth}
    \thispagestyle{empty}}}
\makeatother

\makeatletter
\renewcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}}
\makeatother
\setcounter{tocdepth}{3}
  \titlecontents{chapter}%
    [0em] % distance from left margin
    {\begin{fullwidth}\LARGE\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{0em}\contentslabel{2em}} % before w/label (label = ``2'')
    {\hspace*{0em}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{section}
    [0em] % distance from left margin
    {\large\scshape} % above (global formatting of entry)
    {\hspace*{1.5em}\contentslabel{1.5em}} % before w/label (label = ``2.6'')
    {\hspace*{1.5em}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\vspace{-0.25ex}] % after
  \titlecontents{subsection}% FIXME
    [0em] % distance from left margin
    {\rmfamily} % above (global formatting of entry)
    {\hspace*{3.5em}\contentslabel{2em}} % before w/label (label = ``2.6.1'')
    {\hspace*{3.5em}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\vspace{-0.25ex}] % after

\setcounter{secnumdepth}{3}
\titleformat{\section}%
  [hang]% shape
  {\normalfont\Large\itshape}% format applied to label+text
  {\normalfont\scshape\thesection}% label
  {1em}% horizontal separation between label and title body
  {}% before the title body
  []% after the title body

\titleformat{\subsection}%
  [hang]% shape
  {\normalfont\large\itshape}% format applied to label+text
  {\normalfont\scshape\thesubsection}% label
  {1em}% horizontal separation between label and title body
  {}% before the title body
  []% after the title body

\titleformat{\paragraph}%
  [runin]% shape
  {\normalfont\itshape}% format applied to label+text
  {\normalfont\scshape\theparagraph}% label
  {1em}% horizontal separation between label and title body
  {}% before the title body
  []% after the title body

\titlespacing*{\chapter}{0pt}{50pt}{40pt}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus.2ex}

\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}
\let\Subsectionmark\subsectionmark
\def\subsectionmark#1{\def\Subsectionname{#1}\Subsectionmark{#1}}

\newcommand{\Sectionname}{}
\newcommand{\Subsectionname}{}
\fancyhf{}
\fancyhead[LE]{\small\thepage\quad{\itshape\Sectionname}}
\ifthenelse{\boolean{@gm@nosubsec}}
{\fancyhead[RO]{\thepage}}
{\fancyhead[RO]{\small{\itshape\thesubsection\,\,\Subsectionname}\quad\thepage}}

\newcommand{\wc}[1]{\vspace{\baselineskip}\noindent{}#1 words}

\RequirePackage{import}
\RequirePackage{pdfpages}

% \pdfsuppresswarningpagegroup=1

\endinput
