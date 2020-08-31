library("readxl")

data <- read_xlsx("C:\\Skewness.xlsx")

df$salary_2017

min(df$salary_2017)

max(df$salary_2017)

hist(df$salary_2017)

df$salary_2017_norm <- (df$salary_2017 - min(df$salary_2017))/(max(df$salary_2017)-min(df$salary_2017))

min(df$salary_2017_norm)

max(df$salary_2017_norm)

hist(df$salary_2017_norm)