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
# We remove them because we cannot have blank observations when using Random Forest 
# Classification
new.data <- na.omit(safety.data) # remove all NA obs.
dim(new.data)
# We do it immediately so we can compare results across all tree methods

# Create binary variable out of symboling, classifying risky and safe 
biSym <- ifelse(new.data$symboling <= 0, c('safe'), c('risky') )
num.binary <- ifelse(new.data$symboling <= 0, 1, 0 )
# Remove symboling variable from data
new.data <- subset(new.data, select = -c(symboling))
