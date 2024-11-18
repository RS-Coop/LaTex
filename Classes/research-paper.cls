\LoadClass{article}
\ProvidesClass{research-paper}[Custom research paper class]

\usepackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Packages and setup

%Layout
\usepackage{indentfirst} %indent first line after section
\usepackage[letterpaper, margin=1in]{geometry} %page layout
%	\geometry{%layout options}

\usepackage{titling} %retain title after maketitle
	
\usepackage{fancyhdr} %page header
	\pagestyle{fancy}
	\fancyhf{}
	\rhead{\@authors}
	\lhead{\@shorttitle}
	\cfoot{\thepage}
	\rfoot{\@date}
	
\usepackage{authblk} %multiple authors and affiliations
\usepackage[page, title, titletoc]{appendix} %appendices

%Graphics
\usepackage{graphicx} %for including images and other graphics
\usepackage{subcaption} %side by side figures
\usepackage{wrapfig} %text wrapped figures
\usepackage{float} %figures
	\floatstyle{boxed}
	
\usepackage{tabularx} %nice tables
\usepackage{booktabs} %nice table styling
	\renewcommand{\arraystretch}{1.5} %table cell spacing
\usepackage{multirow,multicol}

\usepackage{tikz} %custom graphics
\usepackage[breakable, theorems]{tcolorbox} %colored boxes

\usepackage{adjustbox}

%References
\usepackage[hidelinks, linktoc=all]{hyperref} %basic cross referencing
\usepackage[capitalise, nameinlink]{cleveref} %better cross referencing
\usepackage{etoolbox} %appendix in cref
    \AtBeginEnvironment{appendices}{\crefalias{section}{appendix}}

%Bibliography
\usepackage[backend=biber,
			maxcitenames=2,
			style=numeric,
			citestyle=numeric]{biblatex}
%	\addbibresource{ref.bib}

%Styling
\usepackage{csquotes} %normal quotes
	\MakeOuterQuote{"}
% \usepackage{setspace} %line spacing
% 	\onehalfspacing %1.5 line spacing
\usepackage{pifont} %cmark and xmark
	\newcommand{\cmark}{\ding{51}}%
	\newcommand{\xmark}{\ding{55}}%

%Math
\usepackage{amsmath, amssymb, amsthm, amsfonts} %math symbols and environments
\usepackage{bm} %better bold math via \bm command
\usepackage{algorithm2e}
	\RestyleAlgo{ruled}
	\DontPrintSemicolon
	\SetKwFor{While}{while}{}{end while}
\usepackage{nicefrac} %compact fractions
\usepackage{siunitx} %SI units
	\sisetup{group-separator={,},
			separate-uncertainty=true,
			round-pad=false,
			round-mode=none}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Misc commands and environments

%Titling and stuff
\newcommand\@shorttitle{\thetitle}
\newcommand\shorttitle[1]{\renewcommand\@shorttitle{#1}}

%\newcommand{\toc}{~\newpage\tableofcontents~\newpage} %own page table of contents
\newcommand{\toc}{\tableofcontents} %own page table of contents

%NOTE: obtained from https://tex.stackexchange.com/questions/371787/how-to-get-author-name-in-header-et-al/371831#371831
\def\@firstof@authlist#1\thanks#2\@nil{#1} %NOTE: This breaks if there isn't a foonote
\newcommand*{\@authors}{%
	\begingroup
		\let\footnote\@gobble% ignore \footnote
		\let\textsuperscript\@gobble% ignore protected \textsuperscript
		\expandafter\let\csname textsuperscript \endcsname\@gobble
		\let\Authfont\relax% do not use a special font
		\def\Authand{ and }% separate list of authors
		\ifnum\value{authors}<3 % one ore two authors
			\AB@authlist% show them all
			\else% 3 or more authors
			% show only the first one followed by "et.~al"
			\expandafter\@firstof@authlist\AB@authlist\@nil\ et~al.%
		\fi
	\endgroup
}

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
		{\LARGE\bf \@title\par}
		\@bottomtitlebar
		\def\And{%
		\end{tabular}\hfil\linebreak[0]\hfil%
		\begin{tabular}[t]{c}\bf\rule{\z@}{24\p@}\ignorespaces%
		}
		\def\AND{
		\end{tabular}\hfil\linebreak[4]\hfil
		\begin{tabular}[t]{c}\bf\rule{\z@}{24\p@}\ignorespaces
		}
		\begin{tabular}[t]{c}\bf\rule{\z@}{24\p@}\@author\end{tabular}
		\@date
		\vskip 0.3in \@minus 0.1in
	}
}

%Abstract styling
\renewenvironment{abstract}
{
	\vskip 0.1in
	\centerline
	{\large\bf Abstract}
	\vspace{0.5ex}
	\begin{quote}
	}
	{
		\par
	\end{quote}
	\vskip 1ex
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
\crefname{example}{ex.}{exs.}
\Crefname{Assumption}{Example}{Examples}

\newtcbtheorem[]{example}{Example}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=example}{ex}
\crefname{definition}{def.}{defs.}
\Crefname{Definition}{Definition}{Definitions}

\newtcbtheorem[]{assumption}{Assumption}{fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=assumption}{asp}
\crefname{assumption}{assumption}{assumptions}
\Crefname{Assumption}{Assumption}{Assumptions}

\crefname{algocf}{alg.}{algs.}
\Crefname{algocf}{Algorithm}{Algorithms}

\renewcommand{\qedsymbol}{$\blacktriangle$}
\renewcommand{\proofname}{\nopunct}
\tcolorboxenvironment{proof}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,title=Proof}

%Foonotes
\crefformat{footnote}{#2\footnotemark[#1]#3} %https://tex.stackexchange.com/questions/10102/multiple-references-to-the-same-footnote-with-hyperref-support-is-there-a-bett/10116#10116

