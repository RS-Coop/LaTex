\LoadClass[notheorems]{beamer}
\ProvidesClass{Presentation}[Custom presentation class]

\usepackage{document-common}
\usepackage{math-common}

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
		\begin{beamercolorbox}[wd=.15\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
			\usebeamerfont{author in head/foot}\insertauthor
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.4\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
			\usebeamerfont{title in head/foot}\@shorttitle
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.35\paperwidth,ht=2.25ex,dp=1ex,center]{institute in head/foot}%
			\usebeamerfont{institute in head/foot}\insertinstitute
		\end{beamercolorbox}%
		\begin{beamercolorbox}[wd=.1\paperwidth,ht=2.25ex,dp=1ex,center]{date in head/foot}%
			\usebeamerfont{date in head/foot}\insertframenumber{} / \inserttotalframenumber
	\end{beamercolorbox}}%
	\vskip0pt%
}

\setbeamertemplate{navigation symbols}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Math environments
\newtcbtheorem[]{theorem}{Theorem}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=theorem}{thm}
\newtcbtheorem[]{lemma}{Lemma}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=lemma}{lem}
\newtcbtheorem[]{corollary}{Corollary}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=corollary}{cor}

\newtcbtheorem[]{example}{Example}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=example}{ex}

\newtcbtheorem[]{definition}{Definition}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=definition}{def}

\newtcbtheorem[]{assumption}{Assumption}{breakable,fonttitle=\bfseries,colframe=lightgray,coltitle=black,label type=assumption}{asp}

