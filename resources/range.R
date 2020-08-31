library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')

max(df$salary_2018)-min(df$salary_2018)
