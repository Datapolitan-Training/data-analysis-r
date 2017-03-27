# 311 DATA EXERCISE

# LOAD DATASET
#key command: read.csv()

mydata <- read.csv("https://s3.amazonaws.com/datapolitan-training-files/311_Requests_Oct15_Nov20.csv", header=TRUE, sep=",")

#Explore dataset

dim(mydata)
colnames(mydata)
head(mydata)
head(mydata[,c(2,6,7,8,9,24,25)])
summary(mydata)
summary(mydata[,c(2,6,7,8,9,24,25)])

#Understand data structure
#Identify the class of Borough, Complaint.Type, Incident Zip, and Created.Date

str(mydata[,c(2,6,7,8,9,24,25)])
class(mydata$INSERTCOLUMNNAME)
class(mydata$INSERTCOLUMNNAME)

#Calculate summary statistics for 1-2 of the above columns

min(mydata$INSERTCOLUMNNAME)
max(mydata$INSERTCOLUMNNAME)
mean(mydata$INSERTCOLUMNNAME)
median(mydata$INSERTCOLUMNNAME)

#What happens when you calculate these statistics? Why do you think that is?

summary(mydata$INSERTCOLUMNNAME)
table(mydata$Complaint.Type)

# What's the difference between summary & table? What are these results showing?  
# Pivot tables 

#Visualize data

hist(mydata$Borough)
hist(mydata$Incident.Zip)

#What's going on here? Why do you think that is? 

hist(table(mydata$Borough))

# Is this right?  Almost... 

