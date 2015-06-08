# Preliminaries
# load and modify data; assign training set and test set

# load data from 'data.R'
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('data.R', local=TRUE)
head(auto.data)
dim(auto.data)


# Data Modification
####################
# Remove make variable from data
safety.data <- subset(auto.data, select = -c(make))
dim(safety.data)

# Remove unknown/blank observations from the data
new.data <- na.omit(safety.data) # remove all NA obs.
dim(new.data)

# Create binary variable out of symboling, classifying risky and safe 
biSym <- ifelse(new.data$symboling <= 0, c('safe'), c('risky') )
# Remove symboling variable from data
new.data <- subset(new.data, select = -c(symboling))


# Training and Test sets
#########################
# Training set, sample 75% of the data
index <- sample(dim(new.data)[1], size=floor(dim(new.data)[1])*.75)
# Take remaining for test set
index.test <- setdiff(1:dim(new.data)[1], index)
length(index) + length(index.test) # 159, equal to number of obs. 

# Our two sets:
train.set <- new.data[index,]
dim(train.set)

test.set <- new.data[index.test,]
dim(test.set)


