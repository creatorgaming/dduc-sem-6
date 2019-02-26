library(dplyr)
library(editrules)
data <- read.csv("datasets/dirty_iris.csv")
attach(data)

#Part - 1
complete_iris <- sum(complete.cases(data))
print("No of obervations which are complete :- ")
complete_iris

per_complete_iris <- (complete_iris/count(iris))*100
print("%age of obervations which are complete :- ")
per_complete_iris

#Part - 2
col_names <- names(data)
table(col_names)
for(col in col_names){
  if(class(data[,col]) == 'numeric' || class(data[,col]) == 'integer') {
      data[(!is.na(data[,col]) & (data[,col] > 20 | data[,col] < 0)), col] = NA
  }
}
print(data)

#Part - 3
rules_dirty_iris <- editfile('Q2-rules.txt', 'all')
rules_dirty_iris

#Part - 4
filtered_dirty_iris <- violatedEdits(rules_dirty_iris, data)
plot(filtered_dirty_iris)
summary(filtered_dirty_iris)

#Part - 5
outliers <- boxplot.stats(Sepal.Length)
boxplot(outliers)
