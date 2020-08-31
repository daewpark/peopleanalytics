library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

newdata<- df[c('department','gender')]

multi<-table(newdata)

mosaicplot(multi,color=c('orange','light green'))

newdata<- df[c('department','gender','over_time')]

multi<-table(newdata)

mosaicplot(multi,color=c('orange','light green'))
