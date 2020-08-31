library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

df1<-df[df$department=="Sales",]

boxplot(df1$salary_2018)

x<-scale(df1$salary_2018)[,1]

x[x>3]

x[x< -3]