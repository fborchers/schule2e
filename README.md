
Das Paket 'schule2e'
====================



Für Ungeduldige
---------------

Mit der Dokumentenklasse `exam2e` werden Klassenarbeiten gesetzt, siehe `klassenarbeiten/ka1-minimal.tex`.

Das Stylesheet `exam2e.sty` dient der Kompatibilität, wenn man die Aufgaben von Klassenarbeiten in einem Skript sammelt (z.B. Dokumentenklasse `article`). 

Das Stylesheet `gess.sty` enthält einige spezifische Formatierungen für `exam2e`, die wir an unserer Schule verwenden. 

Die Pakete `schule2e` sind kein Fork des [Projektes von P. Breitfeld]{http://www.pbreitfeld.de/schule2e.sty}. Das Paket ist meines Wissens nicht mehr verfügbar. Der Name des Paketes ist diesem Andenken gewidmet. 


Informationen für LaTeX-Neulinge
--------------------------------

Sie kennen sich bereits ein wenig mit LaTeX aus, haben vielleicht an der Uni mal damit gearbeitet; eine Anleitung haben Sie bereits gelesen, z.B. die klassische [LaTeX2e-Kurzbeschreibung]{http://mirrors.ibiblio.org/CTAN/info/german/LaTeX2e-Kurzbeschreibung/l2kurz.pdf}.
Nun wollen Sie das Textsatzsystem als Lehrer/in verwenden. 

Die Pakete, die hier als `schule2e` zusammengefasst sind, sollen startklar sein, minimal und doch umfassend für die täglichen Aufgaben in der Schule, ins. das Erstellen von Klassenarbeiten.
Dazu sind die Pakete modular aufgebaut: Sie nehmen sich den Teil, den Sie gebrauchen können, und auf den Rest verzichten Sie oder probieren es später aus. 
Wenn Sie später Details ändern möchten oder Ihre eigenen Klassen bauen werden, umso besser.


Die Dokumentenklasse exam2e.cls
-------------------------------

Als Grundbestandteil betrachten wir die Dokumentenklasse `exam2e.cls`. Die Sprache wird auf deutsch gestellt und die Bezeichnungen der Aufgaben und Unteraufgaben wird angepasst. Teilaufgaben werden ab 1.1 durchnummeriert, Unteraufgaben wie üblich mit (a), (b) usw. durchgezählt. Entscheidend ist, dass man *die* Struktur verwenden kann, die man für die eigenen Aufgaben benötigt. Die Klassenarbeit `ka1` zeigt ein Minimalstbeispiel auf. 

Die Klasse `exam2e` ruft intern die Dokumentenklasse `exam` von Philip Hirschhorn auf, daher sei auf [deren Dokumentation]{https://ctan.org/pkg/exam?lang=en} (englisch) verwiesen für alle Detailfragen. 


exam2e und das \aaa Makro
-------------------------

Mit dem Makro `\aaa` haben Sie einen feinkörnigeren Zugriff auf den Zähler `subpart` der exam-Dokumentenklasse. Das ist vor allem dann sinnvoll, wenn man innerhalb einer (oder mehrerer) Zeilen Mathematiksatz Unteraufgaben stellen möchte. In `ka2` werden diese Funktionen vorgestellt. 





Das exam2e Stylesheet (exam2e.sty)
----------------------------------
Als zweiten, unabhängigen Grundbaustein verstehen wir das Paket `exam.sty`. Es wird *nicht* zusammen mit der Klasse `exam2e.cls` verwendet, sondern dient der Kompatibilität mit dieser Klasse. Die Umgebungen `question`, `part`, `subpart` und `subsubpart` werden definiert und erzeugen einen vergleichbaren Output wie in der `exam` documentclass. 

Das Paket ist für die Verwendung mit der Dokumentenklasse `article`, `scrarticle`, `book` usw. gedacht und macht die `exam2e`-Makros dort verfügbar. Wenn Sie also Aufgaben und Unterlagen in einem LaTeX-Dokument sammeln, können Sie denselben Markup und dieselben Befehle verwenden wie für die Prüfungsaufgaben auch. Später können Sie dann die Aufgaben durch Kopieren und Einfügen in Klassenarbeiten (documentclass `exam2e`) einfließen lassen, oder umgekehrt, Prüfungsaufgaben aus einer Klassenarbeit herauskopieren und in den Skripten archivieren. Es ist genau dieses Zusammenspiel, das einigen Mehrwert verspricht. 

Wie eine solche Sammlung aussehen kann, zeigt das Beispiel unter `unterlagen/einskript.tex`. Das Paket `exam2e` wird geladen, im Text befinden sich die Aufgaben in einer Umgebung `question` oder nach einem Befehl `\question`. 


Das Stylesheet gess.sty
-----------------------
In diesem Paket sind einige Funktionen zusammengefasst, die wir an unserer Schule nutzen. Insbesondere ist die Tabelle `klassenarbeitskopf` bei uns in Gebrauch, es ist höchstwahrscheinlich, dass Sie dieses abändern müssten, wenn Sie einen ähnlichen Kopf für Klassenarbeiten verwenden wollen. 



Das Stylesheet mathe2e.sty
--------------------------
Das Paket `mathe2e` ist ebenfalls optional und kann sowohl in Klassenarbeiten als auch im Skript geladen werden. Es ist als Angebot gemeint, im besten Fall verwenden Sie natürlich Ihre eigenen Makros für den Mathematiksatz.

`mathe2e` lädt im Hintergrund `amsmath` und stellt damit alle Strukturen zur Verfügung. Wir ergänzen nur noch die, die für die Schulmathematik gebraucht werden: Zahlbereiche und Mengen, Relationen, lineare Gleichungssysteme (LGS) und die Vektorgeometrie. 
Zusätzlich wird `siunitx` geladen für die korrekte Darstellung der Einheiten (ins. des unbreakable space zwischen Zahl und Einheit). Damit können Einheiten ohne Zahlwerte, Prozente, Währungen und Kommazahlen entsprechend der deutschen Notation dargestellt werden. 


Dank 
----

Dieses Projekt begann  irgendwann als fork von P. Breitfelds Paket schule2e, geworden ist es eine Neufassung der wichtigsten Funktionen für die Nutzung in der Schule. Das Original schule2e ist leider nicht mehr verfügbar, sein letzter Beitrag zur Zeit der Niederschrift über zehn Jahre her. Es ist daher nicht anmaßend gemeint, den Namen schule2e weiterzuführen, sondern dankend.


