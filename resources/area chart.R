library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\time series.xlsx')

library(ggplot2)

ggplot(data, aes(x=month, y=team1,group=1)) +
  geom_area()
