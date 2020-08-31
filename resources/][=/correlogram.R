library("readxl")

df <- read_xlsx("C:\\mean median mode.xlsx")

plot(df$age,df$salary_2018)

df1=df[c('age','salary_2018','totalW_working_years','percent_hike')]

names(df1)

pairs(df1)
