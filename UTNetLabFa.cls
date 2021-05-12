\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTNetLabFa}

\LoadClass[10pt,a4paper]{../UTNetLabBase}
\RequirePackage[free]{frfonts}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{UTNetLabBase}}
\ProcessKeyvalOptions*

\newsavebox{\RTLbox}
\newcolumntype{R}{>{\begin{lrbox}{\RTLbox}}r<{\end{lrbox}\AR{\unhbox\RTLbox}}}
\newcolumntype{L}{>{\begin{lrbox}{\RTLbox}}l<{\end{lrbox}\AR{\unhbox\RTLbox}}}
\newcolumntype{C}{>{\begin{lrbox}{\RTLbox}}c<{\end{lrbox}\AR{\unhbox\RTLbox}}}
\newcommand{\LR}{\textLR}
\newcommand{\EN}{\textLR}
\newcommand{\en}{\textLR}
\newcommand{\RL}{\textRL}
\newcommand{\FA}{\FR}
% \newcommand{\fa}{\FR}

\makeatletter

\AtBeginDocument{
  \renewcommand{\lstlistingname}{\FR{کد}}
  \renewcommand{\lstlistlistingname}{فهرست \lstlistingname ها}

  \fancyhead[R]{\footnotesize \textLR{Computer Network Lab} \\ \textLR{Laboratory Manual}}
  \fancyhead[L]{\footnotesize {\@title} \\ آزمایشگاه شبکه‌های کامپیوتری}
  \fancyfoot[L]{\footnotesize {دانشگاه تهران} \\ دانشکده‌ی مهندسی برق و کامپیوتر}
  \fancyfoot[C]{\thepage}
  \fancyfoot[R]{\footnotesize \textLR{University of Tehran} \\ \textLR{School of Electrical and Computer Engineering}}

  \selectlanguage{farsi}
  \maketitle
}

\newcommand{\maketitlepage}{
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    \begin{center}
      {
        \LARGE
        {
          \vspace{-35pt}
          \Large\AR{\textmash{بِسم \allah\  الرحمن الرحيم}}\par
          {\normalsize\textLR{In the name of Allah}}
          \vspace{30pt}
          \begin{center}
            \begin{otherlanguage}{english}
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
            \end{otherlanguage}
          \end{center}
          \vspace*{-70pt}
          {
            \huge\bfseries \@title \ifdefined\reference \footnote{\reference}\fi \par
          }
          \vspace*{5pt}
          \LARGE\scshape {دستور آزمایشگاه} \ifdefined\@labnumber \@labnumber\fi\par
          \vspace{40pt}
        }
        \par
      }
      {
        \large
        \lineskip .5em
          {\Large{دانشگاه تهران}\\}
          {دانشکده‌ی مهندسی برق و کامپیوتر\par}
        \vskip 1.5em
        \textLR{\Large University of Tehran\\}
        \textLR{\large School of Electrical and Computer Engineering}\par
        \vskip 3em
        \bfseries{آزمایشگاه شبکه‌های کامپیوتری\\}
        \textLR{\Large\bfseries Computer Network Lab}\par
        \vskip 1.5em
        \normalfont
        \normalsize
        \begin{tabular}[t]{c}
          \@author
        \end{tabular}
      }
      \par
      \vskip 3em
        {\small \@date \par}
    \end{center}
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}
}
\renewcommand{\maketitle}{\maketitlepage}
\newcommand{\authorshort}[1]{\def\theauthorshort{#1}}
\newcommand{\mail}[1]{{\color{Cyan}\ttfamily \textLR{#1}}}
\newenvironment{report}[1][]{\subsection*{گزارش}#1\begin{enumerate}}{\end{enumerate}}
\newenvironment{question}[1][]{\subsection*{پرسش}#1\begin{itemize}}{\end{itemize}}

\date{\today \\ \vspace{10pt} {\selectlanguage{english}\today}}
\authorshort{\textLR{A. Khonsari, A. HajiAliKhamseh'i, M. Borhani, A. Khordadi, S. Kashipazha, H. Safari}}
\author{
  \FR{دکتر احمد خونساری}\\
  \textLR{Dr. Ahmad Khonsari}\\
  \mail{a\_khonsari@ut.ac.ir}
  \end{tabular}\vskip 1em
  \begin{tabular}[t]{c}
  \FR{امیر حاجی علی خمسه‌ء}\\
  \textLR{Amir Haji Ali Khamseh'i}\\
  \mail{khamse@ut.ac.ir}
  \and
  \FR{محمد برهانی}\\
  \textLR{Muhammad Borhani}\\
  \mail{borhani.m@ut.ac.ir}
  \and
  \FR{امیراحمد خردادی}\\
  \textLR{AmirAhmad Khordadi}\\
  \mail{a.a.khordadi@ut.ac.ir}
  \and
  \FR{سینا کاشی‌پزها}\\
  \textLR{Sina Kashipazha}\\
  \mail{sina\_kashipazha@ut.ac.ir}
  \and
  \FR{هادی صفری}\\
  \textLR{Hadi Safari}\\
  \mail{hadi.safari@ut.ac.ir}
}

\makeatother
