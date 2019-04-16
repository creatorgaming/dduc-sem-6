library(arules)
MyData = read.csv('/run/media/thecreator/Personal Data/Github/dduc-sem-6/DM Practical File/groceries.csv')
print('For minimum support : 0.5 and confidence : 0.75')
rules= apriori(MyData, parameter= list(supp=0.3,conf=0.3,target="rules") ) 
summary(rules)
inspect(head(rules))
print('For minimum support : 0.6 and confidence : 0.6')
rules= apriori(MyData, parameter= list(supp=0.6,conf=0.6,target="rules") ) 
summary(rules)



