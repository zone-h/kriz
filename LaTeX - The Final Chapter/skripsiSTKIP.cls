%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Skripsi STKIP
% Version 1.4 (25/01/17)
% di sesuaikan dari Masters/Doctoral Thesis  
% Class File
% Version 1.5 (22/11/16)
%
% This class has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Vel (vel@latextemplates.com)
% Johannes Böttcher
%
% Notes:
% 1) This class file defines the structure and layout of the template file (main.tex).
% 2) It has been written in such a way that under most circumstances you should not need
% to edit it; updating it to a newer version will be harder. If you do make changes, please change the name of
% the file and add comments to make your changes more visible.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{skripsiSTKIP}
\ProvidesClass{\classname}[2016/12/26 v1.0 LaTeXTemplates.com]
\providecommand{\baseclass}{book}
\RequirePackage{widetable}
\RequirePackage{indentfirst}
\RequirePackage[bahasai]{babel}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}

\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass{\baseclass}

%\makeatletter
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\bfseries\fontfamily{pnc}\selectfont}}% from \Large
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\fontfamily{pnc}\selectfont}}
%                                     {\normalfont\Large\bfseries}}% from \large
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\fontfamily{pnc}\selectfont}}
%                                     {\normalfont\large\bfseries}}% from \normalsize
%\makeatother


%  Simple interface for the user  to customize the chapter titles 
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{-10pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{10pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
%\ProvideDocumentCommand{\chapterfont}{}{\huge\bfseries}
\ProvideDocumentCommand{\chapterfont}{}{
  \scshape\Large\bfseries\centering}
%  \fontsize{20}{24}\fontfamily{pnc}\selectfont\centering}
%  \fontsize{28}{30}\fontfamily{pzc}\selectfont\centering}
\ProvideDocumentCommand{\chapterprefixfont}{}{\LARGE\bfseries}

\newcommand{\fancyboxed}[2][white]{      %white is default background
  %\begin{equation}
    \tikz \node at(0,0) [shape=rectangle,rounded corners=2mm,draw=#1,thick,text width=\linewidth,fill=#1,anchor=west] { #2};
%\end{equation}
  }
\RequirePackage{marginnote}
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\ifbool{chapteroneline}{%
			\chapterfont \mdtChapapp\thechapter\autodot\enspace
		}{%
%			\chapterprefixfont \@chapapp\space \thechapter
%			\par\nobreak
%			\chapterinbetweenskip
%\chapterfont \thechapter\vspace{5mm}
%\begin{tabular}[t]{@{\color{gray75}\vrule width 2pt}>{\hsp}c}
\begin{minipage}[b]{\textwidth}
  \chapterfont #1
\end{minipage}
%\marginnote{\fancyboxed[blue]{\chapterfont\thechapter}}
\marginnote{
\fancyboxed[blue]{\textcolor{white}{\chapterfont\thechapter}}
}[-20mm]
		}%
		\fi
		\fi
		\interlinepenalty\@M%
%		\chapterfont #1\par\nobreak
		\chapterbelowskip
\thispagestyle{halamanJudul}
	}
}
\def\@makeschapterhead#1{%
	\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
}


% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{\centering #3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 


\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

\ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
	\patchcmd{\tableofcontents}{\@starttoc{toc}%
}{%
	\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}


%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage{babel} % Required for automatically changing names of document elements to languages besides english

\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{setspace} % Required for changing line spacing

\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)

\RequirePackage{siunitx} % Required for \SI commands
\RequirePackage{fouriernc}
%\RequirePackage[sfdefault]{FiraSans}
\RequirePackage{widetable}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{filecontents}
\RequirePackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules
\RequirePackage{pdfpages}
\RequirePackage{lipsum}
\RequirePackage{caption} % Required for customising the captions
%\captionsetup{justification=centerlast,font=small,labelfont=sc,margin=50pt}
\DeclareCaptionFont{xipt}{\fontfamily{fvs}\selectfont\footnotesize} %added agus 20161202
\usepackage[font=xipt,labelfont=bf,justification=centerlast]{caption}




%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

\DeclareDocumentCommand{\thesistitle} { o m }{
	\IfBooleanTF{#1} {\DeclareDocumentCommand{\shorttitle}{ }{#1}
	{\DeclareDocumentCommand{\shorttitle}{}{#2}}}
	\DeclareDocumentCommand{\@title}{ }{#2}
	\DeclareDocumentCommand{\ttitle}{ }{#2}
}
\DeclareDocumentCommand { \penulis     } { m } { \DeclareDocumentCommand    { \penulisTulis } { } {#1}
\DeclareDocumentCommand { \@penulis    } {   } {#1}   }
\NewDocumentCommand     { \nim } { m } { \DeclareDocumentCommand { \nimTulis       } { } {#1}  }
\NewDocumentCommand     { \nikKaProdi } { m } { \DeclareDocumentCommand { \nikKaProdiTulis       } { } {#1}  }
\NewDocumentCommand     { \nikPembimbingPertama } { m } { \DeclareDocumentCommand { \nikPembimbingPertamaTulis       } { } {#1}  }
\NewDocumentCommand     { \nikPembimbingKedua } { m } { \DeclareDocumentCommand { \nikPembimbingKeduaTulis       } { } {#1}  }
\NewDocumentCommand     { \pembimbingPertama } { m } { \DeclareDocumentCommand { \pembimbingPertamaTulis       } { } {#1}  }
\NewDocumentCommand     { \pembimbingKedua } { m } { \DeclareDocumentCommand { \pembimbingKeduaTulis       } { } {#1}  }

\NewDocumentCommand     { \nikPengujiPertama } { m } { \DeclareDocumentCommand { \nikPengujiPertamaTulis       } { } {#1}  }
\NewDocumentCommand     { \nikPengujiKedua } { m } { \DeclareDocumentCommand { \nikPengujiKeduaTulis       } { } {#1}  }
\NewDocumentCommand     { \nikPengujiKetiga } { m } { \DeclareDocumentCommand { \nikPengujiKetigaTulis       } { } {#1}  }
\NewDocumentCommand     { \nikPengujiKeempat } { m } { \DeclareDocumentCommand { \nikPengujiKeempatTulis       } { } {#1}  }

\NewDocumentCommand     { \pengujiPertama } { m } { \DeclareDocumentCommand { \pengujiPertamaTulis       } { } {#1}  }
\NewDocumentCommand     { \pengujiKedua } { m } { \DeclareDocumentCommand { \pengujiKeduaTulis       } { } {#1}  }
\NewDocumentCommand     { \pengujiKetiga } { m } { \DeclareDocumentCommand { \pengujiKetigaTulis       } { } {#1}  }
\NewDocumentCommand     { \pengujiKeempat } { m } { \DeclareDocumentCommand { \pengujiKeempatTulis       } { } {#1}  }


\NewDocumentCommand     { \kaProdi } { m } { \DeclareDocumentCommand { \kaProdiTulis       } { } {#1}  }
\NewDocumentCommand     { \examiner   } { m } { \DeclareDocumentCommand { \examname      } { } {#1}  }
\NewDocumentCommand     { \degree     } { m } { \DeclareDocumentCommand { \degreename    } { } {#1}  }
\NewDocumentCommand     { \addresses  } { m } { \DeclareDocumentCommand { \addressname   } { } {#1}  }
\NewDocumentCommand     { \institusi } { m } { \DeclareDocumentCommand { \institusiTulis      } { } {#1}  }
\NewDocumentCommand     { \department } { m } { \DeclareDocumentCommand { \deptname      } { } {#1}  }
\NewDocumentCommand     { \group      } { m } { \DeclareDocumentCommand { \groupname     } { } {#1}  }
\NewDocumentCommand     { \faculty    } { m } { \DeclareDocumentCommand { \facname       } { } {#1}  }
\NewDocumentCommand     { \prodi    } { m } { \DeclareDocumentCommand { \prodiTulis   } { } {#1}  }
\NewDocumentCommand     { \kataKunci   } { m } { \DeclareDocumentCommand { \kataKunciTulis  } { } {#1}  }
\NewDocumentCommand     { \tahun   } { m } { \DeclareDocumentCommand { \tahunTulis  } { } {#1}  }%added - purwanto 2016-12-25
\NewDocumentCommand     { \bulan   } { m } { \DeclareDocumentCommand { \bulanTulis  } { } {#1}  }%added - purwanto 2016-12-25
\NewDocumentCommand     { \tanggal   } { m } { \DeclareDocumentCommand { \tanggalTulis  } { } {#1}  }%added - purwanto 2016-12-25
\NewDocumentCommand     { \hari   } { m } { \DeclareDocumentCommand { \hariTulis  } { } {#1}  }%added - purwanto 2016-12-25

\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\vspace*{-8mm}\rule{\linewidth}{.6pt}\vspace{2mm}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\setcounter{tocdepth}{3} % The depth to which the document sections are printed to the table of contents
\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------

\usepackage{xcolor} % Required for specifying custom colours

\colorlet{mdtRed}{red!50!black}

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\RequirePackage{geometry}
\geometry{
	paper=a5paper, % Change to letterpaper for US letter
	hmargin=1.75cm, % Inner margin
%	outer=3.8cm, % Outer margin
	bindingoffset=0.5cm, % Binding offset
	top=2cm, % Top margin
	bottom=1.75cm, % Bottom margin
	%showframe, % Uncomment to show how the type block is set on the page
}
%\geometry{
%	headheight=4ex,
%	includehead,
%	includefoot
%}

\raggedbottom

%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ihead{\headmark}% Inner header
	\ohead[\pagemark]{\pagemark}% Outer header
}
\ifoot{}% Inner footer
\ofoot{}% Outer footer
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\penulisTulis]{\shorttitle/\penulisTulis}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined 
	using package `scrlayer-scrpage', please consult the\MessageBreak 
KOMA-script documentation for details.}]{fancyhdr}

\providepairofpagestyles{halamanJudul}{%
%	\clearpairofpagestyles%
%	\automark[chapter]{chapter}
%	\ihead{}% Inner header
%	\ohead{}% Outer header
\addtokomafont{headsepline}{\color{white}}
\cfoot{\pagemark}
}
%\ifoot{}% Inner footer
%\ofoot{}% Outer footer
%\pagestyle{thesisSimple}



\NewDocumentCommand{\blank@p@gestyle}{}{empty}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\DeclareDocumentCommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\DeclareDocumentCommand{\blank@p@gestyle}{}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\abbrevname}{List of Abbreviations}
\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\abbrevname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1} % Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------

\DeclareDocumentCommand{\abstractauthorfont}{}{}
\DeclareDocumentCommand{\abstracttitlefont}{}{}
\newcommand{\byname}{by}
\newcommand{\abstractname}{Abstrak}
\providecaptionname{german,ngerman,austrian,naustrian}{\byname}{von}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\byname}{by}
\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{abstract}{ O{} }{%
		\addchap*{\abstractname}%
		{\chapteralign\normalsize\abstractauthorfont \penulisTulis \par} % Author name
		\vspace{\baselineskip}
		{\chapteralign\parbox{.7\linewidth}{\chapteralign\normalsize\itshape\abstracttitlefont\@title}\par}% Thesis title
		\bigskip\noindent\ignorespaces
	}%
	{}%end alt-abstract
}{%
%	\DeclareDocumentEnvironment{abstract}{ O{\null\vfill} }{
	\DeclareDocumentEnvironment{abstract}{ O{} }{
		\checktoopen
		\tttypeout{\abstractname}
		#1%added to be able to have abstract more than one page long
		\thispagestyle{plain}
%\includegraphics[width=0.25\textwidth]{logoSTKIP-transparent.png} \hfill 
                %{\fontsize{10}{12}\fontfamily{pnc} \bfseries \abstractname \par}\hrule \vspace{4mm}
                \chapter*{\abstractname} \addchaptertocentry{\abstractname}
%{\fontsize{10}{12}\fontfamily{phv} \bfseries \ttitle\par}\vspace{0.4cm} % Thesis title
		\begin{center}
%			{\normalsize \MakeUppercase{\institusiTulis} \par} % University name in capitals
			\bigskip
%			{\huge\textit{\abstractname} \par}
%			\bigskip
%			{\normalsize \facname \par} % Faculty name
%			{\normalsize \deptname \par} % Department name
%			\bigskip
%			{\normalsize \degreename\par} % Degree name
%			\bigskip
			{\normalsize\bfseries \@title \par} % Thesis title
			\medskip
%			{\normalsize \byname{} \penulisTulis \par} % Author name
			    {\normalsize \penulisTulis{} (\nimTulis)\\
                              \institusiTulis \par} % Author name
			\bigskip
		\end{center}
	}
	{
		\vfill\null
	}
}

\DeclareDocumentEnvironment{extraAbstract}{ O{\null\vfill} }{
	\checktoopen
	\tttypeout{\abstractname}
	#1%added to be able to have abstract more than one page long
	\thispagestyle{empty}
	\begin{center}
		{\normalsize \MakeUppercase{\institusiTulis} \par} % University name in capitals
		\bigskip
		{\huge\textit{\abstractname} \par}
		\bigskip
		{\normalsize \facname \par} % Faculty name
		{\normalsize \deptname \par} % Department name
		\bigskip
		{\normalsize \degreename\par} % Degree name
		\bigskip
		{\normalsize\bfseries \@title \par} % Thesis title
		\medskip
		{\normalsize \byname{} \penulisTulis \par} % Author name
		\bigskip
	\end{center}
}
{
	\vfill\null
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\usepackage{xcolor}
\colorlet{mdtRed}{red!50!black}
\newcommand{\apresiasiTulis}{Kata Pengantar}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish} {\apresiasiTulis}{Kata Pengantar} % Acknowledgement text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\apresiasiTulis}{Danksagung} % Acknowledgement text for Germanic countries

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{apresiasi}{}{%
		\tttypeout{\apresiasiTulis}
		\addchap*{\apresiasiTulis}
	}
}
{
	\DeclareDocumentEnvironment{apresiasi}{}{%
		\checktoopen
		\tttypeout{\apresiasiTulis}
		\thispagestyle{plain}
		\begin{center}{\huge\textit{\apresiasiTulis}\par}\end{center}
	}
	{
		\vfil\vfil\null
	}
}

%----------------------------------------------------------------------------------------
%	DECLARATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\authorshipname}{Pernyataan Keaslian Skripsi}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\authorshipname}{Pernyataan Keaslian Skripsi} % Declaration of Authorship text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\authorshipname}{Eidesstattliche Erkl\"arung} % Declaration of Authorship text for Germanic countries

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{declaration}{}{
		\addchap*{\authorshipname}
		}{}%
}{
	\DeclareDocumentEnvironment{declaration}{}{
		\checktoopen
		\tttypeout{\authorshipname}
%		\thispagestyle{plain}
%		\null\vfil
%		{%\includegraphics[width=0.25\textwidth]{logoSTKIP-transparent.png} 
                %\hfill \fontsize{10}{12}\fontfamily{pnc} \bfseries\authorshipname\par\hrule\vspace{10pt}}
                %                {\chapter*{\authorshipname}}
                \addchap*{\authorshipname}\addchaptertocentry{\authorshipname}
%                \chapter*{\authorshipname}
	}{}
}

%----------------------------------------------------------------------------------------
%HALAMAN JUDUL
%----------------------------------------------------------------------------------------

%\newcommand{\halamanJudulTulis}{Halaman Judul}
%	\DeclareDocumentEnvironment{halamanJudul}{}{
%		\checktoopen
%		\tttypeout{\pengesahanname}
%		\thispagestyle{plain}
%		\null\vfil
%                \centering
 \newcommand{\halamanJudul}{               {
% \addchap*{\includegraphics[width=0.25\textwidth]{logoSTKIP-transparent.png} \hfill \pengesahanname}\addchaptertocentry{\pengesahanname}  \HRule
}
\begin{titlepage}
\addchaptertocentry{Halaman Judul}
\begin{center}

{\Large\bfseries%\fontfamily{pnc}  
\scshape\ttitle\par}\vspace{0.4cm} % Thesis title
\vfill
{\Large \penulisTulis \\[2mm] \nimTulis }\\
 \vspace{0.4cm}
\vfill

{\large \fontfamily{pnc} \selectfont Skripsi sebagai salah satu syarat kelulusan\\[1.5mm] \degreename\\ % University requirement text
%\textit{bidang}\\ \prodiTulis}\\[2cm] % Research group name and department name
}
\vfill

\includegraphics[width=0.3\textwidth]{logoSTKIP-transparent.png}\\ 
\vfill
{\large \prodiTulis}\\ [2mm]
{\large \fontfamily{pnc} \selectfont  \institusiTulis}\\  [2mm]
{%\fontsize{10}{12}
  \large \fontfamily{pnc}\selectfont  \addressname}\\  [2mm]
{\large \fontfamily{pnc}\selectfont  \tahunTulis}

\end{center}
\end{titlepage}

	}{}

%----------------------------------------------------------------------------------------
%	PENGESAHAN PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\pengesahanname}{Pengesahan}
	\DeclareDocumentEnvironment{pengesahan}{}{
%		\checktoopen
%		\tttypeout{\pengesahanname}
%		\thispagestyle{plain}
%		\null\vfil
                \centering
                {
 \addchap*{\includegraphics[width=0.25\textwidth]{logoSTKIP-transparent.png} \hfill \pengesahanname}\addchaptertocentry{\pengesahanname}  \HRule
}

	}{}

%----------------------------------------------------------------------------------------
%	PERSETUJUAN PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\persetujuanname}{Persetujuan Penguji}
	\DeclareDocumentEnvironment{persetujuan}{}{
%		\checktoopen
%		\tttypeout{\pengesahanname}
%		\thispagestyle{plain}
%		\null\vfil
%                \centering
                {
 \addchap*{\includegraphics[width=0.2\textwidth]{logoSTKIP-transparent.png} \hfill \persetujuanname}\addchaptertocentry{\persetujuanname}  \HRule
}

	}{}


%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\ifbool{consistentlayout}{
	\DeclareDocumentCommand{\dedicatory}{
		m O{\vspace*{.7\textheight} }  }{
			\checktoopen\tttypeout{Dedicatory}
			\markboth{}{}
			#2
			{\hfill\parbox{.4\textwidth}{\flushright#1\par}}
		}
}{
	\newcommand\dedicatory[1]{
		\checktoopen
		\tttypeout{Dedicatory}
		\null\vfil
		\thispagestyle{plain}
		\begin{center}{\Large\slshape #1}\end{center}
		\vfil\null
	}
}


%----------------------------------------------------------------------------------------
%	PHYSICAL CONSTANTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\constantsname}{Physical Constants}
\providecaptionname{english,british,american}{\constantsname}{Physical Constants}
\providecaptionname{ngerman,german,austrian,naustrian}{\constantsname}{Physikalische Konstanten}

\NewDocumentEnvironment{constants}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\constantsname}}{\addchap*{\constantsname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1} % Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{ngerman,german,austrian,naustrian}{\symbolsname}{Symbolverzeichnis}

\NewDocumentEnvironment{symbols}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\symbolsname}}{\addchap*{\symbolsname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1} % Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{% If the nohyperref class option has not been specified
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
colorlinks=true, % Set to false to disable coloring links
citecolor=magenta, % The color of citations
linkcolor=blue!20!black, % The color of references to document elements (sections, figures, etc)
urlcolor=red!10!black, % The color of hyperlinks (URLs)
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{% If there is an explicit linebreak in a section heading (or anything printed to the pdf-bookmarks), it is replaced by a space
	\let\\\space%
}
	}
}{%nothing
}

%----------------------------------------------------------------------------------------

\endinput
% lazyLizardTracer
