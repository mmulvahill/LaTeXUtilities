%%
%% The `ucdenver-dissertation.cls' is used for formatting a PhD thesis 
%% for the Department of Biostatistics & Informatics,
%% University of Colorado Denver.
%% It may be applicable to other students in the Graduate School
%% on Anschutz Medical Campus, but please check the
%% Graduate School rules prior to using.
%%
%% Author: Sarah Kreidler
%%
%%
%% Package 'ucdenver-dissertation' to use with LaTeX2e 
%% License: GPL-2
%% Copyright: (C) University of Colorado Denver
%% Author: Sarah Kreidler
%% Please report errors to sarah.kreidler@ucdenver.edu
%%
\def\fileversion{1.0}
\def\filename{ucdenver-dissertation}
\def\filedate{2012/09/24}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucdenver-dissertation}[\filedate\space\fileversion\space UCD Dissertation dissertation Class by Sarah Kreidler]
\ProcessOptions

%% load report defaults
\LoadClass[12pt]{report}

%% required packages
\RequirePackage{setspace,savesym,amsmath,graphicx,color,hyperref,geometry,extramarks,lastpage,chngpage}
\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{appendix}

%%
%% The following preamble elements are required to properly create
%% the title page
%%
%% definitions from calling document
\newcommand{\authorLast}[1]{\def\@authorLast{#1}}
\newcommand{\authorFirst}[1]{\def\@authorFirst{#1}}
\newcommand{\authorMiddle}[1]{\def\@authorMiddle{#1}}
\newcommand{\education}[1]{\def\@education{#1}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\advisorTitle}[1]{\def\@advisorTitle{#1}}
\newcommand{\committeeChair}[1]{\def\@committeeChair{#1}}
\newcommand{\committeeMembers}[1]{\def\@committeeMembers{#1}}
\newcommand{\defenseDate}[1]{\def\@defenseDate{#1}}
\newcommand{\acknowledgements}[1]{\def\@acknowledgements{#1}}
\newcommand{\preface}[1]{\def\@preface{#1}}


%% hack to make prevent page numbers from restarting in TOC
\newcounter{fmpage}
\newcounter{theorem}
\newcounter{lemma}

%% set margins
\geometry{verbose,tmargin=1in,bmargin=1in,lmargin=1in,rmargin=1in}

\pagestyle{fancy} %
\fancyhf{} %
\rfoot{\thepage}                  %
\renewcommand{\headrulewidth}{0pt} %


%% setup the document
\AtBeginDocument{
\pagenumbering{roman}
  \begin{titlepage}
  \maketitle
  \end{titlepage}
  \addtocounter{page}{1}
  \makecommitteepage
  \makeprefacepage
  \makeacknowledgementspage
  \doublespacing
  \tableofcontents
  \newpage
  \listoffigures
  \newpage
  \listoftables
  \newpage
  \pagenumbering{arabic}
  \setcounter{page}{1}

}


%% Format the title page
\renewcommand{\maketitle}{
\vspace*{\fill}
\begin{center}
  {\LARGE\bf\@title} \\[0.5in]
  by \\
  \@authorFirst{}\ \@authorMiddle{}\ \@authorLast{} \\
  \@education \\[3in] 
  A thesis submitted to the \\
  Faculty of the Graduate School of the \\
  University of Colorado, Denver in partial fulfillment \\
  of the requirements for the degree of \\
  \@program. \\
  \@date \\
\end{center} 
\vspace*{\fill}
  
}

%% formatting committee page
\newcommand{\makecommitteepage}{
  \newpage
  \vspace*{\fill}
  \begin{center}
    This thesis for the degree of 
    \@program\ by \\
    \@authorFirst\ \@authorMiddle\ \@authorLast \\
    is being submitted for approval \\
    by \\[3in]
    \@committeeChair, Chair \\
    \@advisor, Advisor \\
    \@committeeMembers \\[1in]
  \end{center}
  \begin{flushright}
    \@defenseDate
  \end{flushright}
  \vspace*{\fill}
  \setcounter{fmpage}{\value{page}}%
  \addtocounter{fmpage}{1}%
}

%% formatting committee page
\newcommand{\makeprefacepage}{
  \newpage
  \begin{flushleft}
  \@authorLast{}, \@authorFirst{} \@authorMiddle{} (\@program) \\
  \@title \\
  Thesis directed by \@advisorTitle{} \@advisor
  \end{flushleft}
  \medskip
  \begin{center}
  {\bf PREFACE}\\
  \end{center}
  \@preface

  \setcounter{fmpage}{\value{page}}%
  \addtocounter{fmpage}{1}%
}

%% formatting committee page
\newcommand{\makeacknowledgementspage}{
  \newpage
  \begin{center}
  {\bf ACKNOWLEDGEMENTS} \\
  \end{center}
  \@acknowledgements

  \setcounter{fmpage}{\value{page}}%
  \addtocounter{fmpage}{1}%
}


%% Theorems, lemmas, and proofs

%% theorems
\newenvironment{theorem}{%
    \setcounter{lemma}{1}%
    \refstepcounter{theorem}
    \medskip
    \noindent{\emph{Theorem \thetheorem}.}%
}{}
\renewcommand*\thetheorem{\thesection.\arabic{theorem}}

\newenvironment{problem}{\begin{framed}\begin{bfseries}}{\end{bfseries}\end{framed}\vspace{11pt}}

%% Proofs
\newenvironment{proof}{%
    \medskip
    \noindent\emph{Proof}\vspace{\z@}
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
    \setcounter{page}{\value{fmpage}}%
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



%% we override the abstract command to avoid a new page
\renewenvironment{abstract}{%
    \small
    \begin{center}%
      {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
    \end{center}%
    \quotation
}

%% appendix




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
  {\begin{center}\textbf{\MakeUppercase\chaptername\ \thechapter \\ #2}\end{center}} \nopagebreak
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

% appendix chapters
\renewcommand\appendixname{APPENDIX}

%%
%% End of file `ucdenver-dissertation.cls'.
