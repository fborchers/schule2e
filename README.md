

### Für Ungeduldige


- Mit der Dokumentenklasse `exam2e` werden Klassenarbeiten gesetzt. Es baut auf `exam` auf, der [Dokumentenklasse von P. Hirschhorn](https://ctan.org/pkg/exam?lang=en), und stellt auf die deutsche Sprache um. 
- Der Dokumentation `schule2e.pdf` ist im Anhang ein Beispiel aus dem Alltag zur Ansicht beigefügt. Diese Klassenarbeit wurde aus `ka4-worked-example.tex` kompiliert. 
- Das Stylesheet `mathe2e` lädt `amsmath` und passt an den Gebrauch in der Schule an. Umgebungen für lineare Gleichungsysteme und Vektoren werden bereit gestellt. Mit `siunitx` werden Größen und Einheiten gesetzt. 
- `gess.sty` enthält einige spezifische Formatierungen für `exam2e`, die wir an unserer Schule verwenden. 
- Das Stylesheet `exam2e.sty` dient der Kompatibilität, wenn man die Aufgaben von Klassenarbeiten in einem Skript sammeln will (z.B. Dokumentenklasse `article`). 
- Die Pakete `schule2e` sind kein Fork des [Projektes von P. Breitfeld](http://www.pbreitfeld.de/schule2e.sty). Das Paket ist unseres Wissens nicht mehr verfügbar. Der Name des Paketes ist diesem Andenken gewidmet. 




# Übersicht `schule2e`

Sie kennen sich bereits ein wenig mit LaTeX aus, haben vielleicht an der Uni mal damit gearbeitet; eine Anleitung haben Sie bereits gelesen, z.B. die klassische [LaTeX2e-Kurzbeschreibung](http://mirrors.ibiblio.org/CTAN/info/german/LaTeX2e-Kurzbeschreibung/l2kurz.pdf).
Nun wollen Sie das Textsatzsystem als Lehrer/in verwenden. 

Die Pakete, die hier als `schule2e` zusammengefasst sind, sollen startklar sein, minimal und doch umfassend für die täglichen Aufgaben in der Schule, ins. das Erstellen von Klassenarbeiten.
Dazu sind die Pakete modular aufgebaut: Sie nehmen sich den Teil, den Sie gebrauchen können, und auf den Rest verzichten Sie oder probieren es später aus. 
Wenn Sie später Details ändern möchten oder Ihre eigenen Klassen bauen werden, umso besser.


### Die Dokumentenklasse exam2e.cls

Als Grundbestandteil betrachten wir die Dokumentenklasse `exam2e.cls`. Die Sprache wird auf deutsch gestellt und die Bezeichnungen der Aufgaben und Unteraufgaben wird angepasst. Teilaufgaben werden ab 1.1 durchnummeriert, Unteraufgaben wie üblich mit (a), (b) usw. durchgezählt. Entscheidend ist, dass man *die* Struktur verwenden kann, die man für die eigenen Aufgaben benötigt. Die Klassenarbeit `ka1` zeigt ein Minimalbeispiel auf, `ka4` eine echte Klassenarbeit aus unserem Unterricht (sie ist dem PDF dieses Dokumentes angehängt, siehe unten).

Die Klasse `exam2e` ruft intern die Dokumentenklasse `exam` von Philip Hirschhorn auf, daher sei auf [deren Dokumentation](https://ctan.org/pkg/exam?lang=en) (englisch) verwiesen für alle Detailfragen. `exam` ist ein wohl gepflegtes, umfangreiches Projekt, ohne das `exam2e` in dieser Form nicht möglich wäre. 


### exam2e und das `\aaa`-Makro

Mit dem Makro `\aaa` haben Sie einen feinkörnigen Zugriff auf den Zähler `subpart` der exam-Dokumentenklasse. Das ist vor allem dann sinnvoll, wenn man innerhalb einer (oder mehrerer) Zeilen Mathematiksatz Unteraufgaben stellen möchte. In `ka2` werden diese Funktionen vorgestellt. 





### Das exam2e-Stylesheet (`exam2e.sty`)

Als zweiten, unabhängigen Grundbaustein verstehen wir das Paket `exam.sty`. Es wird *nicht* zusammen mit der Klasse `exam2e.cls` verwendet, sondern dient der Kompatibilität mit dieser Klasse. Dazu werden die Umgebungen `question`, `part`, `subpart` und `subsubpart` definiert und erzeugen einen vergleichbaren Output wie in der `exam` documentclass. 

Das Paket ist für die Verwendung mit der Dokumentenklasse `article`, `scrarticle`, `book` usw. gedacht und macht die `exam2e`-Makros dort verfügbar. Wenn Sie also Aufgaben und Unterlagen in einem LaTeX-Dokument sammeln, können Sie denselben Markup und dieselben Befehle verwenden wie für die Prüfungsaufgaben auch. Später können Sie dann die Aufgaben durch Kopieren und Einfügen in Klassenarbeiten (documentclass `exam2e`) einfließen lassen, oder umgekehrt, Prüfungsaufgaben aus einer Klassenarbeit herauskopieren und in den Skripten archivieren. Es ist genau dieses Zusammenspiel, das einigen Mehrwert verspricht. 

Das Beispiel unter `dokumentation/einskript` zeigt, wie eine solche Sammlung aussehen kann. Das Paket `exam2e` wird geladen, im Text befinden sich die Aufgaben in einer Umgebung `question` oder nach einem Befehl `\question`. 


### Unser Stylesheet `gess.sty`

In diesem Paket sind einige Funktionen zusammengefasst, die wir an unserer Schule nutzen. Insbesondere ist die Tabelle `klassenarbeitskopf` bei uns in Gebrauch; es ist höchstwahrscheinlich, dass Sie dieses abändern müssten, wenn Sie einen ähnlichen Kopf für Klassenarbeiten verwenden wollen. Ein kleinerer, allgemeiner Kopf für eine Klassenarbeit entsteht durch den Aufruf von `\klassenarbeitszeile`, die Syntax ist identisch. 



### Das Stylesheet `mathe2e.sty`

Das Paket `mathe2e` ist ebenfalls optional und kann sowohl in Klassenarbeiten als auch im Skript geladen werden. Es ist als Angebot gemeint, im besten Fall verwenden Sie natürlich Ihre eigenen Makros für den Mathematiksatz.

`mathe2e` lädt im Hintergrund `amsmath` und stellt damit alle Strukturen zur Verfügung. Wir ergänzen nur noch die, die für die Schulmathematik gebraucht werden: Zahlbereiche und Mengen, Relationen, lineare Gleichungssysteme (LGS) und die Vektorgeometrie. 
Zusätzlich wird `siunitx` geladen für die korrekte Darstellung der Einheiten und des richtigen Abstandes (ins. das Verhindern eines Zeilenumbruchs zwischen Zahl und Einheit). Damit können Einheiten ohne Zahlwerte, Prozente, Währungen und Kommazahlen entsprechend der deutschen Notation dargestellt werden. 

Für die linearen Gleichungssysteme (LGS) ist außerdem ein Konverter beigefügt, der bei Bedarf aus der Matrixdarstellung eines LGS den zugehörigen TeX-Code erzeugt. Mit diesem Konverter wird die Verwendung der Umgebung `lgs` sehr bequem. Der Konverter ist in der Programmiersprache [`R`](https://www.r-project.org) geschrieben, die für die Verwendung ggfs. zu installieren ist. 


### Dank 

Dieses Projekt begann irgendwann als Fork von [P. Breitfelds Paket `schule2e`](http://www.pbreitfeld.de/schule2e.sty), geworden ist es eine Neufassung der wichtigsten Funktionen für die Nutzung in der Schule. Das Original `schule2e` ist leider nicht mehr verfügbar, sein letzter Beitrag zur Zeit der Niederschrift über zehn Jahre her. Es ist daher nicht anmaßend gemeint, den Namen `schule2e` weiterzuführen, sondern dankend.

Im "Maschinenraum" von `schule2e` wird die Dokumentenklasse `exam` von [P. Hirschhorn](https://ctan.org/pkg/exam?lang=en) aufgerufen. `exam` ist eine mächtige und mit über 8000 Zeilen Quellcode umfangreiche Klasse, die die Struktur der Aufgaben und auch den Punktzähler bereitstellt und die seit 30 Jahren gewissenhaft gepflegt wird.