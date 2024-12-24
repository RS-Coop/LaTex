\LoadClass{article}
\ProvidesClass{problem-set}[Custom problem set class]

\usepackage{document-common}
\usepackage{math-common}
\usepackage{paper-common}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Page style
\usepackage[letterpaper, margin=1in]{geometry} %page layout
%	\geometry{%layout options}

\pagestyle{fancy}
\fancyhf{}
\lhead{\@classprefix}
\chead{\@subtitle}
\rhead{\@author}
\cfoot{\thepage}

%Titling
\renewcommand{\@title}{\@classprefix: \@classname \vskip 0.1in \Large \@subtitle}

\newcommand\@classprefix{}
\newcommand\classprefix[1]{\renewcommand\@classprefix{#1}}

\newcommand\@classname{}
\newcommand\classname[1]{\renewcommand\@classname{#1}}

\newcommand\@subtitle{}
\newcommand\subtitle[1]{\renewcommand\@subtitle{#1}}

%Misc
\usepackage{setspace} %line spacing
	\onehalfspacing %1.5 line spacing
	
%Problem environment
\newcounter{problemcounter}
\setcounter{problemcounter}{1}
\newcommand{\problem}{\section*{Problem \theproblemcounter}\label{prob:\theproblemcounter}\stepcounter{problemcounter}}
\newcommand{\question}{\paragraph{Question:}}
\newcommand{\solution}{\paragraph{Solution:}~\\}

