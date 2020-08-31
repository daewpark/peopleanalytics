library(readxl)

df <- read_xlsx("C:\\lrdata.xlsx")

df1<-df[,c("percentage_salary_hike","job_level","age","years_at_company","monthly_income","years_since_last_promotion")]

cor(df1,df1)

library(car)

eq<-lm(percentage_salary_hike~.,data=df1)

vif(eq)
