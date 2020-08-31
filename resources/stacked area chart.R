library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\time series.xlsx')


library(tidyverse)

data1<-data %>% 
  mutate(dates = month) %>% 
  gather(variable, value, team1:team3)

ggplot(data1, aes(x=month, y=value, fill=variable)) + 
  geom_area()


