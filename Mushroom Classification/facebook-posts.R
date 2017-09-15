

setwd(getwd())
library(readr)
library(ggplot2)
library(MASS)
dd <- read_csv("~/Downloads/P1TrainingData.csv", 
                           col_names = FALSE)
head(dd)
tail(dd)

#convert to a data frame
dd <- as.data.frame(dd)

#look at the variable names
str(dd)

#looks like we will need to rename the columns to keep things organized according to the appendix.
#also we are only interested in columns 1-4 and 29-42, so lets drop the rest, (X5-X30)

dd <- subset(dd, select = -c(X5:X29))

#change column names to match the appendix
names(dd)[names(dd)=="X1"] <- "TargetVariable"
names(dd)[names(dd)=="X2"] <- "PagePopularity"
names(dd)[names(dd)=="X3"] <- "Checkins"
names(dd)[names(dd)=="X4"] <- "PageTalkingAbout"
names(dd)[names(dd)=="X5"] <- "PageCatagory"
names(dd)[names(dd)=="X31"] <- "Comments"
names(dd)[names(dd)=="X32"] <- "Comments24"
names(dd)[names(dd)=="X33"] <- "Comments2448"
names(dd)[names(dd)=="X34"] <- "Comment24Post"
names(dd)[names(dd)=="X35"] <- "CommentDiff2448"
names(dd)[names(dd)=="X36"] <- "BaseTime"
names(dd)[names(dd)=="X37"] <- "PostLength"
names(dd)[names(dd)=="X38"] <- "PostShareCount"
names(dd)[names(dd)=="X39"] <- "PostPromotionStatus"
names(dd)[names(dd)=="X40"] <- "Hours"
names(dd)[names(dd)=="X41"] <- "PostPublishedWeekday"
names(dd)[names(dd)=="X42"] <- "BaseDateTimeWeekday"

#check that the column name where changed
str(dd)

#let get some descriptive stats on number of comments per hour.
summary(dd$TargetVariable) 
summary(dd$BaseTime)

#see the average time a comment is placed, lools like every 12mins
sum(dd$TargetVariable)/sum(dd$BaseTime)

#quick look at the data with a pairs plot to see any patterns in comment volume
pairs(~ dd$TargetVariable + dd$Comments + dd$Comments24 + dd$Comments2448, main = "Comment Volume All, 24hrs, 24-28hrs")

#scatter plot of number of comments vs the basetime
ggplot(dd, aes(x=dd$BaseTime, y=dd$TargetVariable)) +
  geom_point(color="blue") +
  labs(x="Hours", y="Comments", title="Comments by Hour") + 
  theme(plot.title = element_text(hjust = 0.5, size = 20) )

attach(dd)
#create a model
model.lm <- lm(BaseTime ~ TargetVariable + Comments + Comments24, Comments2448, data = dd)
summary(model.lm)

coefficients(model.lm)
fitted(model.lm)

step <- stepAIC(model.lm, direction="both")
step$anova

predict.list <- predict(model.lm, 
                        newdata = data.frame(BaseTime < 23)) 

predict.list
plot(predict.list)

newdata = data.frame(dd$BaseTime = c(35), se.fit = TRUE) 
predict(model.lm, newdata, interval="predict") 
plot(model.lm)





