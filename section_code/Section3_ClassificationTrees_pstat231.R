###
# Lab 3: Decision Trees
# Author: Sergio Rodriguez
# Date: 04-16-2015
##

install.packages("tree")
library(tree)
library(ISLR) # Load library
?Carseats # See description of data


attach(Carseats) # Use each column separately as a numeric vector
High <- ifelse(Sales <=8,"No","Yes") # Binary response variable

Carseats <- data.frame(Carseats ,High)

# EDA
library(ggplot2)
str(Carseats)
q <- ggplot(Carseats,aes(x=Age,y=Income,colour=High))
q <- q + geom_point()
q + facet_grid(.~Urban)
q + facet_grid(US~Urban)
q + facet_grid(.~Urban) + geom_vline(xintercept = 40)



# Fit tree
tree.carseats <- tree(High ~.-Sales, data = Carseats)

summary(tree.carseats)


# Save plot in a pdf file
# it will be stored in the setwd() user specified directory
pdf(file="tree1.pdf",width=15,height=9)
plot(tree.carseats)
text(tree.carseats ,pretty = 0, cex = 1, col = "red")
title("Classification Tree")
dev.off()


# Model validation

set.seed(2)  # Set random seed for results being reproducible
dim(Carseats)  # Get dimension of dataset
train <- sample(1:nrow(Carseats),200)  # Sample 50% of observations
Carseats.test <- Carseats [-train,]  # Training data 
High.test <- High[-train]  # Test data

# Model validation

# Fit model on train set
tree.carseats <- tree(High~.-Sales,data = Carseats ,subset = train) 
# Predict on test set
tree.pred <- predict(tree.carseats,Carseats.test,type="class") 
# Confusion matrix
error <- table(tree.pred ,High.test)  
# Classification Error
1-sum(diag(error))/sum(error)


# Tree pruning
set.seed(3) # Set random seed

# k-Fold Cross validation
cv.carseats <- cv.tree(tree.carseats,  # Estimated model
                     FUN=prune.tree,  # Goodness-of-fit measure
                     K = 10, method="misclass") # K= 10 folds

prune.tree(tree.carseats, k = 0:20, method = "misclass")

class(cv.carseats)
names(cv.carseats)  # get names of entries in cv object
cv.carseats

# Plot CV error
pdf(file="cv.pdf",width=7,height=4)
op <- par(mfrow=c(1,2)) # Change graphic layout
plot(cv.carseats$size , cv.carseats$dev,type="b", 
     xlab = "Number of Nodes", ylab = "CV Misclassification Error",
     col = "red")
plot(cv.carseats$k ,cv.carseats$dev ,type = "b",
     xlab = "Complexity Parameter", ylab = "",
     col = "blue")
# Add lines to identify complexity parameter
min.error <- which.min(cv.carseats$dev) # Get minimum error index
abline(h = cv.carseats$dev[min.error],lty = 2)
abline(v = cv.carseats$k[min.error],lty = 2)
par(op) # restore layout
dev.off()


# Prune tree
prune.carseats  <- prune.misclass (tree.carseats,
                                   best=9)

# Plot pruned tree
pdf(file="tree2.pdf",width=10,height=5)
plot(prune.carseats)
text(prune.carseats ,pretty=0, col = "red", cex = .8)
title("Pruned tree")
dev.off()
