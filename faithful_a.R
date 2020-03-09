# Faithful Exercise
# Goal: Explore R Studio and basic commands in R
# Directions: Run through line by line. 
# Use ? if you get lost, ask a neighbor, or raise your hand

# Open dataset

View(faithful)
?faithful 

# Syntax Error!

view(faithful)

# Explore dataset

nrow(faithful)
ncol(faithful)
colnames(faithful)
head(faithful)

# Understand data structure

str(faithful)
class(faithful$eruptions)
class(faithful$waiting)

# Calculate summary statistics

min(faithful$waiting)
max(faithful$waiting)
mean(faithful$waiting)
median(faithful$waiting)
summary(faithful)

# Visualize data

hist(faithful$waiting)
hist(faithful$eruptions)

plot(faithful, main="Eruptions of Old Faithful", xlab="Eruption Time in Minutes", ylab="Waiting Time to Next Eruption in Min")
abline(lm(faithful$waiting~faithful$eruptions), col="red")

# Now we want to work on sorting and filtering the data we had above

# Sorting by eruption times (ascending)


# Sorting by eruption times (descending)


# Filter for waiting times greater than 80


# How many instances (rows) have a waiting time greater than 80 (look at our examples above)


# What about waiting times greater than 30?


# Sort now by waiting time (ascending)


# Sort now by waiting time (descending)


# Sort by first Waiting Time and then Eruptions


# Sort by first Eruptions and then Waiting Time


# Filter for eruptions greater than or equal to 4 mintues


# Filter on two criteria (greater than or equal to 4 mins and waiting time greater than or equal to 70)

