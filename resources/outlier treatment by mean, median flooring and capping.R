library("readxl")
# Importing EXCEL data set
df <- read_xlsx("C:\\mean median mode.xlsx")

df1<-df[df$department=="Sales",]

boxplot(df1$salary_2018)

x<-scale(df1$salary_2018)[,1]

x[x>3]

x[x< -3]


df2 = df1

df2[df2$salary_2018>200000,]<-mean(df2$salary_2018)

boxplot(df2$salary_2018)


df2 = df1

df2[df2$salary_2018>200000,]<-median(df2$salary_2018)

boxplot(df2$salary_2018)

df2=df1

quantile(df2$salary_2018,c(0,.05, .1, .15, .2, .25, .3,.35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95,1))

df2$salary_2018<-squish(df2$salary_2018,quantile(df2$salary_2018,c(0,0.90)))

boxplot(df2$salary_2018)












