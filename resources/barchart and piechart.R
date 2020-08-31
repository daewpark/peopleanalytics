library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')


barplot(table(df$department))



pie(prop.table(table(df$department)))
