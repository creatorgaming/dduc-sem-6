x = matrix(sample(-100:100,size = 25,replace = TRUE),nrow = 5,ncol = 5)
print(x)

print("Absolute Values...")
print(abs(x))

print(paste("Maximum Element in Matrix",max(x)))
print(paste("Minimum Element in Matrix",min(x)))

print("Removing 2nd Row...")
print(x[-2,])

print("Removing 3rd Column...")
print(x[,-3])

print("Adding New Column...")
print(cbind(x,sample(100:200,size = 5)))

print("Adding New Row...")
print(rbind(x,sample(100:200,size = 5)))