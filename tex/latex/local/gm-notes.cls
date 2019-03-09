\ProvidesClass{gm-notes}
\LoadClass[10pt,twoside]{report}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsxtra}
\RequirePackage{amsfonts}

\RequirePackage[svgnames]{xcolor}
\RequirePackage{hyperref}
\hypersetup{colorlinks,
  bookmarksdepth=subsection,
  citecolor=DarkGreen,
  linkcolor=Maroon,
  urlcolor=DarkBlue}
\RequirePackage{calc}
\RequirePackage{tikz}
\RequirePackage[strict]{changepage}
\RequirePackage{ragged2e}

\RequirePackage{cleveref}
\crefname{section}{\S}{\S\S}
\Crefname{section}{\S}{\S\S}

\DeclareOption{notoc}{\renewcommand{\tableofcontents}{}}
\newif\ifthmsecnum\thmsecnumtrue
\DeclareOption{nosec}{\thmsecnumfalse}
\newif\ifnosubsec
\DeclareOption{nosubsec}{\nosubsectrue}
\ProcessOptions\relax

\newlength{\@overhang}
\newlength{\@fullwidth}
\newcommand{\@linespread}{1.15}

\RequirePackage[letterpaper,left=1in,top=1in,bottom=1in ,headsep=2\baselineskip,textwidth=26pc,marginparsep=2pc,marginparwidth=12pc,headheight=\baselineskip]{geometry}

\newcommand{\CalculateLength}{%
  \setlength{\@overhang}{\marginparwidth}
  \addtolength{\@overhang}{\marginparsep}

  \setlength{\@fullwidth}{\textwidth}
  \addtolength{\@fullwidth}{\@overhang}}
\AtBeginDocument{\CalculateLength}

\newenvironment{fullwidth}{\begin{adjustwidth*}{}{-\@overhang}}{\end{adjustwidth*}}

\renewcommand{\maketitle}{%
  \begin{fullwidth}
    \centering
    \LARGE\textls[150]{\MakeUppercase{\@title}}\par
    \vspace{0.1\baselineskip}
    \large\scshape\MakeLowercase{\@author}\par
    \vspace{0.1\baselineskip}
    \large\scshape\MakeLowercase{\@date}\par
    \vspace{\baselineskip}
  \end{fullwidth}
  \thispagestyle{empty}}

\RequirePackage[footnote]{snotez}
\setsidenotes{text-mark-format=\textsuperscript{\normalfont#1},
              text-format+=\singlespacing,
              note-mark-sep=\,}

\RequirePackage{marginnote}
\renewcommand*{\marginnotevadjust}{-0.5\baselineskip}
\renewcommand*{\marginfont}{\linespread{1}\normalfont\footnotesize\justify}

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\let\Sectionmark\sectionmark
\def\sectionmark#1{\def\Sectionname{#1}\Sectionmark{#1}}
\let\Subsectionmark\subsectionmark
\def\subsectionmark#1{\def\Subsectionname{#1}\Subsectionmark{#1}}

\newcommand{\Sectionname}{}
\newcommand{\Subsectionname}{}
\fancyhf{}
\fancyhead[LE]{\small\thepage\quad{\itshape\Sectionname}}
\ifnosubsec
\fancyhead[RO]{\thepage}
\else
\fancyhead[RO]{\small{\itshape\thesubsection\,\,\Subsectionname}\quad\thepage}
\fi

\renewcommand{\headrulewidth}{0pt}
\setlength{\headwidth}{\textwidth}
\addtolength{\headwidth}{\marginparsep}
\addtolength{\headwidth}{\marginparwidth}

\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}

\RequirePackage{titlesec}
\titleformat{\chapter}[hang]{\Huge\bfseries}{\marginnote{\centering\Huge\thechapter}[-0.9em]}{0pt}{\Huge\bfseries}

\RequirePackage{titletoc}
\renewcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
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

\RequirePackage[osf,sc]{mathpazo}

\RequirePackage[stretch=10,shrink=10,tracking=true]{microtype}

\SetProtrusion{encoding={*},family={*},series={*},size={6,7}}
              {1={ ,750},2={ ,500},3={ ,500},4={ ,500},5={ ,500},
               6={ ,500},7={ ,600},8={ ,500},9={ ,500},0={ ,500}}

\SetTracking{encoding={*}, shape=sc}{0}

\RequirePackage{setspace}
\setstretch{\@linespread}

\setlength{\parskip}{0pt}

\RequirePackage{enumitem}
\setlist[enumerate]{itemsep=1pt,topsep=3pt,leftmargin=2em}

\RequirePackage{thmtools}
\RequirePackage[framemethod=tikz]{mdframed}
\mdfsetup{skipabove=0.75em plus 0.25em minus 0.25em,skipbelow=0.1em minus 0.1em}

\colorlet{ThmColor}{Blue}
\colorlet{PropColor}{FireBrick}
\colorlet{ExColor}{ForestGreen}
\colorlet{DefColor}{Gainsboro}
\colorlet{CorColor}{DimGrey}
\colorlet{RemColor}{Moccasin} % Dandelion

\declaretheoremstyle[
headfont=\color{MediumBlue}\normalfont\scshape,
bodyfont=\normalfont\itshape,
postheadspace=0.5em,
mdframed={backgroundcolor=ThmColor!5,
linecolor=ThmColor!50,
linewidth=1pt,
leftline=false,
rightline=false}]{thm}

\declaretheoremstyle[
headfont=\color{DarkRed!75}\normalfont\scshape,
bodyfont=\normalfont\itshape,
postheadspace=0.5em,
mdframed={backgroundcolor=PropColor!5,
linecolor=PropColor!40,
linewidth=1pt,
leftline=false,
rightline=false}]{prop}

\declaretheoremstyle[
headfont=\normalfont\scshape,
bodyfont=\normalfont\itshape,
postheadspace=0.5em,
mdframed={backgroundcolor=CorColor!10,
linecolor=CorColor!50,
linewidth=1pt,
leftline=false,
rightline=false}]{cor}

\declaretheoremstyle[
headfont=\color{Green}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=ExColor!5,
linecolor=ExColor!50,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,}]{ex}

\declaretheoremstyle[
headfont=\color{DimGray}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=DefColor!20,
linecolor=DefColor,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,}]{def}

\declaretheoremstyle[
headfont=\color{Goldenrod}\normalfont\scshape,
postheadspace=0.5em,
mdframed={backgroundcolor=RemColor!25,
linecolor=RemColor!80,
linewidth=5pt,
topline=false,
bottomline=false,
rightline=false,}]{rem}

\declaretheoremstyle[
headfont=\normalfont\scshape,
spaceabove=10pt,
spacebelow=10pt,
postheadspace=0.5em
]{plain}

\ifthmsecnum
\declaretheorem[style=thm,numberwithin=section,name=theorem]{theorem}
\else
\declaretheorem[style=thm,name=theorem]{theorem}
\fi

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

\endinput
