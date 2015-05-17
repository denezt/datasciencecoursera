## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
## Return a numeric vector of correlations
## NOTE: Do not round the result!

#Correlation converter
r2 <- c()

corr <- function( directory, threshold = 0 ) {
    flist<-paste(directory, "/", dir(directory), sep = "") 
    
    
    for ( nfile in flist ){
        nfile_contents <- read.csv(nfile, sep = ",")	
        nfile_record <- nfile_contents[complete.cases(nfile_contents),]
        if ( nrow(nfile_record) > threshold ){
            r2 <- c(r2, cor(nfile_record$sulfate, nfile_record$nitrate))
        }	
        
    }

    #Output
    r2
    
}
