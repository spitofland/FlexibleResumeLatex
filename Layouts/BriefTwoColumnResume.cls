\ProvidesClass{Layouts/BriefTwoColumnResume}[2018/05/16 One page, two column resume class]
\LoadClass{Layouts/BaseCV}
\NeedsTeXFormat{LaTeX2e}

\newlength{\leftwidth}
\setlength{\leftwidth}{0.24\textwidth}

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

\setlength{\datewidth}{0.14\linewidth}
\setlist{nolistsep}

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
	\ifthenelse{\equal{\mynumberphone}{}}{}{\\\\\mynumberphone}
	\ifthenelse{\equal{\mymail}{}}{}{\\\\\mymail}
	\ifthenelse{\equal{\myaddress}{}}{}{\\\\\myaddress}
	\ifthenelse{\equal{\mysite}{}}{}{\\\\\mysite}
	\ifthenelse{\equal{\mysummary}{}}{}{\section*{Summary}\mysummary}
	\section*{Skills}\myskills
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
