\LoadClass{article}
\ProvidesClass{research-paper}[Custom research paper class]

\usepackage{document-common}
\usepackage{math-common}
\usepackage{paper-common}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Page style
\usepackage[letterpaper, margin=1in]{geometry} %page layout
%	\geometry{%layout options}

\pagestyle{fancy}
\fancyhf{}
\lhead{\@shorttitle}
\rhead{\@authors}
\cfoot{\thepage}

%Titling

%Authors list
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

%Misc
\newcommand{\toc}{\tableofcontents} %own page table of contents
