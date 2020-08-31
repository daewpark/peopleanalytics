library("readxl")

df <- read_xlsx("C:\\Skewness.xlsx")

quantile(df$age)

library(mltools)

y <- c(18,30,35.5,43,60)

df$binned <- bin_data(df$age, bins=y)

table(df$binned)

y<- c(18,32,46,60)

df$binned1 <- bin_data(df$age, bins=y)

table(df$binned1)


y<- c(18,25,35,45,60)

df$binned2 <- bin_data(df$age, bins=y)

table(df$binned2)
