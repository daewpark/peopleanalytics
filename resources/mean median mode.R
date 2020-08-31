library("readxl")
# Importing EXCEL data set
df <- read_xlsx('C:\\mean median mode.xlsx')
mean(df$percent_hike)
median(df$percent_hike)
table(df$percent_hike)
