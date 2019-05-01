print("For Loop ")
for(i in 1:10){
  x = ''
  for(j in 1:i){
   x = paste(x,j)
  }
  print(x)
}

print("While Loop")
i = 1
while(i <= 10){
  x = ''
  j = 1
  while(j <= i){
    x = paste(x,j)
    j=j+1
  }
  print(x)
  i =i+1
}