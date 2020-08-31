library("readxl")

df <- read_xlsx("C:\\mean median mode.xlsx")

df1=df[c('age','salary_2018','totalW_working_years','percent_hike')]

cov(df1,df1)
