
# Cheat sheet aimed at assesment tests
# Estatistica multivariada
# Script for Chapter: PCA, FA, CA and biclustering


########################################
########################################
#
#Chapter:  PCA
#
#(Illustration using FoodPriceUSA.txt)
########################################
########################################
#READ THE DATA:
dados<-read.table("FoodPriceUSA.txt",sep="\t",dec=",",header=TRUE)
dados
# Remove first column (it contains the names of each row)
dadosx<-dados[,-1]
rownames(dadosx)<-dados[,1]
dadosx


# PCA with raw data (non-standardized or non normalized) 
res1=prcomp(dadosx)   # Note: prcomp works with centered data by default
res1
( sum.res1=summary(res1) )

# Transformed data matrix: each individuals described by the new PCs:
res1$x

# Plot of the database on the space defined by the two first components 
par(mfrow=c(1,2))
plot(res1$x[,1],res1$x[,2], type="n", xlab=paste(" CP1  (", (round(100*sum.res1$importance[2,1],digits=1)), " % )"),
ylab=paste(" CP2  (", (round(100*sum.res1$importance[2,2],digits=1)), " % )"), main="ACP (dados n�o normalizados) FoodPrice.xls")
text(res1$x[,1:2],lab=rownames(dadosx))


# PCA with normalized data
prcomp(dadosx, scale=TRUE)

# Correlation between origanl variables and PCs
cor(dadosxNormMatrix,res1$x)

# Construct a biplot de um biplot usando a fun��o "biplot"
# biplot perserving the column metric (= classic biplot cl�ssico= Gabriel's biplot)
a=prcomp(dadosx)
b=summary(a)
biplot(a,choices=1:2, pch=15, cex=0.8,cex.axis=0.7,arrow.len = 0.05,xlab=paste(" CP1  (", (round(100*b$importance[2,1],digits=1)), " % )"),
ylab=paste(" CP2  (", (round(100*b$importance[2,2],digits=1)), " % )"),var.axes=TRUE, scale=1,  main="biplot cl�ssico")




########################################
########################################
#
#Chapter: Factorial Analysis
#
#(Illustration using DadosGarciaMarques2004.sav)
########################################
########################################
#READ DATA:
	install.packages("foreign")
	library(foreign)  # for reading data stored by SPSS (format .sav)

data<-read.spss("DadosGarciaMarques2004.sav", to.data.frame = TRUE)

#######
#Prepare the data
#Consider only rows with values for all the variables:
datax <- data[complete.cases(data), ]

# remove the first column (it is not a variable)
dados=data[,-1]

#######
#factorial model
	install.packages("psych")
	library(psych)
	install.packages("GPArotation")
	library(GPArotation)

###
#Extract the factors via PCA:
#for original/non-normalized data
###
rMatrix<-cov(dados)
#Obtain the loadings
(AF<-principal(rMatrix, nfactors = 2,residuals = TRUE, rotate = "quartimax", covar=TRUE) )
#NOTA: "rotate" can be: "none", "varimax", "quartimax", "promax", "oblimin", "simplimax", "cluster"
print(AF,cut=0.3,digits=3) # to see the loading matrix with loadings >0.3 in order to
				   # make easy the interpretation of each factor. 
###
#for normalized data
rMatrix<-cor(dados)

########
#Obtain estimates of the factor scores
factor.scores(dados, f=AF , method = c("Bartlett"))

########
#Extract the factors via ML (Maximum Likelihood)
AFmv=factanal(dados, factors=2, scores = c("Bartlett"), rotation = "varimax"); AFmv
#NOTA: "rotation" can be: "none" or others (do: ?factanal).
str(AFmv)

########
#Obtain estimates of the factor scores (2 different manners:)
AFmv$scores
factor.scores(dados, f=AFmv, method = c("Bartlett"))


########

	install.packages("nFactors")
	library(nFactors) # to help determine the number of factors/components to retain
#Rules to suggest the number of factor to retain in the factor model:
parallelAnalysis<-nScree(rMatrix)
parallelAnalysis
plotnScree(parallelAnalysis)

#Evaluate the adequacy of the factorial model
# KMO and MSA
print(KMO(dados),digits=3)

# Bartlett's test
cortest.bartlett(cor(dados),n=nrow(dados))

#Comparing the observed correlation matrix and the
# correlation matrix estimated by the model:
mat=AF$residual

diag(mat)= rep(100,dim(AF$residual)[1])   # Substitute the diagonal by a high number .
mat
a=length(which( abs(mat) <0.05)) # Frequency if AF$residual <0.05 (lower and upper the diagonal)
b=(dim(mat)[1])*(dim(mat)[1]-1)
    a *100 /b  # % of AF$residual<0.05
    


########################################
########################################
#
#Chapter: Clusters Analysis
#
#(Illustration using dieta.txt)
########################################
########################################
#READ THE DATA:
dados=read.table("dieta.txt",sep="\t", header=TRUE)
dadosx=dados[,3:4]

#Visualization (in a 2-dimensional space)
plot(dadosx, main="dados dieta", xlab="before", ylab="after")


###################################
#  Hierarchical methods:
###################################
Mdistancia<-dist(dadosx, method="euclidian")
#NOTE: In "method" the distance can be:
# "euclidean", "maximum", "manhattan", "canberra", "binary", "minkowski"

hc = hclust(Mdistancia, method="complete")
#NOTE: In "method", the linkage critetion can be:
#"ward.D", "ward.D2", "single", "complete", "average", "mcquitty", "median", "centroid"

str(hc) 
hc$order
hc$merge

plot(hc,hang=-1, main="Distancia euclideana, vizinho-mais-afastado")

#Visualize the clusters in the plot from any hierarchical methods: Which cluster each individual belongs to:
rect.hclust(hc,k=2)   

#Identify the clusters
grupo=cutree(hc, 2) 
grupo

# Number of element in each cluster
table(grupo)

######################################
# Non-hierarchical methods:
######################################
G2<-kmeans(dadosx, 2)
G2

#Visualize the clusters from k-means:
str(G2)
a=prcomp(dadosx)
plot(a$x[,1:2], col = G2$cluster, pch=19, main="kmeans, 2 grupos")
#OR
plot(dadosx, main="dados dieta", xlab="before", ylab="after", col=G2$cluster, pch=20)
points(G2$centers, pch=3, col="blue") # insert the centroides

###########
# Clusters evaluation
###########
		install.packages("fpc")
		library(fpc)
#Example from k-means (similar from hierarchical methods) 
res=cluster.stats(dist(dadosx),clustering=G2$cluster, alt.clustering=gender + 1)
res

#ARI and Silhouette
resultadoIndices=matrix(c(res$corrected.rand,res$avg.silwidth),byrow=TRUE,1,2)
colnames(resultadoIndices)=c("ARI","avg.Silhw")
round(resultadoIndices, 3)

#Visualize the Silhouette using a graph (por exemplo, dos cluster obtidos no k-medias)
#Example from k-means (similar from hierarchical methods) 
		install.packages("cluster")
		library(cluster)
D <- daisy(dadosx)
plot(silhouette(G2$cluster, D),col= c("blue", "purple"))

(D can be substitute by Mdistancia)

######################################
#Clustering of Variables
#
#(Illustration using mtcars from R)
######################################
str(mtcars)
a=cor(mtcars); a
b=sqrt(1-a^2) ; b
c=as.dist(b,diag = FALSE,upper = FALSE); c
res=hclust(c,method ="average")
plot(res)


######################################
# Biclustering using Bimax
#
#(Illustration using mtcars from R)
######################################
str(mtcars)
install.packages("biclust")
library(biclust) 

#To find 0-BICLUSTERS:
str(mtcars)
mpgBin=ifelse(mtcars$mpg<mean(mtcars$mpg),0,1)
cylBin=ifelse(mtcars$cyl<mean(mtcars$cyl),0,1)
Newdata=data.frame(mpgBin,cylBin,mtcars$vs,mtcars$am)
str(Newdata)
#for (i in 1:dim(Newdata)[2]) { Newdata[,i]<-1-Newdata[,i]}
NewdataM=as.matrix(Newdata)
bics <- biclust(x=Newdata, method=BCBimax(), minr=5, minc=3, number=3)
(GroupsBic=bicluster(Newdata, bics))


#Now find 1-BICLUSTERS:

#Explore:
biclusternumber(bics)
biclusternumber(bics)$Bicluster1

