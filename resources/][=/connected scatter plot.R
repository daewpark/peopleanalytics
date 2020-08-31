library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\mean median mode.xlsx')

library(ggplot2)



ggplot(data, aes(x=age, y=salary_2018)) + geom_line() +
  geom_point()
