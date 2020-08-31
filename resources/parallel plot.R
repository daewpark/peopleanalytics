library("readxl")
# Importing EXCEL data set
data <- read_xlsx('C:\\parallel plot data.xlsx')

library(GGally)



# Plot
ggparcoord(data,
           columns = 1:3, groupColumn = 4
) 
