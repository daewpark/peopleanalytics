library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")


barplot(table(df$gender,df$department))


barplot(table(df$department,df$gender))



barplot(prop.table(table(df$department,df$gender),2))


barplot(prop.table(table(df$gender,df$department),2))
