\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTNetLab}
	
\LoadClass[10pt,a4paper]{article}
\RequirePackage[OT1,T1,LFE,LAE]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[arabic,english,farsi]{babel}
\RequirePackage{amsmath,amsfonts}
\RequirePackage{amssymb}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage[a4paper, margin=2cm, top=2.5cm, bottom=2.5cm]{geometry}
\RequirePackage[caption=false]{subfig}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{float}
\RequirePackage{sidecap}
\RequirePackage{textcomp}
\RequirePackage{listings}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{framed,verbatim}
\RequirePackage[title,toc,page]{appendix}
\RequirePackage{caption}
% \let\counterwithout\relax
% \let\counterwithin\relax
% \RequirePackage{chngcntr}
\RequirePackage[colorlinks,plainpages,citecolor=Blue,linkcolor=Blue,urlcolor=Cyan,filecolor=Cyan]{hyperref}
\usetikzlibrary{calc,positioning}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessKeyvalOptions*

\definecolor{magnolia}{rgb}{0.97, 0.96, 1.0}
\makeatletter

\AtBeginDocument{
    \let\thetitle\@title
    \let\theauthor\@author
    \let\thedate\@date

    \hypersetup{pdftitle={Computer Network Lab :: \thetitle}}
    \hypersetup{pdfauthor=\theauthorshort}

    \renewcommand{\lstlistingname}{Code}
    \renewcommand{\lstlistlistingname}{List of \lstlistingname s}

    \counterwithout{lstlisting}{section}

    \numberwithin{equation}{section}
    \numberwithin{figure}{section}
    \numberwithin{table}{section}
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[L]{\footnotesize Computer Network Lab \\ \FR{آزمایشگاه شبکه‌های کامپیوتری}}
    \fancyhead[R]{\footnotesize {{\thetitle{}} \\ Laboratory Manual}}
    \fancyfoot[R]{\footnotesize School of Electrical and Computer Engineering\\\FR{دانشکده‌ی مهندسی برق و کامپیوتر}}
    \fancyfoot[C]{\thepage}
    \fancyfoot[L]{\footnotesize University of Tehran \\ \FR{دانشگاه تهران}}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{1pt}
    \setlength{\headheight}{13.6pt}
    \newcommand{\horrule}[1]{\rule{\linewidth}{#1}}
    \renewcommand{\arraystretch}{1.2}
    \setlength{\parindent}{0pt}
    \renewcommand{\footnoterule}{
      \kern -3pt
      \hrule width 0.3\textwidth height 0.3pt
      \kern 2pt
    }
  \captionsetup{skip=10pt}
  \counterwithout{figure}{section}
  \counterwithout{table}{section}
  \counterwithout{lstlisting}{section}

    \definecolor{shadecolor}{rgb}{.9, .9, .9}
    \newenvironment{grayverbatim}
       {\snugshade\verbatim}
       {\endverbatim\endsnugshade}

    % \setmonofont{Courier New}
    \tolerance=5000

    \lstdefinelanguage{bash-ext}{
      language=bash,
      keywords=[1]{
        grep, ifconfig, telnet, netstat, ip, route, more, less, cat, screen, head, tail, cmp, cp,
        tcpdump, wireshark, arp, arping, ping, iptables, xinetd, inetd, date, time, ftp, tftp, htop, ntp,
        sysctl, service, apache2, gcc, g++, sftp, make-ssl-cert, openssl, ssh, traceroute,  man, tracepath,
        a2enmod, pgrep, mv, snmpwalk, snmpget, rlogin, ps, kill,
      },
      morekeywords=[2]{
        sock, socket, netspy, netspyd, %UDPserver, UDPclient,
        goaccess, webalizer, vlc, firefox,
      },
    }
    \lstdefinelanguage{generic}{
      alsoletter={-},
    }
    \lstdefinelanguage{conf}{
      language=generic,
      comment=[l]{\#},
    }
    \lstdefinelanguage{cisco}{
        alsoletter={-},
        keywords = [0]{no},
        keywords = [1]{
          show, ip, config, configuration, int, interface, router,
          mtrace,mrinfo,mstat,ping,debug, bridge, shut,
          end, exit, aaa, username, access-list, bridge-group,
        },
        morekeywords=[2]{
          igmp, term, terminal, protocol, ieee, addr, routing, ttl-threshold,
          route, network, rip, ospf, irdp, area, database, neighbor, virtual-links,
          summary,asb-summary,external,database-summary,count, authorization,
          mroute, pim, dvmrp, privilege, password, new-model, authentication, login, default,
          exec, http, server, secure-server, local, overload, tcp,
          dense-mode, sparse-mode, dense-sparse-mode, multicast-routing,
          join-group, group-address, query-interval,groups, deny, permit, host,translations,
          nat, pool, nat, inside, source, list, netmask, static, ethernet, address, outside,
        },
        comment=[l]{!},
        keywordstyle=[0]\color{red},
        keywordstyle=[2]\color{NavyBlue},
        commentstyle=\color{purple}\ttfamily,
        stringstyle=\color{red}\ttfamily,
        morestring=[b]',
        morestring=[b]"
    }
    \lstdefinelanguage{HTTP}{
        alsoletter={-},
        alsoother={@},
    }
    \lstset{
        backgroundcolor = \color{magnolia},
        % frame = single,
        frame = l,
        frameround=tttt,
        framesep = 4pt,
        breaklines=true,
        xleftmargin  = 0.7cm,
        xrightmargin = 0.5cm,
        language=bash-ext,
        alsoletter={-},
        columns=flexible,
        basicstyle=\small\ttfamily,
        keywordstyle=\bfseries\color{Blue},
        keywordstyle={[2]\bfseries\color{Cyan}},
        keywordstyle={[3]\bfseries\color{Olive}},
        stringstyle=\color{TealBlue},
        commentstyle=\itshape\color{Orange},
        identifierstyle=\color{Black},
        numbers=none,
        numberstyle=\scriptsize,
        captionpos=b,
        breaklines=true,
        breakatwhitespace=true,
        showstringspaces=false,
        tabsize=4,
        emphstyle=\itshape,
        escapechar=@,
        fontadjust=true,
        upquote=true,
    }

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
    \Large\AR{بسم \allah\  الرحمن الرحيم\par}\\
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
    \LARGE\scshape Laboratory Manual\par
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
\newcommand\ol[1]{{\setul{-0.9em}{}\ul{#1}}}

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
    \mail{m.borhani@ut.ac.ir}
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
