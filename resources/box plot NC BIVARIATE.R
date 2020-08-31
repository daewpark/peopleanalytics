library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

df1<-subset(df,gender=="Male")

df2<-subset(df,gender=="Female")

boxplot(df1$salary_2018)


boxplot(df2$salary_2018)


boxplot(salary_2018 ~ gender, df)
