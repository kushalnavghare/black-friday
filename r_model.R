#setwd("C:/Users/Shri/Desktop/for_git/black_friday_competition")
train <- read.csv("train.csv")
test <- read.csv("test.csv")

summary(train)
str(train)

# Column - Age
typeof(train$Age)
table(train$Age, useNA = "ifany")
train$Age <- as.numeric(train$Age)

# Column - Gender
table(train$Gender)
typeof(train$Gender)
train$Gender <- as.numeric(train$Gender)

# Column - City_Category
table(train$City_Category)
typeof(train$City_Category)
train$City_Category <- as.numeric(train$City_Category)

# Column - Stay_In_Current_City_Years
table(train$Stay_In_Current_City_Years)
typeof(train$Stay_In_Current_City_Years)
train$Stay_In_Current_City_Years <- as.numeric(train$Stay_In_Current_City_Years)

# Column - Product_Category_1, Product_Category_2, Product_Category_3
table(train$Product_Category_1, useNA = "ifany")

table(train$Product_Category_2, useNA = "ifany")
table(train$Product_Category_3, useNA = "ifany")

train$Product_Category_2[is.na(train$Product_Category_2)] <- 0
train$Product_Category_2 <- factor(train$Product_Category_2)

train$Product_Category_3[is.na(train$Product_Category_3)] <- 0
train$Product_Category_3 <- factor(train$Product_Category_3)

summary(train)
str(train)


# Modelling
# https://www.statmethods.net/advstats/cart.html
#install.packages("rpart")
library("rpart")
set.seed(12)
shape <- dim(train)

# Split the training data into train and test
# First we will test the accuracy of model on the data where we have labels and find RMSE
train_sample <- sample(shape[1], 545000)
train_data <- train[train_sample,]
test_data <- train[-train_sample,]
test_label <- test_data$Purchase
test_data <- test_data[-test_data$Purchase]


model <- rpart(Purchase ~ ., data = train_data)

predict <- predict(model, test_data)
error <- test_label - predict
RMSE <- sum(error)^2 / length(test_label)
print(sqrt(RMSE))
final_res <- data.frame(cbind(test_label, predict, error))

# install.packages("randomForest")
library("randomForest")

ran_model <- randomForest(Purchase ~ ., data = train_data)
