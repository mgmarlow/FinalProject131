# Classification Tree

# Load required packages
library(tree)

# load data from 'prelims.R'
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('prelims.R', local=TRUE)
dim(train.set) + dim(test.set)
dim(new.data)

# Attach binary variable to dataset
tree.data <- data.frame(new.data, biSym)


# Simple Classification Tree, no Model Evaluation
##################################################
# Generate tree using defaults
car.tree <- tree(biSym ~., data=tree.data)
summary(car.tree)

# Plot the tree and labels
plot(car.tree)
text(car.tree, pretty=0, cex=0.8, col='red')
title('Classification Tree')


# Model Validation
###################

set.seed(1)

# Training and Test sets

# Training set, sample 75% of the data
index <- sample(dim(new.data)[1], size=floor(dim(new.data)[1])*.75)
# Take remaining for test set
index.test <- setdiff(1:dim(new.data)[1], index)
length(index) + length(index.test) # 159, equal to number of obs. 

# Our two sets:
train.set <- new.data[index,]
dim(train.set)

symbol.test <- biSym[index.test]
test.set <- new.data[index.test,]
dim(test.set)


# Model Validation
# Use training set and test set to evaluate our classification tree
car.tree <- tree(biSym ~., data=tree.data, subset=index)

# Predict on test set
tree.pred <- predict(car.tree, test.set, type='class')

# Confusion matrix
error <- table(tree.pred, symbol.test)

# Classification Error
1 - sum(diag(error))/sum(error)


# K-fold Cross Validation
##########################
# Note that Cross Validation automatically declares training and test sets
cv.car <- cv.tree(car.tree, FUN=prune.tree, K=10, method='misclass')
cv.car

# Plot
# Misclassification error vs. number nodes
plot(cv.car$size, cv.car$dev, type='b', 
     xlab='Number of Nodes',
     ylab='CV Misclassification Error',
     col='red')

# Complexity and Min. Error
plot(cv.car$k, cv.car$dev, type='b', 
     xlab='Complexity',
     ylab='CV Misclassification Error',
     col='blue')
# Get minimum error
min.error <- which.min(cv.car$dev) # index of min. error
abline(h = cv.car$dev[min.error], lty=2)
abline(v = cv.car$k[min.error], lty=2)


# Prune tree
prune.car <- prune.misclass(car.tree, best=6)
plot(prune.car)
text(prune.car, pretty=0, col='red', cex=0.8)
title('Pruned Tree')


# Classification Tree using Random Forest
##########################################




