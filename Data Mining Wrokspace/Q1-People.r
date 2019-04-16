# including liberary
library(dplyr)
library(editrules)

# read data from people.csv
people <- read.csv("datasets/People.csv", header=TRUE)
print(people)

# implementing filter rules using rules.txt
# rules <- editfile('Q1-rules.txt', 'all')
# filtered <- violatedEdits(rules, people)

# apply fiters to the data
filtered <- people%>%filter(Age>=0)%>%filter(Age<=150)%>%filter(Age>yearsmarried)%>%filter(status%in%c('married','single','widowed'))%>%filter((Age<18&agegroup=='child')|(Age>18&Age<65&agegroup=='adult')|(Age>65&agegroup=='elderly'))

# get summary of the filtered results
summary(filtered)

# visualize filtered data
# filtered
print("Filtered ... ")
print(filtered)
plot(filtered)