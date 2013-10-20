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
%% !!!INCOMPLETE!!! Still need to add prologue pages,
%% numbering, etc.
%%
\def\fileversion{1.0}
\def\filename{ucdenver-proposal}
\def\filedate{2012/09/24}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucdenver-proposal}[\filedate\space\fileversion\space UCD Dissertation Proposal Class by Sarah Kreidler]
\ProcessOptions

%% load article defaults
\LoadClass[11pt]{article}

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
\begin{center}
\vspace{24pt}
  {\LARGE\bf\@title} \\[0.5in]
  by \\[0.5in] 
  \@author \\[0.5in] 
  \@date \\
  \vfill
  \@committeeChair, Chair \\
  \@advisor, Advisor \\
  \@committeeMembers \\[1in]
  A dissertation proposal submitted in partial fullfillment
  of the requirements for the degree of 
  Doctor of Philosophy. \\
  Department of Biostatistics and Informatics \\
  University of Colorado Denver
\end{center} 
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

%% bibliography
\usepackage{apacite}
\bibliographystyle{apacite}

%% setup the document
\AtBeginDocument{
  \begin{titlepage}
  \maketitle
  \end{titlepage}
  \tableofcontents
  \newpage
  \doublespacing
}
%% set margins
\geometry{verbose,tmargin=1in,bmargin=1in,lmargin=1in,rmargin=1in}

%%
%% End of file `ucdenver-proposal.cls'.
