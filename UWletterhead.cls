\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UWletterhead}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages needed to process options and helpful macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{ifthen}
\RequirePackage{zref-totpages}

% A macro that outputs #2 if the (!!!) macro given as the parameter #1
% produces empty output.
\newcommand{\UWifempty}[2]{\ifdefempty{#1}{#2}{}}

% A macro that outputs #2 if the (!!!) macro given as the parameter #1
% produces non-empty output.
\newcommand{\UWifnempty}[2]{\ifdefempty{#1}{}{#2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters for processing the class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The default language used by the class. Other possible value (set by the
% class option english) is english.
\newcommand{\UWlanguage}{polski}

% The default font used in the documents. Altough Identification Codebook
% enforces the font Arimo, it is possible to use certain similar fonts
% instead. The reason is compatibility with various LaTeX environments.
% The default one is Droid.
\newcommand{\UWfont}{droid}

% The logo file used at the upper-left corner (including the eagle
% and the text University of Warsaw).
\newcommand{\UWlogo}{UWlogoPL.pdf}

% The logo file used at the upper-right corner (only five letters UW + MIM).
\newcommand{\MIMlogo}{MIMlogo.pdf}

% Names of the faculty, instutite, function, and/or person (can be left
% empty). These names are called `unit names`.
\newcommand{\UWfaculty}{Wydzia{\l} Matematyki, Informatyki i Mechaniki}
\newcommand{\UWinstitute}{}
\newcommand{\UWfunction}{}
\newcommand{\UWperson}{}

% The actual address, phone number, and e-mail address
\newcommand{\UWaddress}{ul. Banacha~2, 02-097 Warszawa, Polska}
\newcommand{\UWphone}{}
\newcommand{\UWemail}{}

% Prefixes, like: 'Address: ', 'Telephone: ', 'E-mail: ', etc
\newcommand{\UWprefAddress}{}
\newcommand{\UWprefPhone}{}
\newcommand{\UWprefEMail}{e-mail: }

% The text of the footer, including hyperrefs
\newcommand{\UWfootText}{
\UWifnempty{\UWaddress}{\UWprefAddress\UWaddress\\}
\UWifnempty{\UWphone}{\UWprefPhone\href{tel:\UWphone}{\UWphone}\\}
\UWifnempty{\UWemail}{\UWprefEMail\href{mailto:\UWemail}{\UWemail}}
}


% The name of the overlap file (if needed). This file will be presented as
% a background for the whole document on each page where \UWheader is
% invoked. If you use one of the templates/... file as \UWoverlap then
% you can verify if the layout produced by UWletterhead alignes with the
% official document.
\newcommand{\UWoverlap}{}

% The distance between the header and the text below it.
\newcommand{\UWheadsep}{10mm}

% By default page numbering is on if and only if the document has more
% than one page.
\newcommand{\UWshowPages}{}

% Default colours, as specified in Identification Codebook.
\definecolor{UWdBlue}{RGB}{0,68,124}
\definecolor{UWlBlue}{RGB}{0,146,206}
\definecolor{UWsBlue}{RGB}{0,23,69}
\definecolor{UWblack}{RGB}{0,0,0}
\definecolor{UWwhite}{RGB}{255,255,255}
\definecolor{UWlGray}{RGB}{177,179,182}
\definecolor{UWdGray}{RGB}{128,130,133}

% Default font size for the body of the text.
\newcommand{\UWfontSize}{12pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Processing actual options of the class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Default option: the language is Polish
\DeclareOption{polski}{
}

% The language is English, it influences the logo file, prefixes, etc
\DeclareOption{english}{
	\renewcommand{\UWlanguage}{english}
	\renewcommand{\UWlogo}{UWlogoEN.pdf}
	\renewcommand{\UWfaculty}
		{Faculty of Mathematics, Informatics and Mechanics}
	\renewcommand{\UWinstitute}{}
	\renewcommand{\UWfunction}{}
	\renewcommand{\UWperson}{}
	
	\renewcommand{\UWaddress}{Banacha~2, 02-097 Warsaw, Poland}
	\renewcommand{\UWphone}{}
	\renewcommand{\UWemail}{}
	
	\renewcommand{\UWprefAddress}{}
	\renewcommand{\UWprefPhone}{}
	\renewcommand{\UWprefEMail}{e-mail: }
}

% Option: the font used is DejaVu
\DeclareOption{dejavu}{
	\renewcommand{\UWfont}{dejavu}
}

% Option: the font used is Arimo
\DeclareOption{arimo}{
	\renewcommand{\UWfont}{arimo}
}

% Default option: the font used is Droid
\DeclareOption{droid}{
	\renewcommand{\UWfont}{droid}
}

% The standard colours are translated into grayscale, for better printing
% quality on mono printers.
\DeclareOption{grayscale}{
	\definecolor{UWdBlue}{RGB}{58,58,58}
	\definecolor{UWlBlue}{RGB}{120,120,120}
	\definecolor{UWsBlue}{RGB}{21,21,21}
}

% The option `autopagenr` forces page numbering to be automatic (default):
% * on if and only if the document has more than one page.
\DeclareOption{autopagenr}{
	\renewcommand{\UWshowPages}{}
}

% The option `pagenr` forces page numbering to be on.
\DeclareOption{pagenr}{
	\renewcommand{\UWshowPages}{1}
}

% The option `nopagenr` forces page numbering to be off.
\DeclareOption{nopagenr}{
	\renewcommand{\UWshowPages}{0}
}


% Options 10pt, 11pt, and 12pt control the size of the main body text
% and are passed to the class 'letter'. The default is 12pt.
\DeclareOption{10pt}{
	\renewcommand{\UWfontSize}{10pt}
}

\DeclareOption{11pt}{
	\renewcommand{\UWfontSize}{11pt}
}

\DeclareOption{12pt}{
	\renewcommand{\UWfontSize}{12pt}
}

\ProcessOptions
\LoadClass[a4paper,\UWfontSize]{letter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Including the remaining packages, initial setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The default font encoding is T1, it should not be modified
\RequirePackage[T1]{fontenc}

% When the chosen language is Polish.
\ifthenelse{\equal{\UWlanguage}{polski}}{
% Include package providing Polish dates etc.
\usepackage{polski}
}{}

% When the chosen font is Arimo.
\ifthenelse{\equal{\UWfont}{arimo}}{
% The font for the whole document is Arimo, as defined in
% Identification Codebook.
\renewcommand*{\rmdefault}{Arimo}
}{}

% When the chosen font is DejaVu.
\ifthenelse{\equal{\UWfont}{dejavu}}{
% The font for the whole document is DejaVu.
\usepackage{DejaVuSansCondensed}
\renewcommand*{\familydefault}{\sfdefault}
}{}

% When the chosen font is Droid.
\ifthenelse{\equal{\UWfont}{droid}}{
% The font for the whole document is Droid.
\usepackage[defaultsans]{droidsans}
\renewcommand*{\familydefault}{\sfdefault}
}{}


\RequirePackage{geometry}

% This is the default geometry. You can change it freely, the constrains
% of the layout would remain satisfied. However, you should stick to the
% following constrains:
% * left > ~55mm makes the faculty, institute, and person move right
% * top > ~45mm makes the faculty, institute, and person move down 
% * bottom < ~25 makes the footnote overlap with the text (depends on the
%   actual height of the footnote, which is variable)
\geometry{
	a4paper,
	top=30mm,
	left=35mm,
	right=35mm,
	bottom=30mm,
	marginparwidth=20mm
}
 
% To prevent the header from floating around, we stick to \raggedbottom
% vertical page layout. It means that the paragraphs are not spread along
% the page and empty vertical space may be left at the bottom of the page.
\raggedbottom

% Remaining packages used by this class:
% 
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{changepage}

\usetikzlibrary{calc}

% The footnotes are achieved using fancyhdr package
\RequirePackage{fancyhdr}

% The pagestyle that produces the expected footnotes is 'plain'
\fancyhf{}
\fancypagestyle{plain}{
	\fancyhead{}
	\fancyfoot{}
	\fancyfoot[R]{\UWfooter}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

% You should not modify the pagestyle (at least now).
\pagestyle{plain}

% This parameter controls linespacing in the body of the document. Changing it
% does not influence the constrains of the layout.
% Example values:
% * 1.0 means single spacing
% * 1.3 corresponds roughly to the one-and-half spacing of standard text
%   processors
\linespread{1.3}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The actual macros that produce headers and footers - positioning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Standard shift of lines between the faculty, institute, and person.
% Equals the linespread overhead (1.3) times 12pt
\newcommand{\UWptshift}{1.3*12pt}

% Total left margin of the document according to the current layout.
\newcommand{\UWleftMargin}{-\oddsidemargin-\hoffset-1in}

% Total top margin of the document according to the current layout.
\newcommand{\UWtopMargin}{1in+\voffset+\topmargin+\headheight+\headsep}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The actual macros that produce headers and footers - elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Shows page number according to the layout defined in Identifiaction Codebook
\newcommand{\UWpageNr}{
	\node[anchor=south east, xshift=-10mm, yshift=10mm]
			at (current page.south east)
			{\thepage};
}

% A macro producing the whole footer of a page.
\newcommand{\UWfooter}{%
% The footer is a tikz picture positioned as an overlay, relatively
% to the dimensions of the current page.
\begin{tikzpicture}[
	inner sep=0pt, 
	outer sep=0pt, 
	align=left,
	remember picture,
	overlay,
	font=\fontsize{8pt}{1em}\selectfont]
	
% The footer has linespread of 1.0.
\linespread{1.0}
	
% The whole footText located approximately at the center, according
% to Identification Codebook layout.
\node[anchor=south west, xshift=56mm, yshift=10mm]
	at (current page.south west)
	{\UWfootText};
	
% If \UWshowPages is empty (i.e. autopagenr option applies) then
% page numbers are shown if and only if the document has more than
% one page then.
\UWifempty{\UWshowPages}{
	\ifthenelse{\equal{\ztotpages}{1}}{}{\UWpageNr}
}
	
% Otherwise, if \UWshowPages is non-empty (i.e. pagenr or nopagenr
% options apply) then the value of \UWshowPages dictates whether
% to show page numbers or not.
\UWifnempty{\UWshowPages}{	
	\ifthenelse{\equal{\UWshowPages}{1}}{\UWpageNr}{}
}
\end{tikzpicture}
}
 
% A macro producing the whole header of a page.
\newcommand{\UWheader}{%
% The header consists of two parts generated separately. The first one is a
% tikz picture positioned as an overlay, relatively to the dimensions of
% the current page, in the upper-left corner. This picture contains the logo,
% i.e. the eagle and the text University of Warsaw. Additionally, in this part
% of the macro we present the overlapping picture if defined.
\begin{tikzpicture}[
	inner sep=0pt,
	outer sep=0pt,
	remember picture,
	overlay]	
  	
% If the overlap picture has been defined then it is shown in
% the following node.
\UWifnempty{\UWoverlap}{
  	\node[anchor=north west,minimum width=\paperwidth]
	  	at (current page.north west)
		{\includegraphics[width=\paperwidth,height=\paperheight]
			{\UWoverlap}};}

% We show the UW logo with the eagle and University of Warsaw text.
\node[anchor=north west, xshift=20mm, yshift=-15mm, align=left]
  	at (current page.north west)
	{\includegraphics[height=35mm, keepaspectratio]{\UWlogo}};

% We show a vertical bar between the logos of UW and of MIM UW.
\coordinate[xshift=115.1mm, yshift=-27mm] (UWsplU)
	at (current page.north west);
\coordinate[xshift=115.1mm, yshift=-39.7mm] (UWsplD)
	at (current page.north west);
\path[draw=UWdGray, line cap=round, line width=0.9pt] (UWsplU) -- (UWsplD);

% We show the MIM UW logo with five letters UW / MIM.
\node[anchor=north east, xshift=176.1mm, yshift=-10.4mm, align=left]
  	at (current page.north west)
	{\includegraphics[height=43.8mm, keepaspectratio]{\MIMlogo}};
\end{tikzpicture}%
%
% The second part is positioned inside the text so that the higher the header
% is, the more it moves the rest of the body text down. This part consists of
% the lines with the faculty, institute, and/or person.
\begin{tikzpicture}[
	inner sep=0pt, 
	outer sep=0pt, 
	minimum size=0pt,
	minimum width=0pt,
	minimum height=0pt,
	align=left, 
	font=\fontsize{12pt}{1em}\selectfont,
	anchor=base west]
	
% The header has linespread of 1.3 (i.e. 1.5 of standard text processors).
\linespread{1.3}
	
% This node ensures that the upper-left corner of the picture is at the
% upper-left corner of the text area where the macro is invoked.
\node at (0,0) {};

% This node ensures that if there are no unit names given then the spacing
% below the header is still appropriate.
\node at (\UWleftMargin+56mm,\UWtopMargin-50mm)	{};  
  
% The coordinate curr will indicate the expected position of the next line.
% It is calculaded in such a way to guarantee fixed position of
% the coordinate, no mater what are the actual margins of the page.
%
% 56mm is the expected xshift of the west anchor of our lines
% 50mm is the expected yshift of the first line
% Since each line can occur or not, we start \UWptshift above
% the expected place, and each produced line will move curr down.
\coordinate (curr)
	at (\UWleftMargin+56mm,\UWtopMargin-53mm+\UWptshift);
  
% If \UWfaculty is given, produce a node with the respective layout,
% and position (curr) below it (preserving the expected spacing).
\UWifnempty{\UWfaculty}{
	\node[text=UWlBlue] (curr)
		at ($(curr.base west)+(0,-\UWptshift)$)
  		{\textbf{\UWfaculty}};
}
  	
% If \UWinstitute is given, produce a node with the respective layout,
% and position curr below it (preserving the expected spacing).
\UWifnempty{\UWinstitute}{
	\node[text=UWlBlue] (curr)
		at ($(curr.base west)+(0,-\UWptshift)$)
		{\UWinstitute};
}
  	
% If \UWfunction is given, produce a node with the respective layout,
% and position curr below it (preserving the expected spacing).
\UWifnempty{\UWfunction}{
	\node[text=UWdGray] (curr)
		at ($(curr.base west)+(0,-\UWptshift)$)
		{\textbf{\UWfunction}};
}
  	
% If \UWperson is given, produce a node with the respective layout,
% and position curr below it (preserving the expected spacing).
\UWifnempty{\UWperson}{
	\node[text=UWdGray] (curr)
		at ($(curr.base west)+(0,-\UWptshift)$)
		{\UWperson};
}

% Finally we put two \vspaces, the first one removes the standard space
% below tikzpicture that is put there by Latex, the second one
% adds space defined by \UWheadsep.
\end{tikzpicture}\vspace{-6.5mm}\vspace{\UWheadsep}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional macros for the standard elements of the document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Produces a date line.
\newcommand{\UWdate}[1]{
	\hfill {#1}
	\vspace*{1.5cm}
}

% Produces an addressee section above the text that is aligned left
% but shifted right. The first (optional) argument defines the left space
% before the content of the paragraph.
\newcommand{\UWaddressee}[2][0.5\textwidth]{
	\begin{adjustwidth}{#1}{0cm}
	#2
	\end{adjustwidth}
	\vspace*{1.5cm}
}

% Produces a signature under the text that is aligned left but shifted right.
% The first (optional) argument defines the left space
% before the content of the paragraph.
\newcommand{\UWsignature}[2][0.5\textwidth]{
	\vspace{4mm}
	\begin{adjustwidth}{#1}{0cm}
	#2
	\end{adjustwidth}
	\vspace{4mm}
}


