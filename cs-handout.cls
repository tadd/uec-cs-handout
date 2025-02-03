%%
%% This is file `cs-handout.cls', which is a modified version of
%% `jsarticle.cls' (version 2022-09-13) for typesetting handouts
%% for presentation in CS at UEC.
%%
%% All the modifications are based on an old class file for
%% Iwasaki-lab written by HAKUTA Shizuya @hak7a3.
%%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{cs-handout}
[2024/07/27 cs-handout (SATO Shigeyuki)]
\LoadClass[a4paper,oneside,twocolumn,notitlepage,final]{jsarticle}

\newif\if@wideline
\@widelinefalse
\newif\if@narrowline
\@narrowlinefalse
\DeclareOption{wideline}{\@widelinetrue}
\DeclareOption{narrowline}{\@narrowlinetrue}
% \ExecuteOptions{narrowline}
% \ExecuteOptions{wideline}
\ProcessOptions
\RequirePackage{fancyhdr}
% originally written by @hak7a3 2010/11/05, revised by sato 2025/01/20
\def\cshandoutError#1{\GenericError{ }{cs-handout Error : #1}{See the cs-handout manual.}{\@ehc}}
\def\@studentid{\cshandoutError{No \noexpand \studentid given}}
\def\@office{\cshandoutError{No \noexpand \office given}}
\def\studentid#1{\def\@studentid{#1}}
\def\office#1{\def\@office{#1}}
\lhead{(発表会名)}
\rhead{(年月日)}
\chead{}
\cfoot{}
\renewcommand{\headrulewidth}{0.4pt}
\if@slide
  \def\n@baseline{13}%
\else\if@wideline
  \def\n@baseline{16}% Option add 'wideline' 2011/09/28
\else\if@narrowline
  \def\n@baseline{12.5}%
\else
  \def\n@baseline{14.554375}%
\fi\fi\fi %2010/11/08 not slide 14.554375  <- 16

% margin of float for handout written by @hak7a3 2011/09/27
\setlength\floatsep    {\n@baseline\p@}
\setlength\textfloatsep{\n@baseline\p@}
\setlength\intextsep   {\n@baseline\p@}
\setlength\dblfloatsep    {\n@baseline\p@}
\setlength\dbltextfloatsep{\n@baseline\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{0\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{0\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}

\def\@maketitle{%
    \begin{center}
      {\LARGE \@title}
      \vspace{5mm}\par
      {\large \@studentid\quad\@author\qquad\@office\\}
      \vspace{5mm}
    \end{center}
}

\renewcommand{\jsParagraphMark}{}

% hook of end@[dbl]float to GYODORI from compsoft.sty
% copied by @hak7a3 2011/9/28

% height adjustment code insertion into float ending routines
\newdimen\@floatheight
\newcount\@floatlinecount
\newdimen\@baseline@normal
\@baseline@normal\n@baseline\p@

\def\end@float{\par\vskip\z@\egroup %% \par\vskip\z@ added 15 Dec 87
\color@endbox
\@floatheight=\ht\@currbox
\advance\@floatheight \dp\@currbox
\divide\@floatheight\@baseline@normal \@floatlinecount=\@floatheight
\advance\@floatlinecount\@ne
\@floatheight=\@floatlinecount\@baseline@normal
%\fboxrule=0.01pt\fboxsep=0pt% for debugging
\global\setbox\@currbox=\vbox to\@floatheight{\vfil\copy\@currbox\vfil}%
   \ifnum\@floatpenalty <\z@
     \@cons\@currlist\@currbox
     \ifdim \ht\@currbox >\textheight 
        \ht\@currbox\textheight \fi
     \ifnum\@floatpenalty < -\@Mii 
        \penalty -\@Miv 
        \@tempdima\prevdepth    %% saving and restoring \prevdepth added
        \vbox{}                 %% 26 May 87 to prevent extra vertical
        \prevdepth \@tempdima   %% space when used in vertical mode
        \penalty\@floatpenalty
      \else \vadjust{\penalty -\@Miv \vbox{}\penalty\@floatpenalty}\@esphack
     \fi\fi}%
\def\end@dblfloat{\if@twocolumn
     \par\vskip\z@\egroup %% \par\vskip\z@ added 15 Dec 87\egroup
\color@endbox
\@floatheight=\ht\@currbox
\advance\@floatheight \dp\@currbox
\divide\@floatheight\@baseline@normal \@floatlinecount=\@floatheight
\advance\@floatlinecount\@ne
\@floatheight=\@floatlinecount\@baseline@normal
%\fboxrule=0.01pt\fboxsep=0pt% for debugging
\global\setbox\@currbox=\vbox to\@floatheight{\vfil\copy\@currbox\vfil}%
     \ifnum\@floatpenalty <\z@ \@cons\@dbldeferlist\@currbox\fi
      \ifnum \@floatpenalty =-\@Mii \@esphack\fi\else\end@float\fi}%
\setlength\abovecaptionskip{3\p@} %% 3\p@ <- 5\p@ (jsarticle) % 元: 10\p@
\setlength\belowcaptionskip{3\p@} %% 3\p@ <- 5\p@ (jsarticle) % 元: 0\p@

\if@slide \pagestyle{empty} \else \pagestyle{fancy} \fi %% fancy <- plain (jsarticle)

\endinput
%%
%% End of file `cs-handout.cls'.
