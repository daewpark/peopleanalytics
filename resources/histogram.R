library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')

hist(df$salary_2018)
