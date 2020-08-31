library("readxl")

df <- read_xlsx("C:\\incentive.xlsx")

hist(df$incentive)

qqnorm(df$incentive)
qqline(df$incentive)

shapiro.test(df$incentive)



df$incentive_log <- log(df$incentive)

hist(df$incentive_log)

qqnorm(df$incentive_log)
qqline(df$incentive_log)

shapiro.test(df$incentive_log)



df$incentive_sqrt <- sqrt(df$incentive)

hist(df$incentive_sqrt)

qqnorm(df$incentive_sqrt)
qqline(df$incentive_sqrt)

shapiro.test(df$incentive_sqrt)


df$incentive_cbrt <- df$incentive^(1/3)

hist(df$incentive_cbrt)

qqnorm(df$incentive_cbrt)
qqline(df$incentive_cbrt)

shapiro.test(df$incentive_cbrt)


