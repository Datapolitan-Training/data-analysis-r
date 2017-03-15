#Faithful Exercise

#Open dataset

View(faithful)

#Explore dataset

nrow(faithful)
ncol(faithful)
colnames(faithful)
head(faithful)

#Understand data structure

str(faithful)
class(faithful$eruptions)
class(faithful$waiting)

#Calculate summary statistics

min(faithful$waiting)
max(faithful$waiting)
mean(faithful$waiting)
median(faithful$waiting)
summary(faithful)

#Visualize data

hist(faithful$waiting)
hist(faithful$eruptions)

plot(faithful)
abline(lm(faithful$waiting~faithful$eruptions), col="red")