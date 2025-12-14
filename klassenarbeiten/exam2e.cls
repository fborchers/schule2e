\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../exam2e}[v0.1.3 exam Klasse auf deutsch]


%%
% Alle Optionen, mit denen exam2e geladen wurde, werden an exam weitergereicht, z.B. Schriftgröße 10pt, 11pt, oder 12pt:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
% oder mit \ProcessOptions*
% Siehe dazu: https://tex.stackexchange.com/questions/61487/processoptions-and-processkeyvaloptions/82441#82441


%%
% Die zugrunde liegende Klasse wird geladen:
\LoadClass[addpoints]{exam}

% Die Option 'addpoints' lässt die documentclass die Punkte zusammenrechnen, genau das ist erwünscht. 













 %%%%%  %%%%%%%  %%%%%%%     %%     %%%%%  %%    %% %%%%%%%
%%   %% %%    %% %%    %%   %%%%   %%   %% %%    %% %%     
%%      %%    %% %%    %%  %%  %%  %%      %%    %% %%     
 %%%%%  %%%%%%%  %%%%%%%  %%    %% %%      %%%%%%%% %%%%%  
     %% %%       %%  %%   %%%%%%%% %%      %%    %% %%     
%%   %% %%       %%   %%  %%    %% %%   %% %%    %% %%     
 %%%%%  %%       %%    %% %%    %%  %%%%%  %%    %% %%%%%%%


%% EXAMDOC-Spracheinstellungen ------------
% Durch die folgenden Zeilen die keywords von ''exam'' auf deutsch übersetzt. 

% Punkte alias Bewertungseinheiten:
\pointpoints{Punkt}{Punkte}%
\pointsinrightmargin% Punkte werden rechts auf den Rand gedruckt
\marginpointname{P\hspace*{-.5ex}.}% Abkürzung für Punkte
\setlength{\rightpointsmargin}{5mm}%

% Wörter für die Angabe der Punkte in der Tabelle:
\hqword{Aufgabe}\vqword{Aufgabe}%
\hpword{Punkte}\vpword{Punkte}%
\htword{Summe}\vtword{Summe}%
\hsword{erzielt}\vsword{erzielt}%

% Wörter für Lösungen:
\renewcommand\solutiontitle{\noindent\textbf{Lösung}\par}%
















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

% Die 'question' kann auch als Umgebung verwendet werden, also in dieser Form: \begin{question} Text der Frage \end{question}. Dazu ist keine weitere Definition nötig:
% \newenvironment{question}{\question}{}%

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
\renewcommand\thepartno{\thequestion.\arabic{partno}}% als 1.1
\renewcommand{\thesubpart}{(\alph{subpart})}% Unteraufgaben (a) usw.
\renewcommand{\thesubsubpart}{\roman{subsubpart}.}% Unterunteraufg. i.
%\renewcommand{\thechoice}{\Alph{choice}}% letzte Unterebene unverändert


% Erscheinung der Label (verwendet die Counter von oben). Dazu werden partlabel, subpartlabel, und subsubpartlabel geändert:

% \part :
% Das Label kann nun rechts- oder linksbündig angeordnet werden:
%\renewcommand{\partlabel}{\thepartno}% rechtsbündig
% oder linksbündig mit:
\renewcommand\partlabel{\hbox to \labelwidth{\thepartno\hfill}}%

% \subpart :
%\makeatletter
%\renewcommand\subpartlabel{\aaa@ii{subpart}}% (a)
%\makeatother% zur Definition von \aaa@ii s.u.
\renewcommand\subpartlabel{\thesubpart}%

% \subsubpart :
\renewcommand\subsubpartlabel{\thesubsubpart}% 


% Die Befehle \questionshook und \partshook usw. sind in der Dokumentenklasse 'exam' als leer definiert. Sie können umdefiniert werden, um Abstände anzupassen, siehe Dokumentation von 'exam'.

% Entferne die Einrückung der 'question'. Diese vier Zeilen sind der Dokumentation der Dokumentenklasse 'exam' entnommen:
\renewcommand{\questionshook}{%
    \setlength{\leftmargin}{0pt}%
    \setlength{\labelwidth}{-\labelsep}%
}

%\renewcommand{\partshook}{\setlength{\leftmargin}{1.5cm}}
%\renewcommand{\subpartshook}{}
%\renewcommand{\subsubpartshook}{}




%% examdoc: Punkte alias Bewertungseinheiten --------
% siehe Spracheinstellungen.



%% examdoc: Platz für Lösungen --------
% Einstellungen für Kästchen und Linien zum Schreiben der Antworten. Die Größe und Linienstärke der Kästchen kann angepasst werden:
%\setlength{\gridsize}{5mm}% Größe der Kästchen, 5mm ist default.
\setlength{\gridlinewidth}{.05pt}% Linienstärke, 0.1pt ist default.

% Zeilenhöhe von Linien:
\setlength\linefillheight{0.9cm}% Abstand der Linien falls gedruckt









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

\@addtoreset{subpart}{question}% Counter zurücksetzen bei 'question'
\@addtoreset{subpart}{partno}% und zurücksetzen bei Teilaufgaben.

% Ähnliche Definition in exam2e.sty ---
% \aaa zur Verwendung im Dokument als \aaa:
\newcommand{\aaa}{\@ifnextchar\bgroup{\aaa@i}{\aaa@i{}}}
\def\aaa@i{%
    \stepcounter{subpart}%
    \textnormal{\thesubpart}%
}%






