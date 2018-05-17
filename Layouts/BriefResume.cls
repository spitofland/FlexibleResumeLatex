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

% \workitem{title}{organization}{start date}{end date}{location}{contact name}{contact phone}{bullet points}
\renewcommand{\workitem}[8]{
	\vspace{\topsep}
	\parbox[t]{\datewidth}{
		#3\ifthenelse{\equal{#4}{}}{}{\newline - #4}
	}&\parbox[t]{\detailswidth}{
		\textbf{#1}\newline
		\textit{#2\hfill #5}
%		\ifthenelse{\equal{#6#7}{}}{}{\newline#6\hfill #7}
		\ifthenelse{\equal{#8}{}}{}{
			\begin{itemize}[itemsep=1ex, topsep=1ex]
			\foreach \b in {#8}{\item \b}
			\end{itemize}
		}
	}\\
}

% Don't add other work experience
\renewenvironment{otherwork}{}{}
\renewcommand{\otherworkitem}[8]{}
