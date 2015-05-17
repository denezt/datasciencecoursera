## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases


complete <- function(directory, id = 1:332) {
    #Concatenate source
    
    dir_contents<-paste(directory, "/", dir(directory), sep = "") 
    #Correlation converter
    nobs <- c()
    
    #Iterate through values
    for ( incr in id ){
        complete_data <-read.csv(dir_contents[incr])
        cd <- complete_data[complete.cases(complete_data),] 
        nobs <- c(nobs, nrow(cd))
    }
    
    return( data.frame(cbind(id,nobs)))
    
}

