\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{../../exam2e}[v0.0 erster (nullter) Versuch]


%%
% Die zugrunde liegende Klasse wird geladen:
\LoadClass[a4paper,12pt,addpoints,fleqn]{exam}

% Die SCHRIFTGRÖßE kann über die Einstellung oben gewählt werden: 10pt, 11pt, 12pt alles kein Problem.
% Die Option ''addpoints'' lässt die documentclass die Punkte zusammenrechnen. ''fleqn'' macht die Gleichungen linksbündig. 



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

