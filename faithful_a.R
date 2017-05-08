#Faithful Exercise
# Goal: Explore R Studio and basic commands in R
# Directions: Run through line by line. 
# Use ? if you get lost, ask a neighbor, or raise your hand

#Open dataset

View(faithful)
?faithful 

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

plot(faithful, main="Eruptions of Old Faithful", xlab="Eruption Time in Minutes", ylab="Waiting Time to Next Eruption in Min")
abline(lm(faithful$waiting~faithful$eruptions), col="red")