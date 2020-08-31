library(readxl)

df <- read_xlsx("C:\\lrdata.xlsx")


simple <- lm(percentage_salary_hike~performance_rating,data = df)


summary(simple)
# Performing Linear Regression

multiple <- lm(percentage_salary_hike~.-years_with_curr_manager -dummy_sales -years_in_current_role
               -training_times_last_year -dummy_single -dummy_yes -job_level -years_at_company -monthly_income 
               -dummy_female -dummy_divorced -dummy_HR -age -total_working_years, data=df)

summary(multiple)

multiple <- lm(percentage_salary_hike~., data=df)

library(MASS)

step<-stepAIC(multiple,trace=TRUE)
summary(step)

multiple <- lm(percentage_salary_hike~performance_rating+years_since_last_promotion, data=df)
summary(multiple)
