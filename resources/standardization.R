library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')

library('robustHD')

standardize(df$salary_2018)
