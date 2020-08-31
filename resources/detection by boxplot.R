library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

df1<-df[df$department=="Human Resources",]

boxplot(df1$salary_2018)
