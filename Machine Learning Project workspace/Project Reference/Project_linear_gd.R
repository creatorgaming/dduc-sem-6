#Using gradient descent we find the best values of parameters 
# We use Concrete_Data dataset where CCS (Concrete compressive strength) is the response and Age,Cement and Blast Furnace Slage are predictors  

data<-read.csv('Concrete_Data.csv')

m1=0
m2=0
m3=0
c=0
L=0.05   #learning rate 

cat("M1",1," : ",0)
cat("\tM2",1," : ",0)
cat("\tM3",1," : ",0)
cat("\tC",1," : ",0)

nrows=nrow(data)

#normalizing Cement attributes
mini= min(data$Cement)   
maxim= max(data$Cement)
data$Cement = (data$Cement - mini)/(maxim-mini)

#normalizing CSS attributes
mini= min(data$CCS)
maxim= max(data$CCS)
data$CCS = (data$CCS - mini)/(maxim-mini)

#normalizing Blast.Furnace.Slag attributes
mini= min(data$Blast.Furnace.Slag)
maxim= max(data$Blast.Furnace.Slag)
data$Blast.Furnace.Slag= (data$Blast.Furnace.Slag - mini)/(maxim-mini)

#normalizing Age attributes
mini= min(data$Age)
maxim= max(data$Age)
data$Age= (data$Age - mini)/(maxim-mini)




data$Cement=round(data$Cement,2)
data$CCS=round(data$CCS,2)
data$Blast.Furnace.Slag=round(data$Blast.Furnace.Slag,2)
data$Age=round(data$Age,2)

#We find TSS 
y_mean= mean(data$CCS)
tss=sum((data$CCS-y_mean)^2)


for (j in 1:10) {
  predicted= c+m1*data$Cement+m2*data$Blast.Furnace.Slag+m3*data$Age
  error= data$CCS - predicted 
  
  Dm1=(-2*sum(error*(data$Cement)))/nrows  #partial derivative with respect to m1
  
  Dm2=(-2*sum(error*(data$Blast.Furnace.Slag)))/nrows  #partial derivative with respect to m1
  
  Dm3=(-2*sum(error*(data$Age)))/nrows  #partial derivative with respect to m1

  Dc= (-2)*sum(error)/nrows  #partial derivative with respect to C
  
  mse=sum(error^2)/nrows  #mean squared error
  rss=sum(error^2)
  
  r_square=1-(rss/tss)
  final_error=1-r_square
  m1<-m1-L*Dm1
  m2<-m2-L*Dm2
  m3<-m3-L*Dm3
  c<-c-L*Dc
  m1= round(m1,4)
  m2= round(m2,4)
  m3= round(m3,4)
  c= round(c,4)
  cat("\trss:",j," : ",rss)
  cat("\tr^2:",j," : ",r_square)
  cat("\tError:",j," : ",final_error)
  cat("\nM1",j+1," : ",m1)
  cat("\tM2",j+1," : ",m2)
  cat("\tM3",j+1," : ",m3)
  cat("\tC",j+1," : ",c)
}