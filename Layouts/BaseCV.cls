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

% New environment for related work experience
\newenvironment{relatedwork}{%
	\section*{Related Experience}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

% New environment for related work experience
\newenvironment{otherwork}{%
	\section*{Additional Work Experience}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

% New environment for related work experience
\newenvironment{education}{%
	\section*{Education}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

% New environment for related work experience
\newenvironment{volunteer}{%
	\section*{Volunteer Experience}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newlength{\datewidth}
\setlength{\datewidth}{0.1\linewidth}

\newlength{\detailswidth}
\setlength{\detailswidth}{\linewidth}
\addtolength{\detailswidth}{-\datewidth}
\addtolength{\detailswidth}{-\tabcolsep}

% \workitem{title}{organization}{start date}{end date}{location}{contact name}{contact phone}{bullet points}
\newcommand{\workitem}[8]{
	\parbox[t]{\datewidth}{
		#3\ifthenelse{\equal{#4}{}}{}{\newline - #4}
	}&\parbox[t]{\detailswidth}{
		\textbf{#1}\newline
		\textit{#2\hfill #5}
		\ifthenelse{\equal{#6#7}{}}{}{\newline#6\hfill #7}
		\ifthenelse{\equal{#8}{}}{}{
			\begin{itemize}
			\foreach \b in {#8}{\item \b}
			\end{itemize}
		}
	}\\
}

\newcommand{\relatedworkitem}[8]{\workitem{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}}
\newcommand{\otherworkitem}[8]{\workitem{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}}
\newcommand{\volunteeritem}[6]{\workitem{#1}{#2}{#3}{#4}{#5}{}{}{#6}}
\newcommand{\educationitem}[6]{\volunteeritem{#1}{#2}{#3}{#4}{#5}{}}

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

	\ifthenelse{\equal{\mysummary}{}}{}{\section*{Summary}\mysummary}

	\subsection*{Skills}
	\myskills
}

\newcommand{\generatefooter}{}
