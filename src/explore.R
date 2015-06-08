# Exploratory Analysis
#######################

# Load in the data
setwd('C:/Users/Graham/Desktop/FinalProject131/src')
source('prelims.R', local=TRUE)

# safety.data is our vanilla dataset
dim(safety.data)

# data is our dataset with the binary variable attached
data <- data.frame(new.data, num.binary)

# Show the distribution of symboling parameter
hist(safety.data$symboling)
title('Histogram of Symboling')

# Distribution of symboling after removing blank observations
hist(data$symboling)
title('Histogram of Symboling, Removed Obs.')


# Distribution of Binary variable
hist(data$num.binary)
title('Histogram of risky (0) and safe (1)')

# Plot price vs. symboling
plot(data$price, data$num.binary,
     xlab = 'Price',
     ylab = 'Safety')
title('Price vs. Safety')

# Simple linear regression, price vs. safety
fit.price <- lm(data$num.binary ~ data$price)
summary(fit.price)
# It seems that price has a statistically significant impact on symboling
