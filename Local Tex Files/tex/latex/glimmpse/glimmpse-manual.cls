%%
%% The `glimmpse-manual.cls' is used for formatting the GLIMMPSE manual.
%%
%% Author: Sarah Kreidler
%%
\def\fileversion{1.0}
\def\filename{glimmpse-manual}
\def\filedate{2012/09/06}
%%
%% Package 'glimmpse-manual' to use with LaTeX2e 
%% License: GPL-2
%% Copyright: Copyright (C) 2012 Regents of the University of Colorado.  
%% Author: Sarah Kreidler
%% Please report errors to sarah.kreidler@ucdenver.edu
%%
%% Based on the package 'jss' of the Journal of Statistical Software
%% See http://www.jstatsoft.org/ for details
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{glimmpse-manual}[\filedate\space\fileversion\space Glimmpse Tutorial Class by Sarah Kreidler]
\ProcessOptions

%% load article defaults
\LoadClass[11pt]{article}

%% required packages
\RequirePackage{savesym,amsmath,graphicx,color,hyperref,geometry,fancyhdr,extramarks,lastpage,chngpage}
\RequirePackage[T1]{fontenc}

%% set margins
\geometry{verbose,tmargin=1in,bmargin=1in,lmargin=0.5in,rmargin=0.5in}

%% definitions from calling document
\newcommand{\GLIMMPSEVersion}[1]{\def\@GLIMMPSEVersion{#1}}
\newcommand{\doctitle}[1]{\def\@doctitle{#1}}
\newcommand{\docauthor}[1]{\def\@docauthor{#1}}
\newcommand{\docdate}[1]{\def\@docdate{#1}}

%% header and footer setup
\pagestyle{fancy}

%% header
\lhead{\includegraphics[height=13pt]{glimmpse.png} GLIMMPSE User Manual}
\chead{} 
\rhead{Version \@GLIMMPSEVersion} %

%% footer
\lfoot{\includegraphics[height=13pt]{UCD_CSPH.png} \includegraphics[height=13pt]{UCD_CSPH_text.png}}                                                      
\cfoot{\includegraphics[height=13pt]{UFL_HOP.png}}                                                              
\rfoot{Page\ \thepage\ of\ \protect\pageref{LastPage}}                  %

%% header / footer lines
\renewcommand\headrulewidth{0.4pt}                                      %
\renewcommand\footrulewidth{0.4pt}                                      %

%% colors
\definecolor{Red}{rgb}{0.5,0,0}
\definecolor{Blue}{rgb}{0,0,0.5}

%% hyperlink formatting
\hypersetup{%
    hyperindex = {true},
    colorlinks = {true},
    linktocpage = {true},
    plainpages = {false},
    linkcolor = {Blue},
    citecolor = {Blue},
    urlcolor = {Blue},
    pdfstartview = {Fit},
    pdfpagemode = {UseOutlines},
    pdfview = {XYZ null null null}
}

\newcommand{\createtitle}{%
\begin{titlepage}
\begin{center}

% Upper part of the page
\includegraphics[height=18pt]{UCD_CSPH.png} 
\includegraphics[height=18pt]{UCD_CSPH_text.png} 
\hspace{1in} 
\includegraphics[height=18pt]{UFL_HOP.png} \\[1in]

% Title
\hrule 
\vspace{11pt}
{\huge \bfseries  \@doctitle}

\vspace{11pt}
\includegraphics[height=24pt]{glimmpse.png}

\vspace{11pt}
{\huge Version \@GLIMMPSEVersion}

\vspace{11pt}
\hrule

\vspace{40pt}
% Author
\emph{Authors:}

\@docauthor \\[2in]

% Date
{\large \@docdate} \\[1in]

% Copyright statement
Copyright (C) 2012 Regents of the University of Colorado Denver.  \\[1in]
\end{center}

% Funding
\hrule
\vspace{11pt}
{\small
GLIMMPSE is released under the GNU Public License version 2.0.
GLIMMPSE Version {\@GLIMMPSEVersion}  is funded by NIDCR 1 R01 DE020832-01A1 to the 
University of Florida (Keith E. Muller, PI; Deborah Glueck, University of Colorado site PI).
Previous funding was received from an American 
Recovery and Re-investment Act supplement (3K07CA088811-06S) for NCI grant K07CA088811. 
}


\end{titlepage}
}

%% Add title page for manual
\AtBeginDocument{

\createtitle

\tableofcontents{}

\newpage

}

%% bibliography
\usepackage[authoryear,round,longnamesfirst]{natbib}
\bibpunct{(}{)}{;}{a}{}{,}
\bibliographystyle{glimmpse}
%% paragraphs
\setlength{\parskip}{0.7ex plus0.1ex minus0.1ex}
\setlength{\parindent}{0em}

%% sections, subsections, and subsubsections
\newlength{\preXLskip}
\newlength{\preLskip}
\newlength{\preMskip}
\newlength{\preSskip}
\newlength{\postMskip}
\newlength{\postSskip}
\setlength{\preXLskip}{1.8\baselineskip plus 0.5ex minus 0ex}
\setlength{\preLskip}{1.5\baselineskip plus 0.3ex minus 0ex}
\setlength{\preMskip}{1\baselineskip plus 0.2ex minus 0ex}
\setlength{\preSskip}{.8\baselineskip plus 0.2ex minus 0ex}
\setlength{\postMskip}{.5\baselineskip plus 0ex minus 0.1ex}
\setlength{\postSskip}{.3\baselineskip plus 0ex minus 0.1ex}

\newcommand{\jsssec}[2][default]{
  \vskip \preXLskip%
%% \pdfbookmark[1]{#1}{Section.\thesection.#1}%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\thesection. #1}
  \centerline{\textbf{\Large \thesection. #2}} \nopagebreak
  \vskip \postMskip \nopagebreak
  }
\newcommand{\jsssecnn}[1]{\vskip \preXLskip%
  \centerline{\textbf{\Large #1}} \nopagebreak
  \vskip \postMskip \nopagebreak}

\newcommand{\jsssubsec}[2][default]{\vskip \preMskip%
%% \pdfbookmark[2]{#1}{Subsection.\thesubsection.#1}%
  \refstepcounter{subsection}%
  \addcontentsline{toc}{subsection}{\thesubsection. #1}
  \textbf{\large \thesubsection. #2} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssubsecnn}[1]{\vskip \preMskip%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}

\newcommand{\jsssubsubsec}[2][default]{\vskip \preSskip%
 %% \pdfbookmark[3]{#1}{Subsubsection.\thesubsubsection.#1}%
  \refstepcounter{subsubsection}%
  \addcontentsline{toc}{subsubsection}{\thesubsubsection. #1}
  {\large \textit{\thesubsubsection. #2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssubsubsecnn}[1]{\vskip \preSskip%
  {\textit{\large #1}} \nopagebreak
  \vskip \postSskip \nopagebreak}

\newcommand{\jsssimplesec}[2][default]{\vskip \preLskip%
%%  \pdfbookmark[1]{#1}{Section.\thesection.#1}%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\thesection. #1}
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssimplesecnn}[1]{\vskip \preLskip%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}

\renewcommand{\section}{\secdef \jsssec \jsssecnn}
\renewcommand{\subsection}{\secdef \jsssubsec \jsssubsecnn}
\renewcommand{\subsubsection}{\secdef \jsssubsubsec \jsssubsubsecnn}

%%
%% End of file `glimmpse_manual.cls'.
