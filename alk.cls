% Klasa dokumentow do skladu prac magisterskich i~licencjackich
% na wydziale Matematyki, Mechaniki i~Informatyki UW.
%
% Copyright (c) 2001 by Wydzial Matematyki, Informatyki i Mechaniki.
%
% Zmiany 05.05.2006 by Seweryn Karlowicz

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{alk}[2006/05/05 v0.5.0 Praca magisterska]

% Pawel Przytula 05.01.2014
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\def\@baseclass{report}
\def\@rodzajpracy{dyplomowa}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,twoside,openright,12pt}{\@baseclass}
\ProcessOptions

\LoadClass{\@baseclass}

\usepackage{graphicx}
\usepackage{tikz}
\usetikzlibrary{calc}

\textwidth\paperwidth
\advance\textwidth -55mm
\oddsidemargin-1in
\advance\oddsidemargin 30mm
\evensidemargin-1in
\advance\evensidemargin 25mm
\topmargin -1in
\advance\topmargin 2cm
\setlength\textheight{48\baselineskip}
\addtolength\textheight{\topskip}
\marginparwidth15mm

\renewcommand\maketitle{%
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=north east,inner sep=0pt] at ($(current page.north east)$) {
        \includegraphics{img/alk}
      };
    \end{tikzpicture}
    \begin{center}%
      {\LARGE\textbf{Centrum Doradztwa i Kształcenia Menedżerów Center of Excellence}\par}
      \vspace{0.5cm}
      {\Large\textbf{Coaching profesjonalny - metody i praktyka edycja XII}\par}
      \vspace{1cm plus 1fill}
      {\Large\bf Praca końcowa:\par}
      \vspace{0.2cm}
      \vspace{8mm plus .1fill}
      {\Huge\textbf{\@title}\par}
      \vspace{8mm plus .1fill}
      {\Large Autor:\par}
      \vspace{0.2cm}
      {\Large\bf\@author\par}
      \vspace{2cm}
      { \hfill Praca pisana pod kierunkiem: }
      \vspace{2cm plus 1.5fill}
      \begin{flushright}\large
      \end{flushright}
      \vspace{1cm plus 1fill}
      {\large Warszawa, \@date\par}
    \end{center}
    \@thanks
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\kierunek#1{\gdef\@kierunek{#1}}
\def\@kierunek{???\ClassError{pracamgr}{Nie podano kierunku studiow}\@ehc}


\renewenvironment{abstract}{%
  \titlepage
  \null\nobreak\vfil
  \@beginparpenalty\@lowpenalty
  \begin{center}%
    \bfseries\large \abstractname
    \@endparpenalty\@M
  \end{center}}%
{\par
  \vspace*{26pt}%
  \nobreak\vfil\null\endtitlepage\cleardoublepage}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\mdseries
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\endinput
