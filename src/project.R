# Graham Marlow
# PSTAT 131 Final Project
# 5/29/2015
#

# load data from 'data.R'
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('data.R', local=TRUE)
head(auto.data)
dim(auto.data)


# Divide data into test set and training set
set.seed(2)

# Training set, sample 75% of the data
index <- sample(dim(auto.data)[1], size=floor(dim(auto.data)[1])*.75,
                                              replace=F)
train.set <- auto.data[index,]
dim(train.set)

# Test set, sample remaining observations
index.test <- setdiff(1:dim(auto.data)[1], index)
test.set <- auto.data[index.test,]
dim(test.set)


