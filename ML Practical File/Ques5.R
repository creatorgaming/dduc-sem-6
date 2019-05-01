double = as.matrix(read.csv(file = 'input.csv',header = FALSE))
print(double)

print(paste("Number of Rows : ",nrow(double)))
print(paste("Number of Column : ",ncol(double)))

write.csv(double,file = "output.csv")