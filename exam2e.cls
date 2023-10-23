\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{../../exam2e}[v0.0.1 erster Versuch]


%%
% Die zugrunde liegende Klasse wird geladen:
\LoadClass[a4paper,12pt,addpoints,fleqn]{exam}

% Die Schriftgröße kann über die Einstellung oben gewählt werden: 10pt, 11pt, 12pt alles kein Problem, wird an die Klasse 'exam' weitergegeben.
% Die Option ''addpoints'' lässt die documentclass die Punkte zusammenrechnen. ''fleqn'' macht die Gleichungen linksbündig. 


%% 
% Pakete einladen:
\RequirePackage{siunitx}
\RequirePackage{booktabs}% wird für klassenarbeitskopf verwendet.


%%
% Wir wählen eine serifenlose Schriftart (optional):
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


% Erscheinung der Counter der 'exam' documentclass
%\renewcommand{\thequestion}{\arabic{question}}% Nummerierung ist Standard
\renewcommand{\thepartno}{\arabic{partno}}% Teilaufgaben auch nummeriert
\renewcommand{\thesubpart}{\alph{subpart}}% Unteraufgaben a b c usw.
\renewcommand{\thesubsubpart}{\roman{subsubpart}}% Unterunteraufg. i ii
%\renewcommand{\thechoice}{\Alph{choice}}% letzte Unterebene unverändert

% Erscheinung der Label (verwendet die Counter von oben)
%\renewcommand{\partlabel}{\thequestion.\thepartno}% partlabel rechtsbündig, das ist LaTeX-Standard, oder:
\renewcommand\partlabel{\hbox to \labelwidth{\thequestion.\thepartno\hfil}}% macht das partlabel linksbündig und druckt 1.1
\renewcommand\subpartlabel{(\thesubpart)}% (a)
\renewcommand\subsubpartlabel{\thesubsubpart.}% i. ii.  



%%
% Einrückungen links beim der 'exam' documentclass einstellen

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

% Wörter für die horizontale Angabe der Punkte in der Tabelle:
\hqword{Aufgabe}
\hpword{Punkte}
\htword{Summe}
\hsword{erzielt}

%%
% Wörter für Lösungen:
\renewcommand\solutiontitle{\noindent\textbf{Lösung:}\par\noindent}

%%
% Layout einer Aufgabe, das sog. 'question format', bspw.:
\qformat{{\bfseries Aufgabe \thequestion\ von \numquestions \hfill} 
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
% #1 Prüfungsname 
% #2 Fach 
% #3 Klasse 
% #4 Datum. Verwendung wie folgt: 
% \klassenarbeitszeile{Klassenarbeit 1}{Mathematik}{10c}{10.10.2023}
\newcommand{\klassenarbeitszeile}[4]{
	\begin{large}
	\noindent\textbf{Vor- und Zuname: \rule[-.8ex]{6cm}{.4pt}} \\[1.5ex]
	\noindent\textbf{\large #1, #2\ #3, am #4} 
	\end{large} \\[1ex]
	{\small \gradetable[h][questions]}
	% Einstellen der Fußzeile:
	\footrule
	\lfoot{#1 am #4}
	\cfoot{}
	\rfoot{Seite \thepage\ von \numpages}
}% end newcommand klassenarbeitszeile.






%%
% OPTION 2 -- Die große Tabelle (requires graphicx and booktabs)
% Ausführlicher Dokumentenkopf mit allen Informationen zur Prüfung
% Verwendung wie \klassenarbeitszeile oben mit vier Argumenten, z.B.
% \begin{klassenarbeitskopf}{Klassenarbeit 1}{Mathematik}{10c}{10.10.2023}
\newenvironment{klassenarbeitskopf}[4]{%
\noindent\rule{\textwidth}{0.08em}\\% toprule
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}@{}c@{}*{6}{l}@{}}
% Zeile 1 ------------------------------------------
	\hspace*{2cm}% Platzhalter des Logos, siehe Zeile 3 unten.
&	  {\scriptsize Fach}
& 	\multicolumn{2}{l}{{\scriptsize Punkte}}
& 	{\scriptsize Note}
& 	{\scriptsize Klassendurchschnitt}
& 	{\scriptsize Sonstiger}\\[-.667ex]
% Zeile 2 ---
&&&&&& {\scriptsize Leistungsstand}\\[-1.7ex]
% Zeile 3 ---
% Logo einfügen:
	\raisebox{-1.8\normalbaselineskip}[0pt][0pt]{%
		\includegraphics[height=9.5ex]{../logo}}%end raisebox.
& {\small #2}% Fach                                <- #2
\\[.667ex]
% Zeile 4 ---
	& {\small #1}% Name der Prüfung                  <- #1
	& \multicolumn{2}{r}{{\small von \numpoints\enspace}}
\\\specialrule{0.05em}{4pt}{1pt}% midrule 
% Zeile 5 -----------------------------------------
\multicolumn{2}{@{}l@{}}{{\scriptsize Vor- und Nachname}}
&	{\scriptsize Klasse}
&&{\scriptsize Datum}
& \multicolumn{2}{l}{{\scriptsize Kenntnisnahme der Eltern:}}
\\[1.5ex]
% Zeile 6 ---
	&& {\small #3}% Klasse                           <- #3
	&& {\small #4}% Datum                            <- #4
\\\specialrule{0.05em}{4pt}{5pt}% midrule ---------
\end{tabular*}
% Es folgen die Details und Hinweise, die man im Dokument eintippt.
}{% Abschließend die Tabelle mit Punkten:
	\par\noindent\raisebox{1ex}{\rule{\textwidth}{0.05em}}%	------------
	\par\noindent{\small \gradetable[h][questions]}% Tabelle
	\par\noindent\raisebox{-.8ex}{\rule{\textwidth}{0.08em}}% ------------
}% end klassenarbeitskopf.


% Hinweis zur Summe der Punkte im Klassenarbeitskopf:
% Man könnte die Summe entfernen, indem man diesen Patch einfügt, siehe:
% https://tex.stackexchange.com/questions/698466/how-do-you-remove-exams-total-points-column-or-row-from-the-gradetable/698503#698503














%%    %%  %%%%%%%  %%     %% %%%%%%%%     %%%    %%%%%%%% %%%% 
%%   %%  %%     %% %%%   %%% %%     %%   %% %%      %%     %%  
%%  %%   %%     %% %%%% %%%% %%     %%  %%   %%     %%     %%  
%%%%%    %%     %% %% %%% %% %%%%%%%%  %%     %%    %%     %%  
%%  %%   %%     %% %%     %% %%        %%%%%%%%%    %%     %%  
%%   %%  %%     %% %%     %% %%        %%     %%    %%     %%  
%%    %%  %%%%%%%  %%     %% %%        %%     %%    %%    %%%% 

                                       %%   %% 
%%%%%%%%  %%%% %%       %%%% %%%%%%%%    %%%    %%%%%%%%       
%%     %%  %%  %%        %%     %%      %% %%      %%          
%%     %%  %%  %%        %%     %%     %%   %%     %%          
%%%%%%%%   %%  %%        %%     %%    %%     %%    %%          
%%     %%  %%  %%        %%     %%    %%%%%%%%%    %%          
%%     %%  %%  %%        %%     %%    %%     %%    %%          
%%%%%%%%  %%%% %%%%%%%% %%%%    %%    %%     %%    %%          

%% Kompatibilität mit den Definitionen in den Skripten ------------


%% 
% Die 'question' wird als Umgebung verwendet, also in dieser Form:
% \begin{question} Text der Frage \end{question}. Dazu wird definiert:
\newenvironment{question}{\question}{}%
\newcommand{\omitsolution}{}% \omitsolution dient der Kontrolle der Counter in den Skripten, siehe das entsprechende style sheet (.sty).




