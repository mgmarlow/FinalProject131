# Principal Component Analysis

# Preliminaries
# load required packages


# load data from 'data.R'
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('data.R', local=TRUE)
head(auto.data)
dim(auto.data)


# Remove non-numeric variables from the dataset
safety.data <- subset(auto.data, select = -c(make))
safety.data <- subset(safety.data, select = -c(normalized.losses))
safety.data <- subset(safety.data, select = -c(fuel.system))
safety.data <- subset(safety.data, select = -c(engine.type))
safety.data <- subset(safety.data, select = -c(engine.location))
safety.data <- subset(safety.data, select = -c(num.of.cylinders))
safety.data <- subset(safety.data, select = -c(fuel.type))
safety.data <- subset(safety.data, select = -c(aspiration))
safety.data <- subset(safety.data, select = -c(num.doors))
safety.data <- subset(safety.data, select = -c(body.style))
safety.data <- subset(safety.data, select = -c(drive.wheels))
dim(safety.data)

# Remove unknown observations from the data


# Assign Response and Predictor variables
responseY <- as.matrix(safety.data[,1])
predictorX <- as.matrix(safety.data[, 2:(dim(safety.data)[2])])

# Principal Component Analysis using Correlation matrix
pca <- princomp(predictorX, cor=T)


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


