remove_na <- function(data){
  for(i in 1:ncol(data)){
    test = tryCatch({
      data[i][is.na(data[i])] <- colMeans(data[i],na.rm = TRUE)},
      error = function(cond){
        temp <- table(data[i])
        data[i][is.na(data[i])] <- names(temp[temp == max(temp)])
      })
  }
  return(data)
}

data = read.csv(file = 'iris.csv',header = TRUE)
data = remove_na(data)
View(data)