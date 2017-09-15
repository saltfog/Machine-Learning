#Load needed librarys
source('prepare_functions.R')
library(randomForest)
library(e1071)
library(caret)
library(ggplot2)

#Set a consistent seed
set.seed(123) 

#Major clean and preparation see helper_function.r
data = prepareAndCleanData()

#Check the first couple of rows of data
head(data)

#Summary of all variables
summary(data)

#Create data for training, set confidence level
sample.ind = sample(2, 
                     nrow(data),
                     replace = T,
                     prob = c(0.05,0.95))
data.dev = data[sample.ind==1,]
data.val = data[sample.ind==2,]

#See how data sets look as edible vs poisonous proportion ratio
#To see if the traning and test data are some what equal
table(data$Edible)/nrow(data)
table(data.dev$Edible)/nrow(data.dev)
table(data.val$Edible)/nrow(data.val)

#Run the random forest algorithm with number of trees being 100
#The more the better, but we don't want to over do it.
rf = randomForest(Edible ~ ., 
                   ntree = 100,
                   data = data.dev)

#This plot will tell us if the number of trees we pick will give good results.
#As you can see 10-30 trees causes a minor error span.
plot(rf)
print(rf)

#Plot the top 10 variables for prediction of edible vs posionous.
varImpPlot(rf,
           sort = T,
           n.var=10,
           main="Top 10 - Variable Predictors")

#Looks like Odor is the greatest indicator along with Spore Print Color

var.imp = data.frame(importance(rf,
                                 type=2))

#Make row names as columns
var.imp$Variables <- row.names(var.imp)
var.imp[order(var.imp$MeanDecreaseGini,decreasing = T),]

#Predicting response variable
data.dev$predicted.response <- predict(rf , data.dev)

# Create Confusion Matrix for the traning data
#Calculates a cross-tabulation of observed and predicted classes with associated statistics.
confusionMatrix(data = data.dev$predicted.response,
                reference = data.dev$Edible,
                positive = 'Edible')


# Predicting response variable
data.val$predicted.response <- predict(rf ,data.val)

# Create Confusion Matrix for the test data
#Calculates a cross-tabulation of observed and predicted classes with associated statistics.
confusionMatrix(data=data.val$predicted.response,
                reference=data.val$Edible,
                positive='Edible')

#With odor and spore print color we can predict almost 99% of the time.

#Lets plot some jitter classification plots to show what odors and spore print colors show the poisonous mushrooms

#This plot shows that CapShape and CapSurface really dont give a good indication of edible mushrooms
p = ggplot(data,aes(x=CapShape, y=CapSurface, color=Edible))
p + geom_jitter(alpha=0.3) + scale_color_manual(breaks = c('Edible','Poisonous'),values=c('blue','orange'))

p = ggplot(data,aes(x=StalkColorBelowRing, y=StalkColorAboveRing, color=Edible))
p + geom_jitter(alpha=0.3, width = 0.5) + scale_color_manual(breaks = c('Edible','Poisonous'),values=c('blue','orange'))

#Odor and SporePrintColor are the best predictors
p = ggplot(data,aes(x=Odor, y=SporePrintColor, color=Edible))
p + geom_jitter(alpha=0.3, width = 0.5) + scale_color_manual(breaks = c('Edible','Poisonous'),values=c('blue','orange'))

#Odor and SporePrintColor are the best predictors
#This plot gives a excellent visual of odor vs spore color
p = ggplot(data,aes(x=Edible, y=Odor, color = Edible))
p + geom_jitter(alpha=0.2, width = 0.1) + scale_color_manual(breaks = c('Edible','Poisonous'),values=c('blue','orange'))

p = ggplot(data,aes(x=Edible, y=SporePrintColor, color = Edible))
p + geom_jitter(alpha=0.2, width = 0.1) + scale_color_manual(breaks = c('Edible','Poisonous'),values=c('blue','orange') )

