library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\mean median mode.xlsx')

library(ggplot2)


ggplot(data, aes(x=job_level, y=salary_2018)) +
  geom_point() + 
  geom_segment( aes(x=data$job_level, xend=data$job_level, y=0, yend=data$salary_2018))
