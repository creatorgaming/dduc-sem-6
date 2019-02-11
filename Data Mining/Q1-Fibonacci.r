array <- c(0,1)
cat("Enter number : ")
number <- as.integer(readLines('stdin', n = 1))
number <- 4
cat("Fibonacci Series upto ", number ," itterations is : \n")
cat(array[1],"", array[2]," ")

i <- 2
while(i < number && number >= 2){
  temp <- array[i] + array[i-1]
  cat(temp, " ")
  i <- i+1
  array[i] <- temp
}
