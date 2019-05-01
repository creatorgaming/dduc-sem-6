data = read.csv(file = 'ques13.csv',header = TRUE)
#View(data)
y = data$house_value
x1 = data$total_rooms
x2 = data$total_bedrooms
x3 = data$population
x4 = data$households

relation = lm(y~x1+x2+x3+x4)
print(summary(relation))

print("Predicting Values")

prediction = data.frame(x1 = 919,x2 = 213,x3 = 413,x4 = 193)
print(predict(relation,prediction))
plot(x=x1+x2+x3+x4,y=y,col=2)
abline(relation)