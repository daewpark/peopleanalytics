library("readxl")

data <- read_xlsx("C:\\mean median mode.xlsx")


df$compa_ratio <- df$salary_2018/median(df$salary_2018)
df$compa_ratio