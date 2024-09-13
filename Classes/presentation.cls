\LoadClass{beamer}
\ProvidesClass{Presentation}[Custom presentation class]

\usepackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Packages and setup

%Layout
\usepackage{indentfirst} %indent first line after section

%Graphics
\usepackage{graphicx} %for including images and other graphics
\usepackage{subcaption} %side by side figures
\usepackage{float} %figures
	\floatstyle{boxed}
	
\usepackage{tabularx} %nice tables
\usepackage{booktabs} %nice table styling
	\renewcommand{\arraystretch}{1.5} %table cell spacing

\usepackage{tikz} %custom graphics
	\usetikzlibrary{arrows.meta, positioning, decorations.pathreplacing, calligraphy}
\usepackage[breakable, theorems]{tcolorbox} %colored boxes

%References
%\usepackage[capitalise]{cleveref} %better cross referencing

%Bibliography
\usepackage[backend=biber,
			maxcitenames=2,
			style=numeric,
			citestyle=numeric]{biblatex}
%	\addbibresource{ref.bib}

%Styling
\usepackage{csquotes} %normal quotes
	\MakeOuterQuote{"}

%Math
\usepackage{amsmath, amssymb, amsthm, amsfonts} %math symbols and environments
\usepackage{algorithm2e}
	\RestyleAlgo{ruled}
	\DontPrintSemicolon
\usepackage{nicefrac} %compact fractions
\usepackage{bm} %better bold math via \bm command

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Misc commands and environments

%Titling and stuff
\newcommand\@shorttitle{\thetitle}
\newcommand\shorttitle[1]{\renewcommand\@shorttitle{#1}}

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
%Beamer style setup

\definecolor{mainColor}{rgb}{0.1, 0.52, 0.24}
\usetheme[named=mainColor]{Madrid}
\usecolortheme{beaver}

\setbeamersize{text margin left=20pt,text margin right=30pt}

\setbeamerfont{date}{size=\small}
\setbeamerfont{institute}{size=\normalsize}
\setbeamerfont{author}{size=\large}
\setbeamerfont{title}{size=\huge}

\AtBeginSection[]
{
	\begin{frame}
		\frametitle{Table of Contents}
		\tableofcontents[currentsection]
	\end{frame}
}

\setbeamertemplate{footline}
{
	\leavevmode%
	\hbox{%
		\begin{beamercolorbox}[wd=.3\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
			\usebeamerfont{author in head/foot}\insertauthor
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.3\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
			\usebeamerfont{title in head/foot}\@shorttitle
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.3\paperwidth,ht=2.25ex,dp=1ex,center]{institute in head/foot}%
			\usebeamerfont{institute in head/foot}\insertinstitute
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,center]{date in head/foot}%
			\usebeamerfont{date in head/foot}\insertframenumber{} / \inserttotalframenumber
	\end{beamercolorbox}}%
	\vskip0pt%
}

\setbeamertemplate{navigation symbols}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Content commands and environments

%Symbols and modifiers
\newcommand{\reals}{\mathbb{R}}
\newcommand{\naturals}{\mathbb{N}}
\newcommand{\integers}{\mathbb{Z}}
\newcommand{\complex}{\mathbb{C}}
\newcommand{\bigo}{\mathcal{O}}

\newcommand{\inner}[2]{\langle #1,#2 \rangle} %inner product
\newcommand{\Exp}{\mathbb{E}} %expectation
\newcommand{\argmax}{\text{argmax}}
\newcommand{\id}{\mathbf{I}} %identity
\newcommand{\set}[1]{\mathcal{\uppercase{#1}}}

\newcommand{\thickbar}[1]{\accentset{\rule{.4em}{.8pt}}{#1}}
\newcommand{\st}{\ \text{s.t.}\ }

