
Das Paket 'schule2e'
====================



Für Ungeduldige
---------------

Mit der Dokumentenklasse `exam2e` werden Klassenarbeiten gesetzt, siehe `klassenarbeiten/ka1-minimal.tex`.

Das Stylesheet `exam2e.sty` dient der Kompatibilität, wenn man die Aufgaben von Klassenarbeiten in einem Skript sammelt (z.B. Dokumentenklasse `article`). 

Das Stylesheet `gess.sty` enthält einige spezifische Formatierungen für `exam2e`, die wir an unserer Schule verwenden. 




Informationen für LaTeX-Neulinge
--------------------------------

Sie kennen sich bereits ein wenig mit LaTeX aus, haben vielleicht an der Uni mal damit gearbeitet; eine Anleitung haben Sie bereits gelesen, z.B. die klassische [LaTeX2e-Kurzbeschreibung]{http://mirrors.ibiblio.org/CTAN/info/german/LaTeX2e-Kurzbeschreibung/l2kurz.pdf}.
Nun wollen Sie das Textsatzsystem als Lehrer/in verwenden. 

Dieses Paket `schule2e` soll den Start erleichtern und Sie in die Lage versetzen, gleich loszulegen. Dazu sind die Pakete modular aufgebaut: Sie nehmen sich den Teil, den Sie gebrauchen können, und auf den Rest verzichten Sie oder probieren es später aus. 
Wenn Sie später Details ändern möchten oder Ihre eigenen Klassen bauen werden, umso besser.


exam2e
------

Als Grundbestandteil betrachten wir die Dokumentenklasse `exam2e.cls`. Die Sprache wird auf deutsch gestellt und die Bezeichnungen der Aufgaben und Unteraufgaben wird angepasst. Teilaufgaben werden ab 1.1 durchnummeriert, Unteraufgaben wie üblich mit (a), (b) usw. durchgezählt. Entscheidend ist, dass man *die* Struktur verwenden kann, die man für die eigenen Aufgaben benötigt. Die Klassenarbeit `ka1` zeigt ein Minimalstbeispiel auf. 

Die Klasse `exam2e` ruft intern die Dokumentenklasse `exam` von Philip Hirschhorn auf, daher sei auf [deren Dokumentation]{https://ctan.org/pkg/exam?lang=en} (englisch) verwiesen für alle Detailfragen. 


exam2e und das \aaa Makro
-------------------------

Mit dem Makro `\aaa` haben Sie einen feinkörnigeren Zugriff auf den Zähler `subpart` der exam-Dokumentenklasse. Das ist vor allem dann sinnvoll, wenn man innerhalb einer (oder mehrerer) Zeilen Mathematiksatz Unteraufgaben stellen möchte. In `ka2` werden diese Funktionen vorgestellt. 






