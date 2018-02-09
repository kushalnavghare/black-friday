a <- read.csv("files/train.csv")
b <- read.csv("files/test.csv")





data_prep <- function(a,b){
  a$Product_ID <- as.numeric(a$Product_ID)
  b$Product_ID <- as.numeric(b$Product_ID)
  # Column - Age
  
  a$Age <- as.numeric(a$Age)
  b$Age <- as.numeric(b$Age)
  
  # Column - Gender
  
  
  a$Gender <- as.numeric(a$Gender)
  b$Gender <- as.numeric(b$Gender)
  
  # Column - City_Category
  
  
  a$City_Category <- as.numeric(a$City_Category)
  b$City_Category <- as.numeric(b$City_Category)
  
  # Column - Stay_In_Current_City_Years
  
  
  a$Stay_In_Current_City_Years <- as.numeric(a$Stay_In_Current_City_Years)
  b$Stay_In_Current_City_Years <- as.numeric(b$Stay_In_Current_City_Years)
  
  # Column - Product_Category_1, Product_Category_2, Product_Category_3
  
  
  
  
  a$Product_Category_2[is.na(a$Product_Category_2)] <- 0
  a$Product_Category_2 <- factor(a$Product_Category_2)
  b$Product_Category_2[is.na(b$Product_Category_2)] <- 0
  b$Product_Category_2 <- factor(b$Product_Category_2)
  
  a$Product_Category_3[is.na(a$Product_Category_3)] <- 0
  a$Product_Category_3 <- factor(a$Product_Category_3)
  b$Product_Category_3[is.na(b$Product_Category_3)] <- 0
  b$Product_Category_3 <- factor(b$Product_Category_3)
  
  
  write.csv(a, file = "files/train_for_model.csv")
  write.csv(b, file = "files/test_for_model.csv")  
  
  
}




data_prep(a,b)