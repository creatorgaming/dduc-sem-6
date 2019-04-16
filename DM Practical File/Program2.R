library(editrules)
myDataFrame<-read.csv('/run/media/thecreator/Personal Data/Github/dduc-sem-6/DM Practical File/dirty_iris.csv')
attach(myDataFrame)
c = sum(complete.cases(myDataFrame))
cat("\n Number of complete observations : ", c)
cat("\n Number of complete observations in % : ",
    c/(dim(myDataFrame)[1])*100)
columnNames=names(myDataFrame)
print(columnNames)
for(columnName in columnNames){
  if(class(myDataFrame [,columnName])=='integer' || class(myDataFrame[,columnName])=='numeric'){
    myDataFrame[!is.na(myDataFrame[,columnName]) & (myDataFrame[,columnName]>20 |
                                                      myDataFrame[,columnName]<0),columnName]=NA
  }
}
myRules<-editfile(file='/run/media/thecreator/Personal Data/Github/dduc-sem-6/DM Practical File/ruleset.txt')
E<-violatedEdits(myRules,myDataFrame)
print(E)
plot(E)
boxplot_stat=boxplot.stats(myDataFrame$Sepal.Length)
out = boxplot_stat$out
cat('List of outliers : ',out)
boxplot(boxplot_stat$stats)

