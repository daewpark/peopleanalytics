library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')

table(df$department)


prop.table(table(df$department))


prop.table(table(df$department))*100
