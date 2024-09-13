\LoadClass{article}
\ProvidesClass{cv}[Custom cv class]

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Packages and setup

%Layout
\usepackage[letterpaper, margin=0.7cm]{geometry}
%	\geometry{
	%		left=.7cm,
	%		right=0.7cm,
	%		top=0.7cm,
	%		bottom=0.7cm
	%	}

%Nice icons
%\usepackage{academicons}
\usepackage{fontawesome5}
\usepackage{bm}

%Font
\usepackage[T1]{fontenc}
\usepackage[default]{lato}

%Prevent word division
\usepackage[none]{hyphenat}

%Quote styling
\usepackage{csquotes} %normal quotes
\MakeOuterQuote{"}

%Bibliography
\usepackage[backend=biber]{biblatex}

%Hyperlinks
\usepackage[hidelinks]{hyperref}
\hypersetup{
	pdftitle={Cooper Simpson's CV},
	pdfauthor={Cooper Simpson},
	pdfsubject={CV}
}

%Color setup
\usepackage{xcolor}
\definecolor{LightOrange}{HTML}{DB7816}
\definecolor{SlateGrey}{HTML}{2E2E2E}
\definecolor{LightGrey}{HTML}{666666}
\definecolor{IndianRed}{HTML}{CD5C5C}
\definecolor{Peru}{HTML}{CD853F}
\definecolor{RoyalPurple}{HTML}{6F3592}
\definecolor{Bronze}{HTML}{CD853F}
\definecolor{BlueGray}{HTML}{799ACC}

\colorlet{heading}{BlueGray}
\colorlet{accent}{BlueGray}
\colorlet{emphasis}{SlateGrey}
\colorlet{body}{LightGrey}

%Tikz graphics
\usepackage{tikz}
\usetikzlibrary{arrows}

%Color boxes
\usepackage[skins]{tcolorbox}

%Custom list styling
\usepackage{enumitem}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip}
\setlist[itemize]{label=\itemmarker}

\usepackage{graphicx}

\usepackage{etoolbox}

\usepackage{dashrule}

\usepackage{multirow,tabularx}

\usepackage{changepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Basic

\AtBeginDocument{%
	\pagestyle{empty}
	\color{body}
	\raggedright
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Icons and personal info

\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

\setlength{\parindent}{0pt}
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newcommand{\emailsym}{\faEnvelope}
\newcommand{\homepagesym}{\faGlobe}
\newcommand{\locationsym}{\faMapMarker*}
\newcommand{\githubsym}{\faGithub}
\newcommand{\gscholarsym}{\faScroll}

\newcommand{\printinfo}[2]{\makebox{\textcolor{accent}{\Large #1}\hspace{0.5em}#2\hspace{0.5em}}\vspace{0.5mm}}

\newcommand{\name}[1]{\def\name{#1}}
\newcommand{\tagline}[1]{\def\tagline{#1}}
\newcommand{\email}[1]{\printinfo{\emailsym}{#1}}
\newcommand{\homepage}[2]{\printinfo{\homepagesym}{\href{#2}{#1}}}
\newcommand{\github}[2]{\printinfo{\githubsym}{\href{#2}{#1}}}
\newcommand{\location}[1]{\printinfo{\locationsym}{#1}}
\newcommand{\gscholar}[2]{\printinfo{\gscholarsym}{\href{#2}{#1}}}

\newcommand{\personalinfo}[1]{\def\personalinfo{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Layout Sections

%Header
\newcommand{\header}{%
	%Name and Tag
	\begin{minipage}[c][][b]{0.4\textwidth}
		\Huge\bfseries\color{emphasis}\MakeUppercase{\name}\par
		\medskip
		\large\bfseries\color{accent}\tagline
	\end{minipage}
	%
	\hfill
	%External Links
	\begin{minipage}[c][][b]{0.5\textwidth}
		\medskip
		\center
		\normalsize\bfseries\personalinfo
	\end{minipage}
	%
	%Date
	\begin{minipage}[c][][b]{0.08\textwidth}
		\vspace{1.25cm}
		\raggedleft
		\tiny\bfseries\today
	\end{minipage}
	%
	\rule{\linewidth}{2pt}
}

\newcommand{\footer}[1]{%
	\vfill
	\rule{\linewidth}{2pt}
	\Large\color{accent}\(\bm{\ast}\)\normalsize\color{body}#1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Subsections

%Section
\newcommand{\block}[1]{%
	\bigskip\bigskip%
	{\vspace*{\dimexpr1pt-\baselineskip}}%
	{\color{heading}\LARGE\bfseries\MakeUppercase{#1}}\\[-1ex]%
	{\color{body}\rule{\linewidth}{2pt}\par}\medskip
}

%Work experience
\newcommand{\experience}[4]{%
	\makebox[\linewidth][l]{%
		{\bfseries\Large\color{emphasis}#1\large}
		\hfill
		{\small\makebox{\textbf{\normalsize\color{accent}#2}}}%
		\hfill
		{\small\makebox{\faCalendar*\hspace{0.5em}#3}}%
		\hfill
		{\small\makebox{\faMapMarker*\hspace{0.5em}#4}}
	}\par
	\medskip\color{body}\small
}

%Education
\newcommand{\education}[4]{%
	\makebox[\linewidth][l]{%
		{\bfseries\Large\color{emphasis}#1\large}
		\hfill
		{\small\makebox{\textbf{\normalsize\color{accent}#2}}}%
		\hfill
		{\small\makebox{\faCalendar*\hspace{0.5em}#3}}%
		\hfill
		{\small\makebox{\faGraduationCap\hspace{0.5em}#4}}
	}\par
	\medskip\color{body}\small
}

%Education sub-specifier
\newcommand{\subeducation}[2]{%
	{\normalsize\color{emphasis}#1:}
	{\small\color{body}#2\par}
}

%Project
\newcommand{\project}[2]{%
	{\bfseries\Large\color{emphasis}#1}
	\hspace{1em}
	{\normalsize\textbf{\color{accent}#2}\large\par}
	\smallskip\normalsize
}

%Achievement
\newcommand{\achievement}[3]{%
	\begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
		\multirow{2}{*}{\Large\color{accent}#1} & \large\bfseries\textcolor{emphasis}{#2}\\
		& \textcolor{body}{#3}
	\end{tabularx}%
	\smallskip
}

%Software
\newcommand{\software}[5]{%
	\begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
		\multirow{2}{*}{\Large\color{accent}#1} & {\bfseries\large\textcolor{emphasis}{\href{#3}{#2}}\hspace{0.1em} \normalsize\textcolor{accent}{#4}}\\
		& \textcolor{body}{#5}
	\end{tabularx}%
	\smallskip
}

%Skill
\newcommand{\skill}[2]{%
	{\textbf{#1}}\hfill
	\foreach \x in {1,...,5}{%
		\space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\ratingmarker}}\par%
}

\newcommand{\option}[1]{%
	\tcbox[size=small, on line, colback=white, arc=0.2cm, colframe=body!30, valign=center, box align=center, top=0pt, bottom=0pt, left=0pt, right=0pt]{#1}%
}

\newcommand{\lang}[2]{%
	{\normalsize\color{emphasis}#1:}
	{\small\color{body}#2\par}
}

%Teaching
\newcommand{\teaching}[3]{%
	\makebox[\linewidth][l]{%
		{\bfseries\Large\color{emphasis}#1}%
		\hfill
		{\bfseries\small\color{accent}#2}%
		\hfill
		{\small\faMapMarker*\hspace{0.5em}#3}%
	}\par
	\medskip\color{body}\small
}

\newcommand{\class}[2]{%
	{\small\color{body}#1}
	\hfill
	{\small\faCalendar*\hspace{0.5em}#2}%
}

%Misc
\newcommand{\reference}[3]{%
	\makebox[\linewidth][l]{%
		{\bfseries\large\color{emphasis}#1}%
		\hfill
		{\bfseries\small\color{accent}#2}%
		\hfill
		{\small\faEnvelope\hspace{0.5em}#3}%
	}%
}