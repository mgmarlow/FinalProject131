# Principal Component Analysis

# Preliminaries
# load required packages
library(missMDA)

# load data from 'data.R'
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('data.R', local=TRUE)
head(auto.data)
dim(auto.data)


# Remove non-numeric variables from the dataset
safety.data <- subset(auto.data, select = -c(make))
dim(safety.data)

# Remove unknown observations from the data
new.data <- na.omit(safety.data)
dim(new.data)

# Create binary variable out of symboling, classifying risky and safe 
symboling.binary <- ifelse(new.data$symboling <= 0, c('safe'), c('risky') )
new.data <- subset(new.data, select = -c(symboling))

# Training set, sample 75% of the data
index <- sample(dim(safety.data)[1], size=floor(dim(safety.data)[1])*.75,
# Take remaining for test set
index.test <- setdiff(1:dim(safety.data)[1], index)

# Our two sets:
train.set <- safety.data[index,]
dim(train.set)

test.set <- safety.data[index.test,]
dim(test.set)


