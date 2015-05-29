# Graham Marlow
# PSTAT 131 Final Project
# 5/29/2015
#
# Regression Tree
#

# Preliminaries
# load required packages
library(tree)


# load data from 'data.R'
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('data.R', local=TRUE)
head(auto.data)
dim(auto.data)


# Remove variables that don't contribute to safety rating
# make
safety.data <- subset(auto.data, select = -c(make))
dim(safety.data)


# Divide data into test set and training set
set.seed(2)

# Training set, sample 75% of the data
index <- sample(dim(safety.data)[1], size=floor(dim(safety.data)[1])*.75,
# Take remaining for test set
index.test <- setdiff(1:dim(safety.data)[1], index)

# Our two sets:
train.set <- safety.data[index,]
dim(train.set)

test.set <- safety.data[index.test,]
dim(test.set)



# Begin forming Tree
attach(safety.data)
