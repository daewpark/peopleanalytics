library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

set.seed(42)

dt=sample(nrow(df),nrow(df)*0.70)

length(dt)

train=df[dt,]

dim(train)

test=df[-dt,]

dim(test)

names(train)