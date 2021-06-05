\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTNetLab}

\LoadClass[10pt,a4paper]{../UTNetLabBase}
\RequirePackage[colorlinks,plainpages,citecolor=Blue,linkcolor=Blue,urlcolor=Cyan,filecolor=Cyan]{hyperref} % has conflict with arabi package in referencing

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{UTNetLabBase}}
\ProcessKeyvalOptions*

\definecolor{magnolia}{rgb}{0.97, 0.96, 1.0}
\definecolor{magnolialight}{rgb}{0.98, 0.97, 1.0}

\makeatletter

\AtBeginDocument{
  \hypersetup{pdftitle={Computer Network Lab :: \thetitle}}
  \hypersetup{pdfauthor=\theauthorshort}

  \renewcommand{\lstlistingname}{Code}
  \renewcommand{\lstlistlistingname}{List of \lstlistingname s}

  \fancyhead[L]{\footnotesize Computer Network Lab \\ \FR{آزمایشگاه شبکه‌های کامپیوتری}}
  \fancyhead[R]{\footnotesize {{\thetitle{}} \\ Laboratory Manual}}
  \fancyfoot[R]{\footnotesize School of Electrical and Computer Engineering\\\FR{دانشکده‌ی مهندسی برق و کامپیوتر}}
  \fancyfoot[C]{\thepage}
  \fancyfoot[L]{\footnotesize University of Tehran \\ \FR{دانشگاه تهران}}

  \selectlanguage{english}
  \maketitle
}

\newcommand{\maketitlepage}{
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    % \vskip 60\p@
    \begin{center}
      {\LARGE {
      \vspace{-25pt}
      \Large\AR{\textmash{بِسم \allah\  الرحمن الرحيم}}\par
      {\normalsize{}In the name of Allah\\}
      \begin{center}
        % \newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
        \begin{minipage}{0.48\textwidth}
          \begin{flushleft}
            \hspace*{-20pt}
            \includegraphics[height=64pt]{../img/ut}
          \end{flushleft}
        \end{minipage}
        \begin{minipage}{0.48\textwidth}
          \begin{flushright}
            \includegraphics[height=64pt]{../img/fanni}
            \hspace*{-35pt}
          \end{flushright}
        \end{minipage}
      \end{center}
      \vspace*{-50pt}
      % \horrule{0.5pt} \\[0.4cm]
      {\huge\bfseries \@title  \ifdefined\reference \footnote{\reference}\fi \par}
      \LARGE\scshape Laboratory Manual \ifdefined\@labnumber \@labnumber\fi \par
      \vspace{20pt}
      % \horrule{2pt} \\[0.5cm]
      } \par}
      \vskip 3em
        {\large
          \lineskip .75em
            {
              {\Large University of Tehran\\}
                {\large School of Electrical and Computer Engineering\par}
              \vskip 1.5em
                {\Large\FR{دانشگاه تهران}\\}
              \FR{دانشکده‌ی مهندسی برق و کامپیوتر\par}
              \vskip 3em
                {\Large\bfseries Computer Network Lab\\}
              \bfseries\FR{آزمایشگاه شبکه‌های کامپیوتری\par}
              \vskip 1.5em
              \normalfont
              \normalsize
              \begin{tabular}[t]{c}
                \@author
              \end{tabular}
            }
          \par}
      \vskip 3em
        {\small \@date \par}
    \end{center}\par
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}
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
\newcommand{\mail}[1]{\href{mailto:#1?subject=[CNL]\%20}{\ttfamily #1}}
\newenvironment{report}[1][]{\subsection*{Report}#1\begin{enumerate}}{\end{enumerate}}
\newenvironment{question}[1][]{\subsection*{Question}#1\begin{itemize}}{\end{itemize}}

\date{\today\\\vspace{10pt}{\selectlanguage{farsi}\today}}
\authorshort{A. Khonsari, A. HajiAliKhamseh'i, M. Borhani, A. Khordadi, S. Kashipazha, H. Safari}
\author{
  Dr. Ahmad Khonsari\\
  \FR{دکتر احمد خونساری}\\
  \mail{a\_khonsari@ut.ac.ir}
  \end{tabular}\vskip 1em
  \begin{tabular}[t]{c}
  Amir Haji Ali Khamseh'i\\
  \FR{امیر حاجی‌علی‌خمسه‌ء}\\
  \mail{khamse@ut.ac.ir}
  \and
  {Muhammad Borhani}\\
  \FR{محمد برهانی}\\
  \mail{borhani.m@ut.ac.ir}
  \and
  {AmirAhmad Khordadi}\\
  \FR{امیراحمد خردادی}\\
  \mail{a.a.khordadi@ut.ac.ir}
  \and
  {Sina Kashipazha}\\
  \FR{سینا کاشی‌پزها}\\
  \mail{sina\_kashipazha@ut.ac.ir}
  \and
  {Hadi Safari}\\
  \FR{هادی صفری}\\
  \mail{hadi.safari@ut.ac.ir}
}

\makeatother
