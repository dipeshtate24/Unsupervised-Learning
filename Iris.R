#### Import data
iris=data.frame(iris)
iris
attach(iris)
iris1=iris[,-5]
iris1
str(iris)
#### Load library
library(ggplot2)
library(factoextra)
library(patchwork)

###Plot
ggplot(iris,aes(x=Petal.Length,y=Petal.Width,col=Species))+
geom_point()

#### How do you find the optimum number of clusters for K Means? 
###How does one determine the value of K?
# Finding the optimum number of clusters for k-means classification
fviz_nbclust(iris1,kmeans,method="wss")+
geom_vline(xintercept = 0, linetype=2)+  #change the intercept 3
labs(subtitle = "Elbow Method")



#######
d=dist(iris1)
d
hc=hclust(d)
hc
plot(hc)
rect.hclust(hc,k=3,border = "red")#mark the cluster by rectangle





## Applying kmeans to the dataset / Creating the kmeans classifier
KM=kmeans(iris1,3)
KM
table(iris$Species,KM$cluster)
data=KM$centers[,-3:-4]
data=data.frame(data)
data
### Plot
#P=ggplot(iris,aes(x=Petal.Length, y=Petal.Width,col=KM$cluster))+
  #geom_point()
#P

#### Visualizing the clusters - On the first two columns
KM$cluster <- as.factor(KM$cluster)
p1=ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width,col= KM$cluster))+
geom_point()
p1

#### Plotting the centroids of the clusters
p2=p1+geom_point(data=data,aes(Sepal.Length,Sepal.Width),color='blue')
p2
