library(BBmisc)
wineData=read.csv("/run/media/thecreator/Personal Data/Github/dduc-sem-6/DM Practical File/wine.csv")
normalizeData=normalize(wineData)
print(normalizeData)
getMean=colMeans(normalizeData)
print(getMean)

irisData=as.data.frame(iris)
irisData=irisData[,-5]
irisData
normalizeData1=normalize(irisData)
print(normalizeData1)
getMean1=colMeans(normalizeData1)
print(getMean1)