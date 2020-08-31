# install.packages("readxl")
# readxl contains read_xlsx command, it is used to load an excel dataset in R
library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\ATTRITION DATA.xlsx')

# Counting the number of ROWS and COLUMNS
dim(data)
# The data has 686 rows and 23 columns

# View top 10 rows of the data set
head(data, 10)

# View last 10 rows of the data set
tail(data, 10)

# Displaying the data type of each column
str(data)

# Count of Yes/No of the Dependent variable
table(data$status)

# attrition percentage 
170/686*100

# Displaying summary of data
summary(data)


# Explicitly declaring all the numerical categarical variables as a factor.
cols <- c("status", "job_level", "no_of_promotions", "risk_of_attrition","potential_rating")
data[cols] <- lapply(data[cols], factor)

str(data)

# install.packages("summarytools")
# summarytools contains dfSummary which is used to obtain descriptive statistics of the data
library(summarytools)
# Obtain descriptive statistics of the data 
dfSummary(data)


# Check if there are missing values
colSums(is.na(data))
# No missing values


# Creating new variables
data$var_rating<-as.factor(data$performance_rating_2018-data$performance_rating_2017)
# Var_rating is the difference in performance rating of 2018 and 2017
# Displaying var_rating
data$var_rating
str(data$var_rating)

data$percentage_salary_change<- (data$salary_2018-data$salary_2017)/data$salary_2017 * 100
# Percentage_salary_change is the percent salary hike of employees from 2017 to 2018
# Displaying percentage_salary_change
data$percentage_salary_change

data$age<- 2018-data$year_of_birth
# Calculating age of employee by subtracting year of birth from 2018
# Displaying age
data$age

# Checking new variables
dfSummary(data$percentage_salary_change)
dfSummary(data$age)
dfSummary(data$var_rating)

# Dimension reduction
# Dropping variables which were used in creating new variables
data[ ,c('year_of_birth', 'salary_2017','salary_2018','performance_rating_2018','performance_rating_2017')] <- list(NULL)

# Dropping Unused variables
data[ ,c('hire_date', 'e_code')] <- list(NULL)


# Bivariate Analysis
# install.packages("vcd")
# vcd library contains 
library(vcd)

# Visual approach, creating a mosaic plot
mosaic(~ gender + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables 
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$gender)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )
# Insight: 
#1. It seems Employees do not leave based on their gender,as the values in the column proportion table are same(approx. 24%).
#2. Row proportion table suggests that 74.71% of employees who left were male.

# Visual approach, creating a mosaic plot

mosaic(~ service_agreement + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$service_agreement)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )
# Insight:
#1. It seem employees who did not have a service agreement preffered to leave the company as the value in column proportion table is 26.74%
#2. Row proportion table suggests out of all employees who left, 90.59% did not had a service agreement.

# Visual approach, creating a mosaic plot

mosaic(~ job_level + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$job_level)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )
# Insight: Column proportion table suggests employees with level map 5(18.18%) and 2(22.55%) do not prefer to leave the campany in comparison to employees with level map 3(27.06%), 4(33.33%) and 1(24.93%).
#          Row proportion table suggests out of all employees who left,51.76% had level_map as 1.
#          Row proportion table suggests out of all employees who left,1.18% had level_map as 5.

# Visual approach, creating a mosaic plot

mosaic(~ var_rating + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$var_rating)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )

#INSIGHTS:
#       Column proportion table suggests maximum employees leave who have variance in rating 0(29.54%).
#       Column proportion table suggests minimum employees leave who have variance in rating -3 and 2(0%).
#       Row proportion table suggests out of all the employees who left,71.76% had var_Rating as 0.
#       Row proportion table suggests out of all the employees who left, no one had var_Rating as -3 or 2.

# Visual approach, creating a mosaic plot

mosaic(~ no_of_promotions + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$no_of_promotions)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )

# INSIGHTS:
#       Column proportion table suggests maximum employees leave who have 6 promotions(50%).
#       Column proportion table suggests minimum employees leave who have 5,7 and 10 promotions(0%).
#       Row proportion table suggests out of all the employees who left, 79.41% had 0 promotions.
#       Row proportion table suggests out of all the employees who left, no one had 5,7 or 10 promotions.

# Visual approach, creating a mosaic plot

mosaic(~ risk_of_attrition + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$risk_of_attrition)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )
# INSIGHTS:
#         Column proportion table suggests maximum employees leave who have flight risk 1(55.88%).
#         Column proportion table suggests minimum employees leave who have flight risk 2(13.29%).
#         Row proportion table suggests out of all the employees who left,47.65% had a flight_risk of 3.
#         Row proportion table suggests out of all the employees who left,11.18% had a flight_risk of 1.


# Visual approach, creating a mosaic plot

mosaic(~ potential_rating + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$potential_rating)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )
# Insight:  Column proportion table suggests maximum employees leave who have potenial 1(55.88%).
#           Column proportion table suggests minimum employees leave who have potenial 5(16.06%).
#           Row proportion table suggests out of all employees who left,33.35% had potential as 3.
#           Row proportion table suggests out of all employees who left,4.71% had potential as 2.

# Visual approach, creating a mosaic plot

mosaic(~ awards + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$awards)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )
# Insight:Column proportion table suggests employees who received awards preferred to leave the company(43.33%) in comparison to people who did not receive awards(22.67%).
#         Row proportion table suggests out of all employees who left,84.71% had not recieved any awards.


# Visual approach, creating a mosaic plot

mosaic(~ signon + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$signon)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )

# Insight: Column proportion table suggests employees who received a sign on bonus preferred to stay at the company(90.91%) in comparison to people who did not receive a sign on bonus(75.34%).
#          Row proportion table suggests out of all employees who left,99.41% did not receive a sign on bonus


# Visual approach, creating a mosaic plot

mosaic(~ var_rating + status, data = data,shade=T, colorize = T, gp = gpar(fill=matrix(c("red","blue", "green", "black"), 2, 2)))


# Metric approach, creating proportion tables
tab<- table(data$status)
prop.table(tab)
tab2<- table(data$status, data$var_rating)
tab2
round(prop.table(tab2, 1)*100,digits=2 )
round(prop.table(tab2, 2)*100,digits=2 )



# The Chi-Square test of independence is used to determine if there is a significant relationship between two 
# nominal (categorical) variables.
# The null hypothesis for this test is that there is no relationship between the variables and the alternate hypothesis that 
# there is a relationship.


# Hypothesis Statement
#H0: The two variables are independent

#H1: The two variables relate to each other.

tab<- table(data$gender, data$status)
tab
chisq.test(tab)
# As p value > 0.05 we accept null hypothesis, i.e. both the variables are independent.

tab<- table(data$service_agreement, data$status)
tab
chisq.test(tab)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.


tab<- table(data$job_level, data$status)
tab
chisq.test(tab)
# As p value > 0.05 we accept null hypothesis, i.e. both the variables are independent.


tab<- table(data$no_of_promotions, data$status)
tab
chisq.test(tab)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.

tab<- table(data$risk_of_attrition, data$status)
tab
chisq.test(tab)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.


tab<- table(data$potential_rating, data$status)
tab
chisq.test(tab)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.


tab<- table(data$awards, data$status)
tab
chisq.test(tab)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.


tab<- table(data$signon, data$status)
tab
chisq.test(tab)
# As p value > 0.05 we accept null hypothesis, i.e. both the variables are independent.


tab<- table(data$var_rating, data$status)
tab
chisq.test(tab)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.

# Bivariate analysis of Numerical and Categorical variables
# ggplot2 is used to plot violin plot
library(ggplot2)
# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=age),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means_age <- by(data$age, data$status, mean)                        
means_age
med_age <- by(data$age, data$status, median) 
med_age
# Insight: It seems employees do not leave based on their age .

# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=distance_from_home),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$distance_from_home, data$status, mean)                        
means
med <- by(data$distance_from_home, data$status, median) 
med


# Insight: employees that left the organisation had 5.69 miles distance from home on an average.
#          employees that stayed had 2.29 miles distance from home on an average.
# This suggests that if employees leave far from home they leave. 



# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=manager_sat),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$manager_sat, data$status, mean)                        
means
med <- by(data$manager_sat, data$status, median) 
med

#Insight       It seems maximum employees with a manager_sat of 79 left.


# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=employee_sat),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$employee_sat, data$status, mean)                        
means
med <- by(data$employee_sat, data$status, median) 
med


# It seems employees do not leave based on employee_sat score.

# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=bonus),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$bonus, data$status, mean)                        
means
med <- by(data$bonus, data$status, median) 
med


# It seems employees do not leave based on bonus.

# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=no_courses_taken),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$no_courses_taken, data$status, mean)                        
means
med <- by(data$no_courses_taken, data$status, median) 
med


# It seems employees do not leave based on no_courses_taken.

# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=time_in_position),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$time_in_position, data$status, mean)                        
means
med <- by(data$time_in_position, data$status, median) 
med


# It seems employees do not leave based on their time_in_position.

# Visual approach, creating a violin plot
p <- ggplot(data, aes(x=status, y=percentage_salary_change),addMean=TRUE, meanPointShape=23, meanPointSize=3,
            meanPointColor="black", meanPointFill="blue") + 
  geom_violin()
p+ geom_violin(trim = FALSE)+ geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
# Metric approach, displaying mean, median, minimum and maximum
means <- by(data$percentage_salary_change, data$status, mean)                        
means
med <- by(data$percentage_salary_change, data$status, median) 
med


# Insight: 
# employees that left the organisation had 2.89 % salary change on an average.

# employees that left the organisation had 5.88 % salary change on an average.

# This suggests that employees with less salary change tend to leave. 



t.test(age ~ status, data = data)
# As p value > 0.05 we accept null hypothesis, i.e. both age and status are independent. 
# This means employees do not leave on the basis of age.


t.test(distance_from_home ~ status, data = data)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent. 
# This means employees leave on the basis of distance from home.


t.test(manager_changes ~ status, data = data)
# As p value > 0.05 we accept null hypothesis, i.e. both the variables are independent.
# This means employees do not leave on the basis of number of manager changes.


t.test(manager_sat ~ status, data = data)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.
# This means employees leave on the basis of manager satisfaction score.


t.test(employee_sat ~ status, data = data)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.
# This means employees leave on the basis of employee satisfaction score.



t.test(bonus ~ status, data = data)
# As p value > 0.05 we accept null hypothesis, i.e. both the variables are independent.
# This means employees do not leave on the basis of bonus.


t.test(no_courses_taken ~ status, data = data)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.
# This means employees leave on the basis of number of courses taken.



t.test(time_in_position ~ status, data = data)
# As p value > 0.05 we accept null hypothesis, i.e. both the variables are independent.
# This means employees do not leave on the basis of time in position.



t.test(percentage_salary_change ~ status, data = data)
# As p value < 0.05 we reject null hypothesis, i.e. both the variables are dependent.
# This means employees leave on the basis of percentage salary change.


# Droping insignificant variables
data[ ,c('gender', 'job_level','signon','age','manager_changes','bonus','time_in_position')] <- list(NULL)

# OR

#library(dplyr)
#select (data,-c('gender', 'job_level','signon','age','manager_changes','bonus','time_in_position'))




# Dummy coding refers to the process of coding a categorical variable into dichotomous variables(1,0)
# Use : Why is it used?
# Machine learning treats all independent (X) variables in the analysis as numerical. Numerical variables
# are interval or ratio scale variables whose values are directly comparable, e.g. '10 is twice as much as 5', or
# '3 minus 1 equals 2'. Often, however, you might want to include an attribute or nominal scale variable such
# as 'Product Brand' or 'Type of Defect' in your study. Say you have three types of defects, numbered '1', '2'
# and '3'. In this case, '3 minus 1' doesn't mean anything. you can't subtract defect 1 from defect 3. The
# numbers here are used to indicate or identify the levels of 'Defect Type' and do not have an intrinsic meaning of
# their own. Dummy variables are created in this situation to 'trick' the regression algorithm into correctly
# analyzing attribute variables. 

# The number of dummy variables necessary to represent a single attribute variable is equal to the
# number of levels (categories) in that variable minus one. 
# Not Doing so would give the regression redundant information, result in multicollinearity, 
# and break the model. This means we have to leave one category out, and we call this missing category 
# the reference category. 
# fastDummies is used to create dummy variables
library(fastDummies)
results_dummy <- fastDummies::dummy_cols(data, remove_most_frequent_dummy = T,)

View(results_dummy)
# Drop original variables which were converted to dummy variables  

results_dummy[ ,c('status', 'service_agreement','no_of_promotions','risk_of_attrition','potential_rating','awards','var_rating')] <- list(NULL)

names(results_dummy)
# Renaming 2 columns 
colnames(results_dummy)[25] <- "var_rating_minus1"
colnames(results_dummy)[24] <- "var_rating_minus3"
names(results_dummy)



# Splitting data into train data and test data

# install.packages("caret")
# caret is loaded to perform data partition
library(caret)

set.seed(100)
# Creating training and test index, 70% data is training data and 30% data is test data
trainIndex <- createDataPartition(results_dummy$status_1, p=0.7, 
                                  list=FALSE)
str(trainIndex)

# Creating training data
X_train <- results_dummy[trainIndex,]
# Creating test data
X_test <- results_dummy[-trainIndex,]


X_train$status_1 <- as.factor(X_train$status_1)
X_test$status_1 <- as.factor(X_test$status_1)



model_1 <- glm(status_1 ~., data = X_train, family=binomial)

summary(model_1)



model_2 <- glm(status_1 ~. -no_of_promotions_10 -potential_rating_1, data = X_train, family=binomial)

summary(model_2)
library(car)
vif(model_2)

model_3 <- glm(status_1 ~.-potential_rating_1 -no_of_promotions_10
               -var_rating_2, data = X_train, family=binomial)

summary(model_3)


model_4 <- glm(status_1 ~.-potential_rating_1 -no_of_promotions_10
               -no_of_promotions_7 -var_rating_2, data = X_train, family=binomial)

summary(model_4)


model_5 <- glm(status_1 ~.-potential_rating_1 
               -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
               -no_of_promotions_5, data = X_train, family=binomial)

summary(model_5)

model_6 <- glm(status_1 ~.-potential_rating_1 
               -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
               -no_of_promotions_5 -var_rating_minus3, data = X_train, family=binomial)

summary(model_6)

model_8 <- glm(status_1 ~.-potential_rating_1 
               -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
               -no_of_promotions_5 -var_rating_minus3 -var_rating_1, data = X_train, family=binomial)

summary(model_8)

model_9 <- glm(status_1 ~.-potential_rating_1 
               -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
               -no_of_promotions_5 -var_rating_minus3 -var_rating_1
               -no_of_promotions_1, data = X_train, family=binomial)

summary(model_9)

model_10 <- glm(status_1 ~.-potential_rating_1 
               -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
               -no_of_promotions_5 -var_rating_minus3 -var_rating_1
               -no_of_promotions_1 -no_of_promotions_6, data = X_train, family=binomial)

summary(model_10)


model_11 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4, data = X_train, family=binomial)

summary(model_11)

model_12 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4
                -var_rating_minus1, data = X_train, family=binomial)

summary(model_12)


model_13 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4
                -var_rating_minus1 -potential_rating_2, data = X_train, family=binomial)

summary(model_13)

model_14 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4
                -var_rating_minus1 -potential_rating_2 -no_of_promotions_2, data = X_train, family=binomial)

summary(model_14)

model_15 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4
                -var_rating_minus1 -potential_rating_2 -no_of_promotions_2
                -risk_of_attrition_3, data = X_train, family=binomial)

summary(model_15)

model_16 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4
                -var_rating_minus1 -potential_rating_2 -no_of_promotions_2
                -risk_of_attrition_3 -distance_from_home, data = X_train, family=binomial)

summary(model_16)

model_17 <- glm(status_1 ~.-potential_rating_1 
                -no_of_promotions_7 -var_rating_2 -no_of_promotions_10
                -no_of_promotions_5 -var_rating_minus3 -var_rating_1
                -no_of_promotions_1 -no_of_promotions_6 -no_of_promotions_4
                -var_rating_minus1 -potential_rating_2 -no_of_promotions_2
                -risk_of_attrition_3 -distance_from_home -potential_rating_5, data = X_train, family=binomial)

summary(model_17)




# Model evaluation for glm

# Getting predictions for test data
predictions <- predict(model_17, X_test,type="response")
dim(X_test)
predictions<-ifelse(predictions>0.5,1,0)


confusionMatrix(table(X_test$status_1,predictions))





# Getting predictions for test data
predictions <- predict(model_17, X_test,type = 'response')

pred <- prediction( predictions, as.numeric(X_test$status_1))

plot(unlist(performance(pred, "sens")@x.values), unlist(performance(pred, "sens")@y.values), 
     type="l", lwd=2, ylab="Sensitivity", xlab="Cutoff")
par(new=TRUE)
plot(unlist(performance(pred, "spec")@x.values), unlist(performance(pred, "spec")@y.values), 
     type="l", lwd=2, col='red', ylab="", xlab="")

mtext("Specificity",side=4, padj=-2, col='red')





predictions<-ifelse(predictions>0.20,1,0)


confusionMatrix(table(X_test$status_1,predictions))







library(pROC)

predictions <- predict(model_17, X_test,type = 'response')

#apply roc function
analysis <- roc(response=X_test$status_1, predictor=predictions)

#Find t that minimizes error
e <- cbind(analysis$thresholds,analysis$sensitivities+analysis$specificities)
opt_t <- subset(e,e[,2]==max(e[,2]))[,1]

#Plot ROC Curve
plot(1-analysis$specificities,analysis$sensitivities,type="l",
     ylab="Sensitiviy",xlab="1-Specificity",col="black",lwd=2,
     main = "ROC Curve for Simulated Data")
abline(a=0,b=1)
abline(v = opt_t) #add optimal t to ROC curve
opt_t #print t




predictions<-ifelse(predictions>0.20,1,0)
result.roc <- roc(X_test$status_1, as.numeric(as.character(predictions))) 
plot(result.roc)
# Displaying area under the curve for test data
result.roc
