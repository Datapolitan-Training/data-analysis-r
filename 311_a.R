# 311 DATA EXERCISE
# Goal: Explore the 311 dataset using basic R commands. 
# Directions: Run through the code line by line. Replace INSERTCOLUMNNAME as needed.
# Use ? if you get lost, ask a neighbor, or raise your hand

# LOAD DATASET
# key command: read.csv()

mydata <- read.csv("https://s3.amazonaws.com/datapolitan-training-files/311_Requests_Oct15_Nov20.csv", header=TRUE, sep=",")

# Explore dataset

dim(mydata)
colnames(mydata)
head(mydata)
head(mydata[,c(2,6,7,8,9,24,25)])
summary(mydata)
summary(mydata[,c(2,6,7,8,9,24,25)])

# Understand data structure
# Identify the class of Borough, Complaint.Type, Incident Zip, and Created.Date

str(mydata[,c(2,6,7,8,9,24,25)])
class(mydata$Borough)
class(mydata$INSERTCOLUMNNAME)

# Calculate summary statistics for 1-2 of the above columns

min(mydata$Borough)
max(mydata$INSERTCOLUMNNAME)
mean(mydata$INSERTCOLUMNNAME)
median(mydata$INSERTCOLUMNNAME)

# What happens when you calculate these statistics? Why do you think that is?

summary(mydata$Borough)
table(mydata$Borough)

# What's the difference between summary & table? What are these results showing?  
# Pivot tables 

# Visualize data

hist(mydata$Borough)
hist(mydata$Incident.Zip)

# What's going on here? Why do you think that is? 

hist(table(mydata$Borough))

# Is this right?  Not quite...
# When we work with factor data we need the barplot() command instead of the hist() command

barplot(table(mydata$Borough))