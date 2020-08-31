library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\Skewness.xlsx')

library('e1071')

hist(df$manager_sat)
skewness(df$manager_sat)


hist(df$employee_sat)
skewness(df$employee_sat)


hist(df$salary_2017)
skewness(df$salary_2017)


hist(df$percent_salary_hike)
skewness(df$percent_salary_hike)
