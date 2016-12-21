#Faithful Exercise

#Open dataset

View(faithful)

#Understand data structure

str(faithful)

#Calculate summary statistics

min(faithful$waiting)
max(faithful$waiting)
mean(faithful$waiting)
median(faithful$waiting)

#Visualize data

hist(faithful$waiting)
hist(faithful$eruptions)

plot(faithful)
abline(lm(faithful$waiting~faithful$eruptions), col="red")