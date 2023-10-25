\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{../../exam2e}[v0.0.2 exam2e mit subpart hook aaa@ii]


%%
% Die zugrunde liegende Klasse wird geladen:
\LoadClass[a4paper,12pt,addpoints,fleqn]{exam}

% Die Schriftgröße kann über die Einstellung oben gewählt werden: 10pt, 11pt, 12pt alles kein Problem, wird an die Klasse 'exam' weitergegeben.
% Die Option ''addpoints'' lässt die documentclass die Punkte zusammenrechnen. ''fleqn'' macht die Gleichungen linksbündig. 













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


%%
% Erscheinung der Label (verwendet die Counter von oben)

% \part :
%\renewcommand{\partlabel}{\thequestion.\thepartno}% partlabel rechtsbündig, das ist LaTeX-Standard, oder:
\renewcommand\partlabel{\hbox to \labelwidth{\thequestion.\thepartno\hfil}}% macht das partlabel linksbündig und druckt 1.1 

% \subpart :
%\renewcommand\subpartlabel{(\thesubpart)}% (a)
\makeatletter
\renewcommand\subpartlabel{\aaa@ii{subpart}}% (a), zur Def. von \aaa@ii s.u.
\makeatother

% \subsubpart :
\renewcommand\subsubpartlabel{\thesubsubpart.}% i. ii.  




% ?
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









 %%%%%%  %%    %% %%%%%%%  %%%%%%%    %%    %%%%%%% %%%%%%%  %%%%% 
%%    %% %%    %% %%    %% %%    %%  %%%%   %%    %%   %%   %%   %%
%%       %%    %% %%    %% %%    %% %%  %%  %%    %%   %%   %%     
 %%%%%%  %%    %% %%%%%%%  %%%%%%% %%    %% %%%%%%%    %%    %%%%% 
      %% %%    %% %%    %% %%      %%%%%%%% %%  %%     %%        %%
%%    %% %%    %% %%    %% %%      %%    %% %%   %%    %%   %%   %%
 %%%%%%   %%%%%%  %%%%%%%  %%      %%    %% %%    %%   %%    %%%%% 

% Es gibt Fälle, wenn die Unteraufgaben dichter gepackt werden 
% sollen als je in eine Zeile oder man die Unteraufgaben in eine 
% mathematische Zeile einfügen will. Das ist mit \subpart nicht
% möglich, weswegen wir einen Haken \aaa definieren, der an dieser
% Stelle greift und aber den Zähler subpart verwendet. 

\makeatletter
\@addtoreset{subpart}{question}% Counter zurücksetzen bei 'question'
\@addtoreset{subpart}{partno}% und zurücksetzen bei Teilaufgaben.

% \aaa zur Verwendung im Dokument:
\newcommand{\aaa}{\@ifnextchar\bgroup{\aaa@i}{\aaa@i{}}}
\def\aaa@i{%
    \stepcounter{subpart}%
    \aaa@ii{subpart}%
}%

% Es folgt noch der Befehl für den Markup auf Textoberfläche. Dieser wird auch von \subpartlabel aufgerufen, siehe oben.
\def\aaa@ii#1{\textnormal{(\alph{#1})}}% date tag: 06 Jan 2020
\makeatother















