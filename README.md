# Introduction

This project analyzes the safety ratings of various brands of cars and determines which car components are most important in determining safety risk. I will be using the automobile data set from the [UC Irvine Machine Learning Repository]( http://archive.ics.uci.edu/ml/), which consists of 205 observations and 26 variables. 24 of the variables account for a particular attribute of the vehicle, like fuel-type, weight, price, or stroke. The other two variables are the safety rating (called symboling) and the make of the vehicle (Audi, BMW, etc.). 

### Goal
The purpose of this project is to classify car components by potential risk. By discovering which components contribute most towards the classification of riskiness, safety concerns can be targeted directly by manufacturers to minimize risk towards consumers.

### Data Cleanup
To properly work with this dataset, I removed the `make` variable from the data. There are too few observations in the dataset to classify such a wide variety of brands of car, therefore the make of car would be an inaccurate predictor. 

To use the Random Forest method of classification, I needed to remove all blank or `NA` attributes from the dataset. In order to have results that are comparable across all classification techniques, I removed these observations from the data completely for all methods.

### Attributes
Symboling is represented as an integer that falls within the set [-3, 3]. A value of -3 indicates that the vehicle is considered safe, whereas a value of 3 indicates that the vehicle is "risky". Since this is the response variable that we wish to classify, I changed it into a binary variable to make it easier to work with. I split the variable into "safe" cars, or cars that have a symboling within [-3, 0], and "risky" cars, or cars that have a symboling within [1, 3]. Due to the large amount of cars that are classified as "risky", I decided to classify neutral cars (cars with a symboling of 0) as safe. This will help balance out the data and improve the accuracy of my results.

‘Normalized losses’ is another variable that is very important to the dataset, as it represents the relative average loss per payment per insured vehicle year. This loss is normalized for all vehicles that fall within a particular size classification.

In an attempt to achieve the best possible classification given the dataset, `make` was the only variable that I removed.

### Methods
I use several different tree-based classification methods.

 1. Binary recursive partitioning. This is to provide a very basic tree at the beginning of the analysis and gain a broad knowledge of the data.
 
 2. K-fold cross validation. I use this method to define a more accurate training and testing procedure in an attempt to minimize misclassification error.
 
 3. Random forests. This technique, while computationally expensive, is very powerful and typically provides better results than cross validation.
 
 4.	Boosting. Another powerful technique, this method and random forests both provide a very strong analysis. I use this technique to compare important variables attained during the random forests method.

### Results
The random forest method of classification ended up giving the lowest misclassification error. The method misclassified only `5%` of observations, which is very low. Therefore, I believe that the mean tree produced by the random forest method provides a good method of classification. The boosting method came in a close second, with a misclassification error of `5.7%`. However, as I will note later in the project, the variables that the boosting method classified as important are vastly different from those of the random forest method. K-fold cross validation yielded a misclassification error of `5.8%`.

The variables that were classified as most important by the random forest method were: number of doors, wheel base, normalized losses, height, length, and curb weight. There is a significant drop in importance rating when advancing after normalized losses. Number of doors, wheel base, and normalized losses all resulted in a high importance rating of about 9, whereas the other notable variables in the dataset hover around 5. All other variables have ratings that are 2 or lower.

Therefore, it seems that the number of doors, wheelbase, and normalized losses are the three most important attributes to keep in mind when determining the riskiness of an automobile.

### Software and Packages Used

For the analysis within this project, I used R. For the methods detailed above I used several different packages. These packages are `tree`, for the binary recursive tree method, `randomForest`, for the random forests method, and `ada`, for the boosting method.

My dataset is found on UC Irvine's Machine Learning Repository, and is accredited to Jeffery C. Schlimmer. The data was donated in 1985. The sources for this data are outlined within my R code, as well as on the UCI page for the dataset.

### Discussion

Because this dataset is from 1985, it may not be representative of modern cars, however, it should still present a good indication of important attributes that can be used for modern cars. Furthermore, the fact that I removed `44` attributes in order to use the random forest method makes my data very sparse and not as strong.
