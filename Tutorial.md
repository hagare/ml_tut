---
# Machine Learning Tutorial R
Note: Notes from learning to use machine learning related libraries in R language

---
# Pre-requisite material
---
# Functions
~~~~
functionName <- function(variable) {
# code
}
~~~~
---
# Iterating through vectors
---
## lapply function for lists
### lapply: Loops over a list and evaluates a function on each element
~~~~
nums <- list(l1=1:10, l2=1000:1020)
lapply(nums, mean)
# $l1
# [1] 5.5
#
# $l2
# [1] 1010
~~~~
---
## sapply: A simplified version of lapply
~~~~
nums <- list(l1=1:10, l2=1000:1020)
sapply(nums,mean)
#     l1     l2
#     5.5 1010.0
~~~~
---
## apply: Evaluates a function on the boundaries or margins of an array
### apply function to matrix 
+ Parameters: 
 + 1 = apply over rows 
 + 2 = over columns

~~~~
mat <- matrix(rnorm(20),nrow=5,ncol=4)
#            [,1]        [,2]       [,3]       [,4]
# [1,]  0.04248826  1.69924746 -0.3258585 -0.5014681
# [2,] -0.86833508  1.99637701 -1.4474824 -0.4184621
# [3,] -0.27119420 -0.08240786  0.5324561 -1.3789504
# [4,]  0.18199014 -1.07104965 -1.0066302  0.2427773
# [5,] -0.55551371  0.15203700  0.7170935  0.8453537

apply(mat,1, sum)
# [1]  0.9144091 -0.7379026 -1.2000965 -1.6529124  1.1589704

apply(mat,2,sum)
# [1] -1.470565  2.694204 -1.530422 -1.210750
~~~~
---
# tapply: Evaluates a function over subsets of a vector
~~~~
data <- c(1:10,rnorm(10,2),runif(10))

groups <- gl(3,10) # generate factor list of size each
# [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3
# [30] 3
# Levels: 1 2 3

tapply(data, groups, mean)
# 5.5000000 2.1327121 0.4527755

tapply(data,groups, mean,simplify=FALSE)
# $`1`
# [1] 5.5
# $`2`
# [1] 2.132712
# $`3`
# [1] 0.4527755
~~~~
---
# mapply: 
### A multivariate version of lapply used to evaluate a function in parallel in an elegant way
~~~~
#ex long way
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)
~~~~

---
# Definitions
---
## Machine learning
+ an intersection of elements from the fields of computer science, statistics, and mathematics, which uses concepts from artificial intelligence, pattern detection, optimization, and learning theory to develop algorithms and techniques which can learn from and make predictions on data without being explicitly programmed.
---
## Supervised machine learning algorithms: ex: classification, regression.
+  Supervised learning algorithms try to model relationships and dependencies between the target prediction output and the input features such that we can predict the output values for new data based on those relationships which it learned from the previous data sets.
---
## Unsupervised machine learning algorithms
+  ex: clustering, association rule learning
---
# Popular packages in R
+ *caret:* classification and regression training to build predictive models
+ randomForest: random forest algorithm for classification and regression
+ rpart: recursive partitioning and decision trees
+ glmet: lasso and elastic-net regularized regression models
+ e1071: fourier transforms, clustering, support vector machines, and other supervised/unsupervised machine learning algorithms
+ party: recursive partitioning
---
# Popular packages in R (cont.)
+ arules: association rule learning
+ recommenderlab: build recommendation engines
+ nnet: predictive modeling using neural networks
+ h2o: fast and scalable algorithms including gradient boosting and deep learning
--- 
# Handling Data
---
## Date handling
### manipulate different date formats
~~~~
require(lubridate)
data(lakers)
df<- lakers #make copy of df
str(df$date)
playdate <- df$date[1]
playtime <- df$time[1]
playdatetime <- paste(playdate, playtime)
playdatetime <- parse_date_time(playdatetime, "%y-%m-%d %H.%M")
class(playdatetime)
df$date <-ymd(df$date)
df$PlayDateTime <- parse_date_time(paste(df$date,df$time),"%y-%m-%d %H.%M")
str(df$PlayDateTime)
~~~~
---
## Binary Categorical Variables
### convert categorical data into table of binary numbers
~~~~
species_cat <- levels(iris$Species)
species_cat
binarySpecies <- function(c) {return(iris$Species == c)}
newVars <- sapply(species_cat, binarySpecies)
newVars[50:55,]
colnames(newVars) <- species_cat
bin_matrix <- cbind(iris[,c('Species')], newVars)
bin_iris <- iris
bin_iris$setosa <- bin_matrix[,2]
bin_iris$versicolor <- bin_matrix[,3]
bin_iris$virginica <- bin_matrix[,4]
names(bin_iris)
~~~~
---


