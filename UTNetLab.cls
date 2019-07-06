\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTNetLab}

\LoadClass[10pt,a4paper]{article}
\RequirePackage[OT1,T1,LFE,LAE]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[arabic,english,farsi]{babel}
\RequirePackage{amsmath,amsfonts} % Math packages
\RequirePackage{amssymb}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage[left=2cm, right=2cm, top=3cm, bottom=3cm]{geometry}
\RequirePackage[caption=false]{subfig}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{float}
\RequirePackage{sidecap}
\RequirePackage{listings}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{framed,verbatim}
\usetikzlibrary{calc}
\RequirePackage[colorlinks,plainpages,citecolor=Blue,linkcolor=Blue,urlcolor=Cyan,filecolor=Cyan]{hyperref}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyvalOptions*

\makeatletter

\AtBeginDocument{
    \let\thetitle\@title
    \let\theauthor\@author
    \let\thedate\@date

    \hypersetup{pdftitle={Computer Network Lab :: \thetitle}}
    \hypersetup{pdfauthor=\theauthorshort}

    \renewcommand{\lstlistingname}{Code}
    \renewcommand{\lstlistlistingname}{List of \lstlistingname s}

    \numberwithin{equation}{section}
    \numberwithin{figure}{section}
    \numberwithin{table}{section}
    \pagestyle{fancy}
    %\pagestyle{fancyplain}
    \fancyhf{}
    \fancyhead[L]{\footnotesize Computer Network Lab \\ \FR{آزمایشگاه شبکه‌های کامپیوتری}}
    \fancyhead[R]{\footnotesize {{\thetitle{}} \\ Laboratory Manual}}
    \fancyfoot[R]{\footnotesize School of Electrical and Computer Engineering\\\FR{دانشکده‌ی مهندسی برق و کامپیوتر}}
    \fancyfoot[C]{\thepage}
    \fancyfoot[L]{\footnotesize University of Tehran \\ \FR{دانشگاه تهران}}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{1pt}
    \setlength{\headheight}{13.6pt}
    \newcommand{\horrule}[1]{\rule{\linewidth}{#1}}    % Horizontal rule
    \renewcommand{\arraystretch}{1.2}
    % \setlength{\parindent}{2em}
    % \setlength{\parskip}{0.5em}

    \definecolor{shadecolor}{rgb}{.9, .9, .9}
    \newenvironment{grayverbatim}%
       {\snugshade\verbatim}%
       {\endverbatim\endsnugshade}
    \date{\vspace{30pt}\today\\\vspace{10pt}{\selectlanguage{farsi}\today}}

    % \setmonofont{Courier New}
    \tolerance=5000
}

\newcommand{\maketitlepage}{%
  \begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  % \vskip 60\p@
  \begin{center}%
    {\LARGE {
    \normalsize In the name of Allah\\
    \vspace{10pt}
    \LARGE\FR{بسم \allah\  الرحمن الرحیم}
    \vspace{10pt}
    \begin{center}
        %   \newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
        \begin{minipage}{0.48\textwidth}
            \begin{flushleft}
                \includegraphics[height=64pt,width=64pt]{../img/logo.png}
            \end{flushleft}
        \end{minipage}
        \begin{minipage}{0.48\textwidth}
            \begin{flushright}
                \includegraphics[height=64pt]{../img/eng-logo.png}
            \end{flushright}
        \end{minipage}
    \end{center}
    \vspace*{-64pt}
    %   \horrule{0.5pt} \\[0.4cm]
    \huge \@title\\
    Laboratory Manual\\
    \vspace{40pt}
    %   \horrule{2pt} \\[0.5cm]
    } \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
        {
          {\LARGE University of Tehran}\\
          {\Large\FR{دانشگاه تهران}}\\
          \vskip 1.5em%
          {\Large School of Electrical and Computer Engineering}\\
          \FR{دانشکده‌ی مهندسی برق و کامپیوتر}\\
          \vskip 1.5em%
          {\Large Computer Network Lab}\\
          \FR{آزمایشگاه شبکه‌های کامپیوتری}\\
          \vskip 3em%
          \normalfont
          \normalsize
          \begin{tabular}[t]{c}%
          \@author
          \end{tabular}
        }
      \par}%
      \vskip 1.5em%
    {\large \@date \par}%
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@authorshort\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\renewcommand{\maketitle}{\maketitlepage}
\newcommand{\authorshort}[1]{\def\theauthorshort{#1}}
\newcommand{\mail}[1]{\href{mailto:#1?subject=[CNL]\%20}{#1}}

\newcommand\ol[1]{{\setul{-0.9em}{}\ul{#1}}}

\makeatother
