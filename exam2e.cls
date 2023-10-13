\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{../../exam2e}[v0.0 erster (nullter) Versuch]


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



%% Layout
%
\pointsinrightmargin% Punkte werden rechts gedruckt
\marginpointname{}% ?










 %%%%%  %%%%%%%  %%%%%%%     %%     %%%%%  %%    %% %%%%%%%
%%   %% %%    %% %%    %%   %%%%   %%   %% %%    %% %%     
%%      %%    %% %%    %%  %%  %%  %%      %%    %% %%     
 %%%%%  %%%%%%%  %%%%%%%  %%    %% %%      %%%%%%%% %%%%%  
     %% %%       %%  %%   %%%%%%%% %%      %%    %% %%     
%%   %% %%       %%   %%  %%    %% %%   %% %%    %% %%     
 %%%%%  %%       %%    %% %%    %%  %%%%%  %%    %% %%%%%%%

%% EXAMDOC-Spracheinstellungen ------------

\pointpoints{Punkt}{Punkte}


%% 
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


%%
% Fußzeile
\pagestyle{foot}
\runningfootrule
\cfoot{}
\rfoot{Seite \thepage\ von \numpages}
