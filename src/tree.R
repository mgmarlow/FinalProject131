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

set.seed(2)

# Use training set and test set to evaluate our classification tree
car.tree <- tree(biSym ~., data=tree.data, subset=index)

# Predict on test set
tree.pred <- predict(car.tree, train.set, type='class')

# Confusion matrix
error <- table(tree.pred, test.set)


# K-fold Cross Validation
##########################



# Classification Tree using Random Forest
##########################################