#Cluster Analysis 
str(mtcars)
View(mtcars)
#Clustering of objects
Mdistancia<-dist(mtcars, method="euclidian")
hc = hclust(Mdistancia, method="complete") #single would also be an option
plot(hc,hang=-1, main="Euclidean distance/furthest neighbor", cex=0.7, labels=hc$order)
rect.hclust(hc, k=3,border = "blue")



#k=3 clusters
groups=cutree(hc,k=3)
pca=prcomp(mtcars, scale=T)
str(pca)
pca$x
plot(pca$x[,1:2], type="n")
text(pca$x[,1:2], rownames(mtcars), col=groups)

table(groups)
str(hc) 
hc$order
hc$merge
mtcars
 
#Clustering of Variables
a=cor(mtcars); a
b=sqrt(1-a^2) ; b
c=as.dist(b,diag = FALSE,upper = FALSE); c
res=hclust(c,method ="average")
plot(res)
rect.hclust(hc, k=3,border = "blue")
#Cluster Evaluation based on external (ARI) and internal measures
#EXternal

#Comparing with vs
library(fpc)
groups=cutree(hc,k=2)
res=cluster.stats(Mdistancia,clustering=groups, alt.clustering=mtcars$vs +1)
res

library(cluster)
groups=cutree(hc,k=3)
plot(silhouette(groups, Mdistancia),col= c("blue", "purple","brown"))

#k-means
Twogroups<-kmeans(mtcars, 2)
Twogroups

#Visualizing the groups in a 2-dimensional reduced space:
str(Twogroups)
a=prcomp(mtcars, scale=T)
plot(a$x[,1:2], col = Twogroups$cluster, pch=19, 
     main="kmeans, 2 groups")


### Biclustering
#Bimax (binary data)
# See http://www.kemaleren.com/post/bimax/
install.packages("biclust")
library(biclust) 

#To find 0-BICLUSTERS:
str(mtcars)
mpgBin=ifelse(mtcars$mpg<mean(mtcars$mpg),0,1)
cylBin=ifelse(mtcars$cyl<mean(mtcars$cyl),0,1)
Newdata=data.frame(mpgBin,cylBin,mtcars$vs,mtcars$am)
str(Newdata)
for (i in 1:dim(Newdata)[2]) { Newdata[,i]<-1-Newdata[,i]}
NewdataM=as.matrix(Newdata)
bics <- biclust(x=Newdata, method=BCBimax(), minr=5, minc=3, number=3)
(GroupsBic=bicluster(Newdata, bics))


#Now find 1-BICLUSTERS:



#Explore:
biclusternumber(bics)
biclusternumber(bics)$Bicluster1
