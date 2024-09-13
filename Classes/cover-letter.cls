\LoadClass{article}
\ProvidesClass{cover-letter}[Custom cover letter class]

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
\usepackage{fontawesome5}

%Font
\usepackage[T1]{fontenc}
\usepackage[default]{lato}

%Prevent word division
\usepackage[none]{hyphenat}

%Hyperlinks
\usepackage[hidelinks]{hyperref}

%Color setup
\usepackage{xcolor}
\definecolor{LightOrange}{HTML}{DB7816}
\definecolor{SlateGrey}{HTML}{2E2E2E}
\definecolor{LightGrey}{HTML}{666666}
\definecolor{IndianRed}{HTML}{CD5C5C}

\colorlet{background}{LightGrey}
\colorlet{accent}{IndianRed}
\colorlet{emphasis}{SlateGrey}
\colorlet{body}{LightGrey}

\usepackage{tcolorbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Basic

\AtBeginDocument{
	\pagestyle{empty}
	\color{body}
	\raggedright
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Symbols and Headers
\newcommand{\emailsym}{\faEnvelope}
\newcommand{\homepagesym}{\faGlobe}
\newcommand{\locationsym}{\faMapMarker*}
\newcommand{\githubsym}{\faGithub}
\newcommand{\gscholarsym}{\faScroll}

\newcommand{\printinfo}[2]{\makebox{\textcolor{accent}{\Large #1}\hspace{0.5em}#2\hspace{0.5em}}\vspace{0.5mm}}

%Personal information
\newcommand{\personalinfo}[1]{\def\personalinfo{#1}}

\newcommand{\name}[1]{\def\name{#1}}
\newcommand{\tagline}[1]{\def\tagline{#1}}
\newcommand{\email}[1]{\printinfo{\emailsym}{#1}}
\newcommand{\homepage}[2]{\printinfo{\homepagesym}{\href{#2}{#1}}}
\newcommand{\github}[2]{\printinfo{\githubsym}{\href{#2}{#1}}}
\newcommand{\location}[1]{\printinfo{\locationsym}{#1}}
\newcommand{\gscholar}[2]{\printinfo{\gscholarsym}{\href{#2}{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Header
\newcommand{\clheader}{%
	%Name and Tag
	\begin{minipage}[t]{0.45\textwidth}
		\Huge\bfseries\MakeUppercase{\name}\par
		\medskip
		\large\bfseries\color{accent}\tagline\par
	\end{minipage}
	%External Links
	\begin{minipage}[t]{0.55\textwidth}
		\raggedright
		\normalsize\bfseries\personalinfo\par
	\end{minipage}
	%
	\rule{\linewidth}{2pt}
}

%Main, sidebar and body
\newenvironment{clmain}[1]{%
	\begin{tcolorbox}[height=\dimexpr \textheight-2.1cm, colback=background, arc=0cm, box align=top, boxsep=0cm, spread sidewards, valign=center]
		%Body
		\centering
		\begin{tcolorbox}[inherit height=1, add to height=-1.4cm, width=\dimexpr \textwidth-1.4cm, colback=white, arc=0.5cm, space to upper, segmentation empty, boxsep=0.7cm]
			%intro
			\textbf{\Large\color{accent}\company,}\\~\\
			%body
			\raggedright
			\fontsize{#1pt}{1.3\dimexpr#1}\selectfont
	}
	{
		\tcblower
		\clsignature
		\end{tcolorbox}
	\end{tcolorbox}
}

\newcommand{\clsignature}{%
	\begin{minipage}[b]{0.4\linewidth}
		\textbf{\Large\color{emphasis}Cheers,}
		
		\textbf{\Large\color{accent}\name}
	\end{minipage}
	\hfill
	\begin{minipage}[b]{0.4\linewidth}
		\includegraphics[scale=0.2]{signature.png}
	\end{minipage}
}