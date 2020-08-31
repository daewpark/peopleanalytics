library("readxl")

df <- read_xlsx("C:\\mean median mode.xlsx")

cov(df$age,df$salary_2018)
