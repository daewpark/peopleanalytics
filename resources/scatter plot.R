library("readxl")

df <- read_xlsx("C:\\mean median mode.xlsx")

plot(df$age,df$salary_2018)
