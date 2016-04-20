data=read.table("stats.txt", header=TRUE)
library(weights)
data2=subset(data, data$short1_cov<50)
wtd.hist(data$short1_cov, data$lgth, breaks=50, plot=TRUE)
