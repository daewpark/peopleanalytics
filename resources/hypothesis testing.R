library("readxl")

data <- read_xlsx("C:\\HYPOTHESIS TESTING.xlsx")
data1 <- read_xlsx("C:\\HYPOTHESIS TESTING 1.xlsx")

# step 1 : Formulating hypothesis
# H0: hiring score for college b is less than equal to 3.9
# HA: hiring score for college b is greater than 3.9

# step 2 : Choosing the test
# one sample t-test

# step 3 : Choosing significance level
# 0.05

# step 4 : Apply the test and find p-value
t.test(data1$hiring_score, mu = 3.9,alternative = "greater")

# step 5 : compare p-value and the significance level

# conclusion : As p-value is less than 0.05 we reject the null and accept the alternate  hypothesis


###############################################################################################################

# step 1 : Formulating hypothesis
# H0: productivity after training is less than equal to productivity before training
# HA: productivity after training is greater than productivity before training  

# step 2 : Choosing the test
# paired t-test

# step 3 : Choosing significance level
# 0.05

# step 4 : Apply the test and find p-value
t.test(data$productivity_after_training,data$productivity_before_training, paired=TRUE,alternative = "greater")

# step 5 : compare p-value and the significance level

# conclusion : As p-value is less than 0.05 we reject the null and accept the alternate  hypothesis

###############################################################################################################

# step 1 : Formulating hypothesis
# H0: employee gender and hiring manager gender are independent
# HA: employee gender and hiring manager gender are dependent

# step 2 : Choosing the test
# Chi-Square

# step 3 : Choosing significance level
# 0.05

# step 4 : Apply the test and find p-value
tab<- table(data$employee_gender, data$hiring_manager_gender)
chisq.test(tab)
# step 5 : compare p-value and the significance level

# conclusion : As p-value is greater than 0.05 we accept the null hypothesis


###############################################################################################################

# step 1 : Formulating hypothesis
# H0: years since last promotion and department are independent
# HA: years since last promotion and department are dependent

# step 2 : Choosing the test
# Anova

# step 3 : Choosing significance level
# 0.05

# step 4 : Apply the test and find p-value
res.aov <- aov(yrs_since_last_promotion ~ Department, data = data)
# Summary of the analysis
summary(res.aov)
# step 5 : compare p-value and the significance level

# conclusion : As p-value is greater than 0.05 we accept the null hypothesis
