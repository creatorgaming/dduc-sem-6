x = matrix(sample(1:200,size = 25,replace = TRUE),nrow = 5,ncol = 5)
y = matrix(sample(1:200,size = 25,replace = TRUE),nrow = 5,ncol = 5)

print("Addition...")
print(x+y)

print("Subtraction...")
print(x-y)

print("Multiplication...")
print(x*y)

print("Divition")
print(x/y)

print("Row 2...")
print(x[2,])

print("Column 4...")
print(x[,4])