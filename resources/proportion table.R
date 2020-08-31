library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

table(df$department,df$gender)

prop.table(table(df$department,df$gender))


prop.table(table(df$department,df$gender),1)



prop.table(table(df$department,df$gender),2)
