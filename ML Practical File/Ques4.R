single = array(data = rep(0,10))
print(single)

double = matrix(sample(1:999,size = 100,replace = TRUE),nrow = 10,ncol = 10)
print(double)

diagonal = diag(6,nrow = 5,ncol = 5)
print(diagonal)
