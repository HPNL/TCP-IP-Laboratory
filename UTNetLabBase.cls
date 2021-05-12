\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UTNetLabBase}

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
\RequirePackage{realboxes}
\RequirePackage{xpatch}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{framed,verbatim}
\RequirePackage[title,toc,page]{appendix}
\RequirePackage{caption}
\RequirePackage{array}
\RequirePackage{kvoptions}
\usetikzlibrary{calc,positioning}
\usepackage{indentfirst}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*

\definecolor{magnolia}{rgb}{0.97, 0.96, 1.0}
\definecolor{magnolialight}{rgb}{0.98, 0.97, 1.0}
\definecolor{olive}{rgb}{0.5, 0.5, 0.0}
\definecolor{darkolivegreen}{rgb}{0.30, 0.40, 0.0}

\def\labnumber#1{\gdef\@labnumber{#1}}

\makeatletter

\AtBeginDocument{
  \let\thetitle\@title
  \let\theauthor\@author
  \let\thedate\@date

  \counterwithout{lstlisting}{section}

  \numberwithin{equation}{section}
  \numberwithin{figure}{section}
  \numberwithin{table}{section}
  \pagestyle{fancy}
  \fancyhf{}
  \renewcommand{\headrulewidth}{1pt}
  \renewcommand{\footrulewidth}{1pt}
  \setlength{\headheight}{13.6pt}
  \newcommand{\horrule}[1]{\rule{\linewidth}{#1}}
  \renewcommand{\arraystretch}{1.2}
  \setlength{\parskip}{5pt}
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
    backgroundcolor = \color{green!10},
    language=bash,
    keywords=[1]{
        grep, ifconfig, telnet, netstat, ip, route, more, less, cat, screen, head, tail, cmp, cp,
        tcpdump, wireshark, arp, arping, ping, iptables, xinetd, inetd, date, time, ftp, tftp, htop, ntp,
        sysctl, service, apache2, gcc, g++, sftp, make-ssl-cert, openssl, ssh, traceroute,  man, tracepath,
        a2enmod, pgrep, mv, snmpwalk, snmpget, rlogin, ps, kill, sock, socket, ntptrace, ntpq,
        goaccess, webalizer, vlc, firefox, systemctl, nano, vim, docker, echo, dhclient, rdate, ntpdate,
        status, dhcpd, routed, curl, snmpd, ls, rm, rdisc,
      },
    keywords=[2]{
        netspy, netspyd, setsockopt, send, UDPserver, UDPclient, TCPserver, TCPclient,
      },
    keywords=[3]{
        setsockopt, localhost, start, stop, restart
      },
  }
  \lstdefinelanguage{generic}{
    alsoletter={-},
  }
  \lstdefinelanguage{conf}{
    backgroundcolor = \color{red!10},
    language=generic,
    comment=[l]{\#},
  }
  \lstdefinelanguage{cisco}{
    backgroundcolor = \color{yellow!10},
    alsoletter={-,+,?},
    keywords = [0]{Ctrl-Z, Ctrl+Z, end, exit, no, clear, wr, ?},
    keywords = [1]{
        show, sh, ip, config, configure, configuration, int, interface, router,
        mtrace,mrinfo,mstat,ping,debug, bridge, shut, write,
        enable, aaa, username, access-list, bridge-group, help,
      },
    morekeywords=[2]{
        igmp, term, terminal, protocol, ieee, addr, routing, ttl-threshold,
        route, network, rip, ospf, irdp, area, database, neighbor, virtual-links,
        summary,asb-summary,external,database-summary,count, authorization,
        mroute, pim, dvmrp, privilege, password, new-model, authentication, login, default,
        exec, http, server, secure-server, local, overload, tcp,
        dense-mode, sparse-mode, dense-sparse-mode, multicast-routing, multicast,
        join-group, group-address, query-interval,groups, deny, permit, host,translations,
        nat, pool, nat, inside, source, list, netmask, static, ethernet, address, outside,
        unreachables, mtu, group, version, proxy-arp
      },
    comment=[l]{!},
    keywordstyle=[0]\color{red},
    keywordstyle=[2]\color{NavyBlue},
    % commentstyle=\color{purple}\ttfamily,
    stringstyle=\color{red}\ttfamily,
    morestring=[b]',
    morestring=[b]"
  }
  \lstdefinelanguage{HTTP}{
    backgroundcolor = \color{RoyalPurple!10},
    alsoletter={-},
    alsoother={@},
  }
  \lstset{
    backgroundcolor = \color{magnolia},
    frame = single,
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
    keywordstyle={[3]\bfseries\color{darkolivegreen}},
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
}

% \xpretocmd\lstinline{\Colorbox{magnolialight}\bgroup\appto\lst@DeInit{\egroup}}{}{}
\newcommand{\lstbash}[2][]{\Colorbox{green!10}{\lstinline[language=bash-ext, #1]{#2}}}
\newcommand{\lstcisco}[2][]{\Colorbox{yellow!10}{\lstinline[language=cisco, #1]{#2}}}
\newcommand{\lstconf}[2][]{\Colorbox{red!10}{\lstinline[language=conf, #1]{#2}}}
\newcommand{\lstgeneric}[2][]{\Colorbox{magnolialight}{\lstinline[language=generic, #1]{#2}}}

\newcommand\ol[1]{{\setul{-0.9em}{}\ul{#1}}}

\makeatother
