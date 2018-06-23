# Simple Example of KNN model using iris dataset
# K-Nearest Neighbors or KNN algorithm uses the principle that similar things have similar properties.
# A supervised learning algorithm used to classify based on a chosen similarity measure
# similarity measure. One measure is euclidean distance: Euclidean - distance(p,q) = sqrt(sum i=1 to n (qi -pi)^2)
# others include Manhattan, Cosine, Minkowski

# Common practice k is sqrt(training instancese) usually bw 3 and 10

# Normalization: x_new = (x - min(x))/ (max(x) - min(x))

# Steps too execute KNN
# 1. Collect data and explore
# 2. Normalize data
# 3. Create training (~2/3 of sample) and test data sets (~1/3 of sample)
# 4. Train the model
# 5. Evaluate the model. Using a confusion matrix 

### 1. Collect data and explore
# Explore dataset iris
head(iris)
str(iris)
summary(iris)

# Visualize using ggplot2
require(ggplot2)
ggplot(iris, aes(Petal.Length,Petal.Width,pch=Species))+geom_point()

### 2. Normalize data by scaling
# Create normalization function
min_max_normalizer <- function(x) {
num <- x - min(x)
denom <- max(x) - min(x)
return (num/denom)
}

normalized_iris <-as.data.frame(lapply(iris[1:4],min_max_normalizer))
summary(normalized_iris)

### 3. Create training and test data sets using sample()
table(iris$Species)

#set seed for repeatable randomization
set.seed(1234)

# Split data into 67% training adn 33% for testing
random_samples <- sample(2, nrow(iris), replace=TRUE, prob=c(.67,.33)) # Create an index to identify random sampling between 2 groups

### 4. Training data set
iris.training <- iris[random_samples==1,1:4]

# Training label
iris.trainLabels <- iris[random_samples==1,5]

# Testing data set
iris.testing <-iris[random_samples==2,1:4]

# Testing label
iris.testingLabel <- iris[random_samples==2,5]

# Training the model
# Use the class library to call KNN function takes input of train, test, class (vector containing labels aka factor vector), k
require(class)

#execute knn for k3
iris_model <- knn(train = iris.training, test = iris.testing, cl=iris.trainLabels,k=3)

# summary of the model learnt
iris_model

### 5. Evaluating the model
# Prepare confusion matrix using the gmodels library and teh CrossTable() function
require(gmodels)

# Prepare cross table
CrossTable(x = iris.testLabels, y = iris_model, prop.chisq=F)

# First row in cell of table generated tells you how many instances model evaluated correctly
