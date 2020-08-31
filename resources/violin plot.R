library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\mean median mode.xlsx')

library(ggplot2)

p <- ggplot(data, aes(x=data$gender , y=data$salary_2018, fill=data$gender)) + # fill=data$gender allow to automatically dedicate a color for each group
  geom_violin()
