#linear regression model on concrete data
data = read.csv("Concrete_Data.csv")
size=nrow(data)*(0.75)
t=sample(1:nrow(data),size)

train = data[t,]

test = data[-(t),]

lm_model= lm(CCS~.,data = train)

#plot(Boston$lstat,Boston$medv,xlab = "Variable",ylab = "response")
#abline(lm_model)
pred= predict(lm_model,test[,-9])

residual= c()
pred_v=c()

for(i in 1:nrow(test))
{
  t= abs(test[i,9]-pred[i])
  residual= c(residual,t)
  pred_v= c(pred_v,pred[[i]])
}

plot(pred_v,residual,xlab = 'Predicted',ylab = 'Residual')
print(summary(lm_model))