## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!

pollutantmean <- function(directory, pollutant, id = 1:332) {
	#Concatenate source
	dir_contents<-paste(directory, "/", dir(directory), sep = "") 
    
	  #Get the pollutant type
	  selection = pollutant
	  #Converter
	  g_data <- c()
	  	
	  switch (selection, sulfate = 2, nitrate = 3 )
 	  
	  		
	  #Iterate through values
	  for ( f in id ){
		get_pdata<-read.csv(dir_contents[f], sep = "," ) 
    		#Choose the pollutant to display
		pdata <- get_pdata[,selection]
		pdata <- pdata[!is.na(pdata)]
		g_data <- c(g_data, pdata)
  	 }  
  
  mean(g_data)
 
}
