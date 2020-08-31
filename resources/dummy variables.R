library("readxl")

data <- read_xlsx("C:\\mean median mode.xlsx")

table(data$department)

data$hr_dummy<-ifelse(data$department=="Human Resources",1,0)

data$s_dummy<-ifelse(data$department=="Sales",1,0)


names(data)

library(fastDummies)

results_dummy<-fastDummies::dummy_cols(data,remove_most_frequent_dummy = T,)

names(results_dummy)

results_dummy[,c("department","gender","marital_status","over_time")]<-list(NULL)



