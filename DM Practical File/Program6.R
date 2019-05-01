library(dbscan)
data(iris)

#kmeans
#centers = 5
k= kmeans(iris[,-5],5)  #kmeans function creates clusters of the data provided and the number of centroids  
cat('SSE of the model with 5 : ',k$tot.withinss,'\n')
plot(iris[,-5],col= k$cluster)  

#centers = 6
k= kmeans(iris[,-5],6)  #kmeans function creates clusters of the data provided and the number of centroids  
cat('SSE of the model with 6 : ',k$tot.withinss,'\n')
plot(iris[,-5],col= k$cluster)  


#centers = 7
k= kmeans(iris[,-5],7)  #kmeans function creates clusters of the data provided and the number of centroids  
cat('SSE of the model with 7 : ',k$tot.withinss,'\n')
plot(iris[,-5],col= k$cluster)  

#hierarchical method
h1 = hclust(dist(iris[1:50,-5]),method = 'complete') #Produces the hierarchical clusters of the data on the basis of their minimum distance
h2 = hclust(dist(iris[1:50,-5]),method = 'single') #Produces the hierarchical clusters of the data on the basis of the minimum distance distance
plot(h1)
plot(h2)

#DBscan method
db =  dbscan(iris[,-5], eps = .5, minPts = 5) #It produces density based clustering where radius is .5 and minimum closest points are 5
plot(iris[,-5],col=db$cluster)
