library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\Cluster Data 1.xlsx')

# UNIVARIATE OF DEMOGRAPHICS
mean(data$age)
median(data$age)
hist(data$age)



mean(data$experience)
median(data$experience)
hist(data$experience)



mean(data$number_projects)
median(data$number_projects)
hist(data$number_projects)



table(data$formal_education_stats)
prop.table(table(data$formal_education_stats))
pie(table(data$formal_education_stats))



table(data$formal_education_coding)
prop.table(table(data$formal_education_coding))
pie(table(data$formal_education_coding))



table(data$certification_tableau)
prop.table(table(data$certification_tableau))
pie(table(data$certification_tableau))


# UNIVARIATE ON SCORES
mean(data$python)
table(data$python)
barplot(table(data$python))

mean(data$r)
table(data$r)
barplot(table(data$r))


mean(data$tableau)
table(data$tableau)
barplot(table(data$tableau))


mean(data$powerbi)
table(data$powerbi)
barplot(table(data$powerbi))



mean(data$stats)
table(data$stats)
barplot(table(data$stats))




names(data)


data1<-data[ ,c('python','r','tableau','powerbi','stats')]

# CLUSTERING
set.seed(50)

library(factoextra)

fviz_nbclust(data1, FUN = hcut, method = "wss")

d <- dist(data1)

hrCluster <- hclust(d, method = 'ward.D2')
members <- cutree(hrCluster,k = 4)

data$clusternumber<-members


# INSIGHTS
z<-aggregate(data[1], by=list(data$clusternumber), length)

x<-aggregate(data[2:6], by=list(data$clusternumber), mean)

x1<-aggregate(data[7:9], by=list(data$clusternumber), mean)

y<-aggregate(data[10:12], by=list(data$clusternumber), sum)

y$count_of_employees<-z$employee_id

y$formal_education_stats_prop<-y$formal_education_stats/y$count_of_employees*100
y$formal_education_coding_prop<-y$formal_education_coding/y$count_of_employees*100
y$certification_tableau_prop<-y$certification_tableau/y$count_of_employees*100



