\ProvidesClass{Layouts/BriefOneColumnResume}[2018/05/20 Simple one page resume class]
\LoadClass{Layouts/BaseCV}
\NeedsTeXFormat{LaTeX2e}

\usepackage{multicol}
\usepackage[compact]{titlesec}

\setlength{\DateWidth}{0.14\textwidth}

\setlength{\DetailsWidth}{\textwidth}
\addtolength{\DetailsWidth}{-\DateWidth}
\addtolength{\DetailsWidth}{-\tabcolsep}

\setlist{nolistsep}
\setlist[itemize,1]{leftmargin=0.9\labelwidth}

\renewcommand{\SectionTitle}[1]{\vspace{-1.5\topsep}\section*{#1}}

% Renew this command to change the number of columns under "Skills"
\newcommand{\NumSkillsColumns}{5}

\renewcommand{\myskills}[1]{\renewcommand{\myskills}{
	\vspace{-\topsep}
	\begin{multicols}{5}
	\begin{itemize}[itemsep=1ex]
	\foreach \s in {#1}{\item \s}
	\end{itemize}
	\end{multicols}
}}

\renewcommand{\generateheader}{
	\ifthenelse{\equal{\addresslength}{}}{\renewcommand{\addresslength}{\widthof{\myaddress}}}{}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lcr}
		\ifthenelse{\equal{\myname}{}}{}{{\Huge\myname}}&
		\ifthenelse{\equal{\mysite}{}}{}{\ifthenelse{\equal{\mymail}{}}{}{\mymail}}&
		\ifthenelse{\equal{\myaddress}{}}{}{\parbox{\addresslength}{\RaggedLeft\myaddress}}\\
		\ifthenelse{\equal{\myjobtitle}{}}{}{{\Large\myjobtitle}}&
		\ifthenelse{\equal{\mysite}{}}{\ifthenelse{\equal{\mymail}{}}{}{\mymail}}{\mysite}&
		\ifthenelse{\equal{\mynumberphone}{}}{}{\mynumberphone}
	\end{tabular*}
	\hrule

	\ifthenelse{\equal{\mysummary}{}}{}{\vspace{1em}\SectionTitle{Summary}\mysummary}

	\vspace{1em}\SectionTitle{Skills}
	\myskills
}

% Contact name and number not displayed
\renewcommand{\RelatedWorkItem}[8]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#8}}
\renewcommand{\OtherWorkItem}[8]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#8}}
\renewcommand{\VolunteerItem}[6]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#6}}

% Don't add other work experience
\renewenvironment{OtherWork}{}{}
\renewcommand{\OtherWorkItem}[8]{}
