\ProvidesClass{Layouts/BaseCV}[2018/05/16 Base CV Layout class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

% Include needed packages
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage[left=\Margin ,top=\Margin ,right=\Margin ,bottom=\Margin ,nohead,nofoot]{geometry}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{ragged2e}
\RequirePackage{tabularx}

% Default settings
\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% Commands to store information
\newcommand{\myname}[1]{\renewcommand{\myname}{#1}}
\newcommand{\myjobtitle}[1]{\renewcommand{\myjobtitle}{#1}}
\newcommand{\mynumberphone}[1]{\renewcommand{\mynumberphone}{#1}}
\newcommand{\mymail}[1]{\renewcommand{\mymail}{#1}}
\newcommand{\myaddress}[1]{\renewcommand{\myaddress}{#1}}
\newcommand{\mysite}[1]{\renewcommand{\mysite}{#1}}
\newcommand{\mysummary}[1]{\renewcommand{\mysummary}{#1}}
\newcommand{\addresslength}[1]{\renewcommand{\addresslength}{#1}}

% These commands can be overwritten with a different layout
\newcommand{\myskills}[1]{\renewcommand{\myskills}{#1}}

\newcommand{\SectionTitle}[1]{\section*{#1}}

% \NewTabEnvironment{environment name}{section title}{tabular columns}
\newcommand{\NewTabEnvironment}[3]{
	\newenvironment{#1}{
		\SectionTitle{#2}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}#3}
	}{
		\end{tabular*}
	}
}

\NewTabEnvironment{RelatedWork}{Related Experience}{ll}
\NewTabEnvironment{OtherWork}{Additional Experience}{ll}
\NewTabEnvironment{Education}{Education}{ll}
\NewTabEnvironment{Volunteer}{Volunteer Experience}{ll}
\NewTabEnvironment{Publications}{Publications}{ll}
\NewTabEnvironment{Awards}{Awards}{ll}

\newlength{\datewidth}
\setlength{\datewidth}{0.1\linewidth}

\newlength{\detailswidth}
\setlength{\detailswidth}{\linewidth}
\addtolength{\detailswidth}{-\datewidth}
\addtolength{\detailswidth}{-\tabcolsep}

\newlength{\BulletItemSep}
\setlength{\BulletItemSep}{1ex}

% \WorkItem{title}{organization}{start date}{end date}{location}{contact name}{contact phone}{bullet points}
\newcommand{\WorkItem}[8]{
	\vspace{\topsep}
	\parbox[t]{\datewidth}{
		#3\ifthenelse{\equal{#4}{}}{}{\newline - #4}
	}&\parbox[t]{\detailswidth}{
		\textbf{#1}\newline
		\textit{#2\hfill #5}
		\ifthenelse{\equal{#6#7}{}}{}{\newline#6\hfill #7}
		\ifthenelse{\equal{#8}{}}{}{
			\begin{itemize}[itemsep=\BulletItemSep, topsep=\BulletItemSep]
			\foreach \b in {#8}{\item \b}
			\end{itemize}
		}
	}\\
}

\newcommand{\RelatedWorkItem}[8]{\WorkItem{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}}
\newcommand{\OtherWorkItem}[8]{\WorkItem{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}}
\newcommand{\VolunteerItem}[6]{\WorkItem{#1}{#2}{#3}{#4}{#5}{}{}{#6}}
\newcommand{\EducationItem}[6]{\VolunteerItem{#1}{#2}{#3}{#4}{#5}{#6}}
\newcommand{\PublicationItem}[6]{\VolunteerItem{#1}{#2}{#3}{#4}{#5}{#6}}
\newcommand{\AwardItem}[6]{\VolunteerItem{#1}{#2}{#3}{#4}{#5}{#6}}

\newcommand{\generateheader}{
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

	\ifthenelse{\equal{\mysummary}{}}{}{\SectionTitle{Summary}\mysummary}

	\SectionTitle{Skills}
	\myskills
}

\newcommand{\generatefooter}{}
