# 311 DATA EXERCISE

# LOAD DATASET
#key command: read.csv()

mydata <- read.csv("https://s3.amazonaws.com/datapolitan-training-files/311_Requests_Oct15_Nov20.csv", header=TRUE, sep=",")

# EXPLORE DATA
# key commands: nrow(), ncol(), colnames(), head(), str()

nrow(mydata)
ncol(mydata)
colnames(mydata)
head(mydata$Borough)
head(mydata$Complaint.Type)
str(mydata$Complaint.Type)

# MISSING VALUES
# key command: is.na()

summary(is.na(mydata$Borough))
summary(is.na(mydata$Complaint.Type))

# TABLES
#key commands: table(), prop.table()
#extra skills: sort(), data.frame(), subset()

#make a table showing the number of complaints from ea boro
borocounts <- table(mydata$Borough)
borocounts

#make a table showing the percentage of complaints from ea boro
prop.table(borocounts)

#make a table showing the number of complaints by type
complaints <- table(mydata$Complaint.Type)
complaints

#sort that table to show the most frequent complaint types
sort(complaints)

#make a table of just the top five complaints
complaintsdf <- data.frame(complaints)
topfive <- subset(complaintsdf, Freq > 8500)
topfive

#make a table to show the top complaints in one boro

bronx <- subset(mydata, Borough == 'BRONX')
bxcomplaints <- table(bronx$Complaint.Type)
sort(bxcomplaints)

bxdf <- data.frame(bxcomplaints)
bxtopfive <- subset(bxdf, Freq > 2000)
bxtopfive

# PLOTS
#key command: barplot()
#key parameters: main, ylab, xlab

barplot(borocounts, main="Complaints by Borough", ylab="Number of Complaints")

#Data Analytics with R by Richard Dunks and Julia Marden is licensed under a
#Creative Commons Attribution-ShareAlike 4.0 International License.
