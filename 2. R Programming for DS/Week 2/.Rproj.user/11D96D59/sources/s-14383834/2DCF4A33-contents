source('complete.R')
source('corr.R')

corr <- function(directory, threshold = 0) {
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs >= threshold, ]
  
  cor_results <- numeric(0)

  if (nrow(complete_cases) > 0) {
    for(i in complete_cases$id) {
      if (i < 10) {
        filename = paste(paste('00', as.character(i), sep = ''), 'csv', sep = '.')
      } else if (i >= 10 & i < 100) {
        filename = paste(paste('0', as.character(i), sep = ''), 'csv', sep = '.')
      } else {
        filename = paste(as.character(i), 'csv', sep = '.')
      }
      file = paste(directory, filename, sep='/')
      
      temp = read.csv(file)
      
      temp = temp[complete.cases(temp), ]
      
      cor_results <- c(cor_results, cor(temp['sulfate'], temp['nitrate']))

    }
  }
  return (cor_results)
}
