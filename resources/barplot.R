library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\mean median mode.xlsx')

library(ggplot2)



ggplot(data, aes(x=as.factor(job_level))) + 
  geom_bar()
