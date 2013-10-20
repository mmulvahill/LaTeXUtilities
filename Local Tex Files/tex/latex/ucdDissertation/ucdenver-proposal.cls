%%
%% The `ucdenver-proposal.cls' is used for formatting a PhD proposal 
%% defense for the Department of Biostatistics & Informatics,
%% University of Colorado Denver.
%% It may be applicable to other students in the Graduate School
%% on Anschutz Medical Campus, but please check the
%% Graduate School rules prior to using.
%%
%% Author: Sarah Kreidler
%%
%%
%% Package 'ucdenver-proposal' to use with LaTeX2e 
%% License: GPL-2
%% Copyright: (C) University of Colorado Denver
%% Author: Sarah Kreidler
%% Please report errors to sarah.kreidler@ucdenver.edu
%%
\def\fileversion{1.0}
\def\filename{ucdenver-proposal}
\def\filedate{2012/09/24}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucdenver-proposal}[\filedate\space\fileversion\space UCD Dissertation Proposal Class by Sarah Kreidler]
\ProcessOptions

%% load report defaults
\LoadClass[12pt]{report}

%% required packages
\RequirePackage{setspace,savesym,amsmath,graphicx,color,hyperref,geometry,fancyhdr,extramarks,lastpage,chngpage}
\RequirePackage[T1]{fontenc}

%%
%% The following preamble elements are required to properly create
%% the title page
%%
%% definitions from calling document
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\committeeChair}[1]{\def\@committeeChair{#1}}
\newcommand{\committeeMembers}[1]{\def\@committeeMembers{#1}}

%% Formatting for title page
\renewcommand{\maketitle}{
\vspace*{\fill}
\begin{center}
  {\LARGE\bf\@title} \\[0.5in]
  by \\[0.25in] 
  \@author \\[0.25in] 
  \@date \\
  \vskip 12em%
  \@committeeChair, Chair \\
  \@advisor, Advisor \\
  \@committeeMembers \\[0.5in]
  A dissertation proposal submitted in partial fullfillment
  of the requirements for the degree of 
  Doctor of Philosophy. \\
  Department of Biostatistics and Informatics \\
  University of Colorado Denver
\end{center} 
\vspace*{\fill}
}

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

%% table of contents and figures
\newcommand{\ucdtocchapterlabel}{CHAPTER}
\newcommand{\ucdtocheader}[1]{\newpage%
  \pdfbookmark[0]{\contentsname}{contents}
  {\begin{center}#1\end{center}
  \ucdtocchapterlabel
  }%

}
\renewcommand\contentsname{Table of Contents}
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \ucdtocheader{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}

%% bibliography
\bibliographystyle{ucdDissertation}




%% setup the document
\AtBeginDocument{
  \begin{titlepage}
  \maketitle
  \end{titlepage}
  \doublespacing
  \tableofcontents
  \newpage

}
%% set margins
\geometry{verbose,tmargin=1in,bmargin=1in,lmargin=1in,rmargin=1in}

%% we override the abstract command to avoid a new page
\renewenvironment{abstract}{%
    \small
    \begin{center}%
      {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
    \end{center}%
    \quotation
}

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

\newcounter {chapternn}
\renewcommand \thechapternn {\@arabic\c@chapternn}
% chapter
\renewcommand \thechapter {\@Roman\c@chapter}
\newcommand{\ucdchapter}[2][default]{
  \newpage%
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\thechapter\space #1}
  {\begin{center}\textbf{CHAPTER \thechapter \\ #2}\end{center}} \nopagebreak
  \vskip \postMskip \nopagebreak
  }
\newcommand{\ucdchapternn}[1]{\newpage%
  \refstepcounter{chapternn}% -- required to make pdf bookmarks work
  \addcontentsline{toc}{chapter}{#1}
  {\begin{center}\textbf{#1}\end{center}} \nopagebreak
  \vskip \postMskip \nopagebreak
}


% part
\newcommand{\ucdpart}[2][default]{
  \newpage%
  \refstepcounter{part}%
  \addcontentsline{toc}{part}{Part \thepart\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\Huge Part \thepart\space #2}} \nopagebreak
  \vskip \postMskip \nopagebreak
  }
\newcommand{\ucdpartnn}[1]{\newpage%
  \addcontentsline{toc}{part}{#1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\Huge #1}} \nopagebreak
  \vskip \postMskip \nopagebreak}

% section
\newcommand{\ucdsec}[2][default]{
  \vskip \preXLskip%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\thesection\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\Large \thesection\space #2}} \nopagebreak
  \vskip \postMskip \nopagebreak
  }
\newcommand{\ucdsecnn}[1]{\vskip \preXLskip%
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\Large #1}} \nopagebreak
  \vskip \postMskip \nopagebreak}

% subsection
\newcommand{\ucdsubsec}[2][default]{\vskip \preMskip%
  \refstepcounter{subsection}%
  \addcontentsline{toc}{subsection}{\thesubsection\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\large \thesubsection\space #2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\ucdsubsecnn}[1]{\vskip \preMskip%
  {\@afterindentfalse\@afterheading\singlespacing\textbf{\large #1}} \nopagebreak
  \vskip \postSskip \nopagebreak}

% subsubsection
\newcommand{\ucdsubsubsec}[2][default]{\vskip \preSskip%
  \refstepcounter{subsubsection}%
  \addcontentsline{toc}{subsubsection}{\thesubsubsection\space #1}
  {\@afterindentfalse\@afterheading\singlespacing\normalsize\textbf{\thesubsubsection\space #2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\ucdsubsubsecnn}[1]{\vskip \preSskip%
  {\@afterindentfalse\@afterheading\singlespacing{\normalsize\textbf #1}} \nopagebreak
  \vskip \postSskip \nopagebreak}
  
\renewcommand{\chapter}{\secdef \ucdchapter \ucdchapternn}
\renewcommand{\part}{\secdef \ucdpart \ucdpartnn}
\renewcommand{\section}{\secdef \ucdsec \ucdsecnn}
\renewcommand{\subsection}{\secdef \ucdsubsec \ucdsubsecnn}
\renewcommand{\subsubsection}{\secdef \ucdsubsubsec \ucdsubsubsecnn}



%%
%% End of file `ucdenver-proposal.cls'.
