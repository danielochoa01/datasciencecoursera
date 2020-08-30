source('pollutantmean.R')

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  df = data.frame()
  for(i in id) {
    if (i < 10) {
      filename = paste(paste('00', as.character(i), sep = ''), 'csv', sep = '.')
    } else if (i >= 10 & i < 100) {
      filename = paste(paste('0', as.character(i), sep = ''), 'csv', sep = '.')
    } else {
      filename = paste(as.character(i), 'csv', sep = '.')
    }
    file = paste(directory, filename, sep='/')

    temp = read.csv(file)
    
    df = rbind(df, temp)
  }
  
  return(mean(df[, pollutant], na.rm = T))
}

