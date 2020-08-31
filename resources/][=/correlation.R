library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')

cor(df$age,df$salary_2018)
