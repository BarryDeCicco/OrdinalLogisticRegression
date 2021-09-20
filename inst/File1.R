
getw
#Exploratory data analysis
  #Summarizing the data
  summary(data)
#Making frequency table
table(data$rpurchase, data$coupon)d()
data <- read.table("inst/extdata/data.txt")

#Ordering the dependent variable
data$rpurchase = factor(data$rpurchase, levels = c("low probability", "medium probability", "high probability"), ordered = TRUE)
data$peers = factor(data$peers, levels = c("0", "1"), ordered = TRUE)
data$coupon = factor(data$coupon, levels = c("0", "1"), ordered = TRUE)


#Dividing data into training and test set
#Random sampling
samplesize = 0.60*nrow(data)
set.seed(100)
index = sample(seq_len(nrow(data)), size = samplesize)
#Creating training and test set
datatrain = data[index,]
datatest = data[-index,]



#Build ordinal logistic regression model
model= polr(rpurchase ~ coupon + peers + quality , data = datatrain, Hess = TRUE)
summary(model)

