\LoadClass{article}
\ProvidesClass{problem-set}[Custom problem set class]

\usepackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Packages and setup

%Layout
\usepackage{indentfirst} %indent first line after section
\usepackage[letterpaper, margin=1in]{geometry} %page layout

\usepackage{titling} %retain title after maketitle
	
\usepackage{fancyhdr} %page header
	\pagestyle{fancy}
	\fancyhf{}
	\rhead{\@author}
	\lhead{\@classprefix}
	\chead{Problem Set \@problemset}
	\cfoot{\thepage}
	
\usepackage{titlesec}

%Graphics
\usepackage{graphicx} %for including images and other graphics
\usepackage{subcaption} %side by side figures
\usepackage{float} %figures
	\floatstyle{boxed}
	
\usepackage{tabularx} %nice tables
\usepackage{booktabs} %nice table styling
%	\renewcommand{\arraystretch}{1.5} %table cell spacing, but makes arrays awkwardly spaced

\usepackage{tikz} %custom graphics
	\usetikzlibrary{arrows.meta, positioning, decorations.pathreplacing, calligraphy}
\usepackage[breakable, theorems]{tcolorbox} %colored boxes

\usepackage{pdfpages}

%References
\usepackage[hidelinks, linktoc=all]{hyperref} %basic cross referencing
\usepackage[capitalise]{cleveref} %better cross referencing

%Bibliography
\usepackage[backend=biber,
			maxcitenames=2,
			style=numeric,
			citestyle=numeric]{biblatex}
%	\addbibresource{ref.bib}

%Styling
\usepackage{csquotes} %normal quotes
	\MakeOuterQuote{"}
\usepackage{setspace} %line spacing
	\onehalfspacing %1.5 line spacing

%Math
\usepackage{amsmath, amssymb, amsthm, amsfonts} %math symbols and environments
\usepackage{algorithm2e}
	\RestyleAlgo{ruled}
	\DontPrintSemicolon
\usepackage{nicefrac} %compact fractions
\usepackage{bm} %better bold math via \bm command
\usepackage{mathdots}
\usepackage{siunitx}
	\sisetup{group-separator={,},
		separate-uncertainty=true,
		round-pad=false,
		round-mode=none}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Misc commands and environments

%Titling and stuff
\newcommand\@classprefix{}
\newcommand\classprefix[1]{\renewcommand\@classprefix{#1}}
\newcommand\@classname{}
\newcommand\classname[1]{\renewcommand\@classname{#1}}

\newcommand\@problemset{}
\newcommand\problemset[1]{\renewcommand\@problemset{#1}}

%NOTE: The following were taken from the NeurIPS styling

%Default fonts
\renewcommand{\rmdefault}{ptm}
\renewcommand{\sfdefault}{phv}

%Title styling
\newcommand{\@toptitlebar}{
	\hrule height 4\p@
	\vskip 0.25in
	\vskip -\parskip
}
\newcommand{\@bottomtitlebar}{
	\vskip 0.2in
	\vskip -\parskip
	\hrule height 2\p@
	\vskip 0.1in
}

\renewcommand{\@maketitle}{
	\vbox{
		\hsize\textwidth
		\linewidth\hsize
		\vskip 0.1in
		\@toptitlebar
		\centering
		{\LARGE\bf \@classprefix: \@classname \vskip 0.1in \Large Problem Set \@problemset}
		\@bottomtitlebar
		\def\And{%
		\end{tabular}\hfil\linebreak[0]\hfil%
		\begin{tabular}[t]{c}\bf\rule{\z@}{24\p@}\ignorespaces%
		}
		\def\AND{
		\end{tabular}\hfil\linebreak[4]\hfil
		\begin{tabular}[t]{c}\bf\rule{\z@}{24\p@}\ignorespaces
		}
		\begin{tabular}[t]{c}\bf\rule{\z@}{24\p@}\@author\end{tabular}\\
		\@date
		\vskip 0.3in \@minus 0.1in
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Custom citation commands

%Cite authoryear style with hyperlinks inside square brackets
\DeclareCiteCommand{\parencite}
	{\boolfalse{citetracker}%
		\boolfalse{pagetracker}%
		\usebibmacro{prenote}}
	{\ifciteindex
		{\indexnames{labelname}}
		{}%
		[\printtext[bibhyperref]{\printnames{labelname}, \printfield{year}}]}
	{\multicitedelim}
	{\usebibmacro{postnote}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Content commands and environments

\newcommand{\edit}[1]{{\color{red} #1}}

%Symbols and modifiers
\newcommand{\reals}{\mathbb{R}}
\newcommand{\naturals}{\mathbb{N}}
\newcommand{\integers}{\mathbb{Z}}
\newcommand{\complex}{\mathbb{C}}
\newcommand{\rationals}{\mathbb{Q}}
\newcommand{\bigo}{\mathcal{O}}

\newcommand{\inner}[2]{\langle #1,#2 \rangle} %inner product
\newcommand{\prob}{\mathbb{P}}
\newcommand{\E}{\mathbb{E}} %expectation
\newcommand{\V}{\mathbb{V}}
\newcommand{\argmax}{\text{argmax}}
\newcommand{\id}{\mathbf{I}} %identity
\newcommand{\set}[1]{\mathcal{\uppercase{#1}}}

\newcommand{\thickbar}[1]{\accentset{\rule{.4em}{.8pt}}{#1}}
\newcommand{\st}{\ \text{s.t.}\ }

\DeclareMathOperator{\e}{e}
\DeclareMathOperator{\OO}{O}
\DeclareMathOperator{\oo}{o}
\DeclareMathOperator{\erfc}{erfc}
\DeclareMathOperator{\real}{Re}
\DeclareMathOperator{\imag}{Im}

\newcommand{\D}{\mathrm{d}} %integration
\newcommand{\I}{\mathrm{i}} %imaginary number

%Math environments
\newtcbtheorem[]{theorem}{Theorem}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=theorem}{thm}
\newtcbtheorem[]{lemma}{Lemma}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=lemma}{lem}
\newtcbtheorem[]{corollary}{Corollary}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=corollary}{cor}
\newtcbtheorem[]{definition}{Definition}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=definition}{def}
\newtcbtheorem[]{assumption}{Assumption}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=assumption}{asp}

\crefformat{assumption}{assumption~#2#1#3}
\crefformat{definition}{definition~#2#1#3}

\renewcommand{\qedsymbol}{$\blacktriangle$}
\renewcommand{\proofname}{\nopunct}
\tcolorboxenvironment{proof}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,title=Proof}

\newenvironment{work}{\begin{tcolorbox}[breakable,colframe=lightgray]}{\end{tcolorbox}}

%Problem environment
\newcounter{problemcounter}
\setcounter{problemcounter}{1}
\newcommand{\problem}{\section*{Problem \theproblemcounter}\label{prob:\theproblemcounter}\stepcounter{problemcounter}}
\newcommand{\question}{\paragraph{Question:}}
\newcommand{\solution}{\paragraph{Solution:}~\\}