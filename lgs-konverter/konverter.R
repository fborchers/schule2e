library(stringr)
library(MASS)

printNum = function(x) {
	if (abs(x)==1) ' '
	else abs(x)
}

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


LGSconvert = function(df) {
    m = nrow(df); n = ncol(df)
    A = as.matrix(df[, 1:(n-1)])
    b = as.matrix(df[, n])
    s = try(solve(A, b))

    cat("Lösung des Gleichungssystems :\n")
    for (i in 1:(n-1)) {
      vorz = try(if (s[i] >= 0) ' ' else '-')
      cat('\t',names(df)[i], "  =  ",vorz,try(sprintf("%.3f",abs(s[i]))), "  =  ", try(as.character(fractions(s[i]))), '\n')
    }
    cat('\n')
   
    cat("% TeX Ausdruck des Gleichungssystems : \n")
    # Construct output in matrix L. Initialise with character:
    L = character(m)
    for (j in 1:m) { # for each line of data frame df:
      line = '\t'
      # construct the line from the single entries:
      for (i in 1:(n-1)) {
        line = str_c(line, printEntry(j,i,df))
      }
      # add the right hand side of the equation
      vorz = if (df[j, n] >= 0) ' ' else '-'
      L[j] = str_c(line, "\t&==& ",vorz,"& ",printNum(df[j, n]), '\t&', if(j!=m)('\t\\\\'))
      # print(L[j])
    }# end for.
    cat("\\begin{equation*}\n")
    cat("\\begin{lgs}{",n-1,"}{1}\n",sep="")
    cat(L,"\\end{lgs}", sep='\n')
    cat("\\end{equation*}\n")
}

## Read the table with the LGS from file:
LGS <- read.table("INPUT.txt", header = TRUE, sep="\t",fill=TRUE)

# Replace missing entries with 0:
LGS[ is.na(LGS)] <- 0

# Run the routine to solve and print:
LGSconvert(LGS)





