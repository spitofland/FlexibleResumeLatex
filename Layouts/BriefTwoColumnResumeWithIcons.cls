\ProvidesClass{Layouts/BriefTwoColumnResumeWithIcons}[2018/05/20 One page, two column resume class with icons]
\LoadClass{Layouts/BaseCV}
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{marvosym}
\usepackage[compact]{titlesec}

\newlength{\leftwidth}
\setlength{\leftwidth}{0.25\textwidth}

\newlength{\rightwidth}
\setlength{\rightwidth}{\textwidth}
\addtolength{\rightwidth}{-\leftwidth}
\addtolength{\rightwidth}{-\columnsep}
\addtolength{\rightwidth}{-5mm}

\newlength{\vbarheight}
\setlength{\vbarheight}{\textheight}
\addtolength{\vbarheight}{-2pt}

\newlength{\vbaroffset}
\setlength{\vbaroffset}{2em}
\addtolength{\vbaroffset}{-\textheight}

\setlength{\DateWidth}{0.14\linewidth}

\setlength{\DetailsWidth}{\linewidth}
\addtolength{\DetailsWidth}{-\DateWidth}
\addtolength{\DetailsWidth}{-\tabcolsep}

\setlist{nolistsep}
\setlist[itemize,1]{leftmargin=0.7\labelwidth}

% These commands can be overwritten with a different layout
% Setup the document
\renewcommand{\generateheader}{
	\begin{minipage}[t]{\leftwidth}
	\ifthenelse{\equal{\myname}{}}{}{
		\begin{flushleft}{\Huge\myname}\end{flushleft}
		\hrule height 2pt
		\vspace{\baselineskip}
	}
	\ifthenelse{\equal{\myjobtitle}{}}{}{{\Large\myjobtitle}}
	\begin{itemize}[itemsep=1em, topsep=1em, leftmargin=0.9\labelwidth]
	\ifthenelse{\equal{\mynumberphone}{}}{}{\item[\Large{\Telefon}]{\mynumberphone}}
	\ifthenelse{\equal{\mymail}{}}{}{\item[\large{@}\hspace{2pt}]{\mymail}}
	\ifthenelse{\equal{\myaddress}{}}{}{\item[\Large{\Letter}]{\myaddress}}
	\ifthenelse{\equal{\mysite}{}}{}{\item[\Large{\Mundus}]{\mysite}}
	\end{itemize}
	\ifthenelse{\equal{\mysummary}{}}{}{\SectionTitle{Summary}\mysummary}
	\SectionTitle{Skills}\myskills
	\end{minipage}\hfill\rule[\vbaroffset]{1pt}{\vbarheight}\hfill
	\begin{minipage}[t]{\rightwidth}
}

\renewcommand{\generatefooter}{
	\end{minipage}
}

\renewcommand{\myskills}[1]{\renewcommand{\myskills}{
	\begin{itemize}[itemsep=1ex, topsep=1ex]
	\foreach \s in {#1}{\item \s}
	\end{itemize}
}}

% Contact name and number not displayed
\renewcommand{\RelatedWorkItem}[8]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#8}}
\renewcommand{\OtherWorkItem}[8]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#8}}
\renewcommand{\VolunteerItem}[6]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#6}}

% Don't add other work experience
\renewenvironment{OtherWork}{}{}
\renewcommand{\OtherWorkItem}[8]{}
