library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\Cluster Data 1.xlsx')

names(data)


data1<-data[ ,c('python','r','tableau','powerbi','stats')]

d <- dist(data1)

hrCluster <- hclust(d, method = 'ward.D2')

plot(as.dendrogram(hrCluster))
