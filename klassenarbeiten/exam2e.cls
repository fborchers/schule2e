\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../exam2e}[v0.0.3 exam2e mit subpart hook aaa@ii]


%%
% Alle Optionen, mit denen exam2e geladen wurde, werden an exam weiter-
% gereicht, z.B. Schriftgröße 10pt, 11pt, oder 12pt:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
% oder 
%\ProcessOptions*
% Siehe: https://tex.stackexchange.com/questions/61487/processoptions-and-processkeyvaloptions/82441#82441


%%
% Die zugrunde liegende Klasse wird geladen:
\LoadClass[addpoints,fleqn]{exam}

% Einstellungen können in der Zeile oben geändert werden: 
% Mit 'fleqn' werden die mathematischen Gleichungen linksbündig.
% Die Option ''addpoints'' lässt die documentclass die Punkte zusammenrechnen. Genau das ist erwünscht. 













 %%%%%  %%%%%%%  %%%%%%%     %%     %%%%%  %%    %% %%%%%%%
%%   %% %%    %% %%    %%   %%%%   %%   %% %%    %% %%     
%%      %%    %% %%    %%  %%  %%  %%      %%    %% %%     
 %%%%%  %%%%%%%  %%%%%%%  %%    %% %%      %%%%%%%% %%%%%  
     %% %%       %%  %%   %%%%%%%% %%      %%    %% %%     
%%   %% %%       %%   %%  %%    %% %%   %% %%    %% %%     
 %%%%%  %%       %%    %% %%    %%  %%%%%  %%    %% %%%%%%%


%% EXAMDOC-Spracheinstellungen ------------



\AtBeginDocument{%
% Falls auf Englisch:
\@ifpackagewith{babel}{english}{%
    \pointpoints{mark}{marks}
    \bonuspointpoints{mark (bonus)}{marks (bonus)}
    \pointsinrightmargin% Punkte werden rechts auf den Rand gedruckt
    \marginpointname{m}% Abkürzung für Punkte in diesem Fall.
}{}
% Neue Rechtschreibung:
\@ifpackagewith{babel}{ngerman}{% falls Sprache deutsch (neue RS):
    % Punkte alias Bewertungseinheiten:
    \pointpoints{Punkt}{Punkte}%
    \pointsinrightmargin% Punkte werden rechts auf den Rand gedruckt
    \marginpointname{P.}% Abkürzung für Punkte in diesem Fall.
    %
    % Wörter für die Angabe der Punkte in der Tabelle:
    \hqword{Aufgabe}\vqword{Aufgabe}%
    \hpword{Punkte}\vpword{Punkte}%
    \htword{Summe}\vtword{Summe}%
    \hsword{erzielt}\vsword{erzielt}%
    % Wörter für Lösungen:
    \renewcommand\solutiontitle{\noindent\textbf{Lösung:}\par}%
}{}
% Alte Rechtschreibung:
\@ifpackagewith{babel}{german}{% falls Sprache deutsch (alte RS):
    % Punkte alias Bewertungseinheiten:
    \pointpoints{Punkt}{Punkte}%
    \pointsinrightmargin% Punkte werden rechts auf den Rand gedruckt
    \marginpointname{P.}% Abkürzung für Punkte in diesem Fall.
    %
    % Wörter für die Angabe der Punkte in der Tabelle:
    \hqword{Aufgabe}\vqword{Aufgabe}%
    \hpword{Punkte}\vpword{Punkte}%
    \htword{Summe}\vtword{Summe}%
    \hsword{erzielt}\vsword{erzielt}%
    % Wörter für Lösungen:
    \renewcommand\solutiontitle{\noindent\textbf{Lösung:}\par}%
}{}
}% Ende AtBeginDocument-Haken.












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


%% EXAMDOC: Aufgaben --------

% Layout einer Aufgabe, das sog. 'question format'. 
% \@vqword ist das Makro mit dem Label einer Aufgabe, "Question" ist die Standardeinstellung, ist aber ggfs. oben geändert, siehe Spracheinstellungen:
\qformat{{\bfseries \@vqword\ \thequestion}\hfill(\totalpoints\ \points)\hfill\\}%


% Erscheinung der Counter der 'exam' documentclass:
%\renewcommand{\thequestion}{\arabic{question}}% Nummerierung ist Standard
\renewcommand{\thepartno}{\arabic{partno}}% Teilaufgaben auch nummeriert
\renewcommand{\thesubpart}{\alph{subpart}}% Unteraufgaben a b c usw.
\renewcommand{\thesubsubpart}{\roman{subsubpart}}% Unterunteraufg. i ii
%\renewcommand{\thechoice}{\Alph{choice}}% letzte Unterebene unverändert


% Erscheinung der Label (verwendet die Counter von oben). Dazu werden part, subpart, subsubpart geändert:

% \part :
%\renewcommand{\partlabel}{\thequestion.\thepartno}% partlabel rechtsbündig, das ist LaTeX-Standard, oder linksbündig mit:
\renewcommand\partlabel{\hbox to \labelwidth{\thequestion.\thepartno\hfil}}% macht das partlabel linksbündig und druckt 1.1 

% \subpart :
%\renewcommand\subpartlabel{(\thesubpart)}% (a)
\makeatletter
\renewcommand\subpartlabel{\aaa@ii{subpart}}% (a)
\makeatother% zur Definition von \aaa@ii s.u.

% \subsubpart :
\renewcommand\subsubpartlabel{\thesubsubpart.}% i. ii.  


% Die Befehle \questionshook und \partshook usw. sind in der Dokumentenklasse 'exam' als leer definiert. Sie können umdefiniert werden, um Abstände anzupassen, siehe Dolumentation von 'exam'.

% Entferne die Einrückung der 'question', Diese vier Zeilen sind der Dokumentation der Dokumentenklasse 'exam' entnommen:
\renewcommand{\questionshook}{%
    \setlength{\leftmargin}{0pt}%
    \setlength{\labelwidth}{-\labelsep}%
}

%\renewcommand{\partshook}{\setlength{\leftmargin}{1.5cm}}
%\renewcommand{\subpartshook}{}
%\renewcommand{\subsubpartshook}{}



%% EXAMDOC: Punkte --------
% siehe Spracheinstellungen.


%% Platz für Lösungen --------
% Einstellungen für Kästchen und Linien zum Schreiben der Antworten. Die Größe und Linienstärke der Kästchen kann angepasst werden:
\setlength{\gridsize}{5mm}% Größe
\setlength{\gridlinewidth}{.05pt}% Linienstärke
%
% Zeilenhöhe von Linien:
\setlength\linefillheight{0.9cm}% Abstand









   %%%       %%%       %%%    
  %% %%     %% %%     %% %%   
 %%   %%   %%   %%   %%   %%  
%%     %% %%     %% %%     %% 
%%%%%%%%% %%%%%%%%% %%%%%%%%% 
%%     %% %%     %% %%     %% 
%%     %% %%     %% %%     %% 


% Es gibt Fälle, wenn die Unteraufgaben dichter gepackt werden 
% sollen als je in eine eigene Zeile oder man die Unteraufgaben in eine 
% mathematische Zeile einfügen will. Das ist mit \subpart nicht
% möglich, weswegen wir einen Haken \aaa definieren, der an dieser
% Stelle ein greift, aber den Zähler subpart verwendet. 

\makeatletter
\@addtoreset{subpart}{question}% Counter zurücksetzen bei 'question'
\@addtoreset{subpart}{partno}% und zurücksetzen bei Teilaufgaben.

% Identische Definition in exam2e.sty ---
% \aaa zur Verwendung im Dokument als \aaa:
\newcommand{\aaa}{\@ifnextchar\bgroup{\aaa@i}{\aaa@i{}}}
\def\aaa@i{%
    \stepcounter{subpart}%
    \aaa@ii{subpart}%
}%

% Es folgt noch der Befehl für den Markup auf Textoberfläche. Dieser wird auch für das subpartlabel verwendet, siehe oben.
\def\aaa@ii#1{\textnormal{(\alph{#1})}}% date tag: 06 Jan 2020
\makeatother






