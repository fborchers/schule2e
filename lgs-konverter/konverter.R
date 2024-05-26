# Lade die verwendeten Pakete:
library(stringr)
library(MASS)

# Sub-Routine für den LaTeX-Code:
printNum = function(x) {
	if (abs(x)==1) ' '
	else abs(x)
}

# Sub-Routine für den LaTeX-Code:
printEntry <- function(j,i,df){
  if (df[j,i]==0) 
  {entry = str_c("&  & ",strrep(" ",str_length(names(df)[i])+1))
  } else if (i==1)  {
    vorz = if (df[j, i] >= 0) ' ' else '-'
    entry <- str_c("& ", vorz,"& " , printNum(df[j, i]), names(df)[i])
  } else {
    vorz = if (df[j, i] >= 0) '+' else '-'
    entry <- str_c("& ", vorz,"& " , printNum(df[j, i]), names(df)[i])
  }
  entry
}

# Definiere Routine für die Berechnung:
LGSconvert = function(df) {
    m = nrow(df); n = ncol(df)
    A = as.matrix(df[, 1:(n-1)])
    b = as.matrix(df[, n])

    # Lösung berechnen:
    s = try(solve(A, b), silent=TRUE)
    # Exception Handling falls nicht eindeutig lösbar:
    if (inherits(s, "try-error")) {
        cat("\tError: keine eindeutige Lösung.", '\n')
    } else {# falls eindeutige Lösung besteht:
      cat("Lösung des Gleichungssystems :\n")
      for (i in 1:(n-1)) {
        vorz = try(if (s[i] >= 0) ' ' else '-')
        cat('\t',names(df)[i], "  =  ",vorz,try(sprintf("%.3f",abs(s[i]))), "  =  ", try(as.character(fractions(s[i]))), '\n')
      }
    }

    # In jedem Fall wird der LaTeX-Code erzeugt:
    cat("% TeX Ausdruck des Gleichungssystems : \n")
    # Konstruiere die Ausgabematrix L. Initialisiere sie mit "character":
    L = character(m)
    for (j in 1:m) { # für jede Zeile des "data frame" df:
      line = '\t'
      # erzeuge die Zeile aus den einzelnen Einträgen:
      for (i in 1:(n-1)) {
        # printEntry ist oben definiert:
        line = str_c(line, printEntry(j,i,df))
      }# Ende der inneren for-Schleife.
      # Füge die rechte Seite der Gleichung hinzu:
      vorz = if (df[j, n] >= 0) ' ' else '-'
      # printNum ist oben definiert:
      L[j] = str_c(line, "\t&==& ",vorz,"& ",printNum(df[j, n]), '\t&', if(j!=m)('\t\\\\'))
    }# Ende der äußeren for-Schleife.
    cat("\\begin{equation*}\n")
    cat("\\begin{lgs}{",n-1,"}{1}\n",sep="")
    cat(L,"\\end{lgs}", sep='\n')
    cat("\\end{equation*}\n")
}


## Lies die Tabelle mit den Einträgen des LGS aus Datei:
LGS <- read.table("INPUT.txt", header = TRUE, sep="\t",fill=TRUE)

# Ersetze fehlende Einträge durch Nullen:
LGS[ is.na(LGS)] <- 0

# Lass die oben definierte Routine laufen, um das LGS zu lösen
# und den LaTeX-Code auszudrucken:
LGSconvert(LGS)





