library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\missing data.xlsx")

colSums(is.na(df))

colSums(is.na(df))/nrow(df)*100

df1 <- df[complete.cases(df), ]

colSums(is.na(df1))

df1<-df$employee_sat

df1[is.na(df1)]<-0

sum(is.na(df1))

df1<-df$employee_sat

df1[is.na(df1)]<- mean(df1,na.rm = TRUE)

sum(is.na(df1))

df1<-df$employee_sat

df1[is.na(df1)]<- median(df1,na.rm = TRUE)

sum(is.na(df1))

df1<-df$employee_sat

table(df1)

df1[is.na(df1)]<- 80

sum(is.na(df1))

df2<-df$risk_of_attrition

table(df2)

df2[is.na(df2)]<- "LOW"


sum(is.na(df2))













