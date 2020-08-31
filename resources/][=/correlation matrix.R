library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')

cor(df$age,df$salary_2018)


df1=df[c('age','salary_2018','totalW_working_years','percent_hike')]

cor(df1,df1)
