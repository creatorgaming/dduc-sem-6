vec = sample(-100:100,size = 25)
dim(vec) = c(5,5)
print(vec)

vec1 = t(vec)
print("Transpose of a Matrix...")
print(vec1)

print("Addition...")
print(vec+vec1)

print("Multiplication...")
print(vec*vec1)