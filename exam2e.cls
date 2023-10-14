\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{../../exam2e}[v0.0 erster (nullter) Versuch]

\RequirePackage{booktabs}

%%
% Die zugrunde liegende Klasse wird geladen:
\LoadClass[a4paper,12pt,addpoints,fleqn]{exam}

% Die SCHRIFTGRÖßE kann über die Einstellung oben gewählt werden: 10pt, 11pt, 12pt alles kein Problem.
% Die Option ''addpoints'' lässt die documentclass die Punkte zusammenrechnen. ''fleqn'' macht die Gleichungen linksbündig. 


%% 
% Pakete einladen:
\RequirePackage{siunitx}

%%
% Wir wählen eine serifenlose Schriftart:
\RequirePackage{cmbright}
% Die folgenden beiden Zeilen beheben einen Fehler, vgl. hier:
% https://tex.stackexchange.com/questions/629019/siunitx-in-apperent-conflict-with-cmbright/629022#629022
\DeclareMathAlphabet{\mathsf}{OT1}{\familydefault}{m}{n}
\AtBeginDocument{\sisetup{unit-font-command = \mathrm}}












%%%%%%%% %%     %%    %%%    %%     %% 
%%        %%   %%    %% %%   %%%   %%% 
%%         %% %%    %%   %%  %%%% %%%% 
%%%%%%      %%%    %%     %% %% %%% %% 
%%         %% %%   %%%%%%%%% %%     %% 
%%        %%   %%  %%     %% %%     %% 
%%%%%%%% %%     %% %%     %% %%     %% 

%% EXAMDOC-Spezifisches ------------

%%
% Einstellungen der ''exam'' documentclass

\renewcommand\partlabel{\hbox to \labelwidth{\thequestion.\arabic{partno}\hfil}}% macht das label linksbündig und druckt 1.1
\renewcommand\subpartlabel{(\alph{subpart})}% (a)
\renewcommand\subsubpartlabel{\roman{subsubpart}.}% i. 



%%
% Einrückungen links beim der 'exam' documentclass einstellen

%\parindent=0pt
\setlength{\parindent}{0pt}

%\renewcommand{\partshook}{\setlength{\leftmargin}{1.5cm}}
\renewcommand{\questionshook}{%
  \setlength{\leftmargin}{0pt}%
  \setlength{\labelwidth}{-\labelsep}%
}%end questionshook


%%
% Einstellungen für Karos und Linien zum Schreiben von Antworten
% Größe und Linienstärke der Kästchen:
\setlength{\gridsize}{5mm}%
\setlength{\gridlinewidth}{.05pt}%
%
% Zeilenhöhe von Linien:
\setlength\linefillheight{0.9cm}











 %%%%%  %%%%%%%  %%%%%%%     %%     %%%%%  %%    %% %%%%%%%
%%   %% %%    %% %%    %%   %%%%   %%   %% %%    %% %%     
%%      %%    %% %%    %%  %%  %%  %%      %%    %% %%     
 %%%%%  %%%%%%%  %%%%%%%  %%    %% %%      %%%%%%%% %%%%%  
     %% %%       %%  %%   %%%%%%%% %%      %%    %% %%     
%%   %% %%       %%   %%  %%    %% %%   %% %%    %% %%     
 %%%%%  %%       %%    %% %%    %%  %%%%%  %%    %% %%%%%%%


%% EXAMDOC-Spracheinstellungen ------------

% Punkte alias Bewertungseinheiten:
\pointpoints{Punkt}{Punkte}
\pointsinrightmargin% Punkte werden rechts gedruckt
\marginpointname{}% ?

% Wörter für die horizontale Angabe der Bewertungseinheiten:
\hqword{Aufgabe}
\hpword{Punkte}
\htword{Summe}
\hsword{erzielt}

%%
% Wörter für Lösungen:
\renewcommand\solutiontitle{\noindent\textbf{Lösung:}\par\noindent}

%%
% Layout einer Aufgabe, das sog. question format :
\qformat{{\bfseries Aufgabe \thequestion\  von \numquestions \hfill} 
(\totalpoints\ \points)\hfill\\}












%%    %%  %%%%%%%  %%%%%%%%  %%%%%%%% 
%%   %%  %%     %% %%     %% %%       
%%  %%   %%     %% %%     %% %%       
%%%%%    %%     %% %%%%%%%%  %%%%%%   
%%  %%   %%     %% %%        %%       
%%   %%  %%     %% %%        %%       
%%    %%  %%%%%%%  %%        %%       

%% Dokumentenkopf ------------


%%
% OPTION 1 -- Die Klassenarbeitszeile
% Klassenarbeitszeile nimmt nur drei Zeilen in Anspruch und druckt dort
% Platz für den Vor- und Nachnamen, dann die Argumente:
% 1 Prüfungsname 
% 2 Fach 
% 3 Klasse 
% 4 Datum
% und zuletzt die Tabelle mit den Punkten, das sog. gradetable. Verwendung wie folgt:
% \klassenarbeitszeile{Klassenarbeit 1}{Mathematik}{10c}{10.10.2023}
\newcommand{\klassenarbeitszeile}[4]{
	\begin{large}
	\noindent\textbf{Vor- und Zuname: \rule[-.8ex]{6cm}{.4pt}} \\[1.5ex]
	\noindent\textbf{\large #1, #2\ #3, am #4} 
	\end{large} \\[1ex]
	{\small \gradetable[h][questions]}
	% Fußzeile:
	\footrule
	\lfoot{#1 am #4}
	\cfoot{}
	\rfoot{Seite \thepage\ von \numpages}
}% end newcommand klassenarbeitszeile.






%%
% Option 2 -- Die große Tabelle (requires graphicx)
% Ausführlicher Dokumentenkopf mit allen Informationen zur Prüfung
\newenvironment{klassenarbeitskopf}{
\noindent\rule{\textwidth}{0.08em}\\% toprule
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}@{}c@{}*{6}{l}@{}}
% Zeile 1 -----------------------------------------------
	\hspace*{2cm}
&	{\scriptsize Fach}
& 	\multicolumn{2}{l}{\scriptsize Punkte}
& 	{\scriptsize Note}
& 	{\scriptsize Klassendurchschnitt}
& 	\scriptsize Sonstiger
\\[-.667ex]
% Zeile 2 ---
	&&&&&& {\scriptsize Leistungsstand}
\\[-1.7ex]
% Zeile 3 ---
% Logo einfügen:
	\raisebox{-1.8\normalbaselineskip}[0pt][0pt]{%
		\includegraphics[height=9.5ex]{logo}
		}%end raisebox.
	& {\small Mathematik} \\[.667ex]
% Zeile 4 ---
	& {\small 1. Klassenarbeit}
	& \multicolumn{2}{r}{\small von \numpoints\enspace}
\\\specialrule{0.05em}{4pt}{1pt}% midrule 
% Zeile 5 -----------------------------------------------
\multicolumn{2}{@{}l@{}}{\scriptsize Vor- und Nachname}
&	{\scriptsize Klasse}
&&	{\scriptsize Datum}
& 	\multicolumn{2}{l}{\scriptsize Kenntnisnahme der Eltern:}
\\[1.5ex]
% Zeile 6 ---
	&& {\small G-07ABC}
	&& {\small 10.10.2023}
\\\specialrule{0.05em}{4pt}{5pt}% midrule -------------- 
\end{tabular*}
}
{% Nach den Details und Hinweisen:
	\par\noindent\rule{\textwidth}{0.05em}%	------------
	\par\noindent{\small \gradetable[h][questions]}% Tabelle mit Punkten
	\par\noindent\rule{\textwidth}{0.08em}% ------------
}% end klassenarbeitskopf.






