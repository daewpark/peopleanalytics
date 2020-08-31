library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

df1<-subset(df,gender=="Male")

df2<-subset(df,gender=="Female")

dim(df1)

dim(df2)

summary(df1)

summary(df2)
