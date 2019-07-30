\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTNetLabFa}
	
\LoadClass[10pt,a4paper]{article}
\RequirePackage[OT1,T1,LFE,LAE]{fontenc}
\RequirePackage[free]{frfonts}
\RequirePackage[utf8]{inputenc}
\RequirePackage[arabic,english,farsi]{babel}
\RequirePackage[dvipsnames]{xcolor}
% \RequirePackage{hyperref} % have bug with arabi package in referencing
\RequirePackage{amsmath,amsfonts}
\RequirePackage{amssymb}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage[a4paper, margin=2cm, top=2.5cm, bottom=2.5cm]{geometry}
\RequirePackage[caption=false]{subfig}
\RequirePackage{float}
\RequirePackage{sidecap}
\RequirePackage{textcomp}
\RequirePackage{listings}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{framed,verbatim}
\RequirePackage[title,toc,page]{appendix}

\usetikzlibrary{calc,positioning}

% \hypersetup{colorlinks,plainpages,citecolor=Blue,linkcolor=Blue,urlcolor=Cyan,filecolor=Cyan}
% \DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{report}}
% \ProcessKeyvalOptions*

\makeatletter

\AtBeginDocument{
	\let\thetitle\@title
	\let\theauthor\@author
	\let\thedate\@date
	
	% \hypersetup{pdftitle={آزمایشگاه شبکه‌های کامپیوتری :: \thetitle}}
	% \hypersetup{pdfauthor=\theauthorshort}
	
	\renewcommand{\lstlistingname}{کد}
	\renewcommand{\lstlistlistingname}{فهرست \lstlistingname ها}
	
	\numberwithin{equation}{section}
	\numberwithin{figure}{section}
	\numberwithin{table}{section}
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[R]{\footnotesize \textLR{Computer Network Lab} \\ \textLR{Laboratory Manual}}
	\fancyhead[L]{\footnotesize {\@title} \\ آزمایشگاه شبکه‌های کامپیوتری}
	\fancyfoot[L]{\footnotesize {دانشگاه تهران} \\ دانشکده‌ی مهندسی برق و کامپیوتر}
	\fancyfoot[C]{\thepage}
	\fancyfoot[R]{\footnotesize \textLR{University of Tehran} \\ \textLR{School of Electrical and Computer Engineering}}
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
			tcpdump, wireshark, arp, arping, ping, iptables, xinetd, date, time, ftp, tftp, htop, ntp,
			sysctl, service, apache2, gcc, g++, sftp, make-ssl-cert, openssl, ssh, traceroute,  man, tracepath,
			a2enmod, pgrep, mv, snmpwalk, snmpget, rlogin
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
			igmp, term, terminal, protocol, ieee, addr, routing,
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
	
	\selectlanguage{farsi}
	
	\maketitle
	\makeatother
	\newpage
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
				\Large\AR{\textmash{بسم \allah\  الرحمن الرحيم}}\par
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
				\LARGE\scshape {دستور آزمایشگاه}\par
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
\newcommand{\mail}[1]{{\color{Cyan}\ttfamily \textLR{#1}}}%\href{mailto:#1?subject=[CNL]\%20}
\newenvironment{report}[1][]{\subsection*{گزارش}#1\begin{itemize}}{\end{itemize}}
\newcommand\ol[1]{{\setul{-0.9em}{}\ul{#1}}}

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
	\mail{m.borhani@ut.ac.ir}
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
