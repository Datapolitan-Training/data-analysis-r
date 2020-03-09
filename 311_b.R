# 311 DATA EXERCISE PT 2
# Goal: Use R packages to create a subset of data and analyze it. 
# Directions: Run through the code line by line. Replace FILLER TEXT as needed.
# Use ? if you get lost, ask a neighbor, or raise your hand

# LOAD DATASET (only do if you need to reload the data)
# mydata <- read.csv("https://s3.amazonaws.com/datapolitan-training-files/311_Requests_Oct15_Nov20.csv", header=TRUE, sep=",")

# CREATE SUBSET

md_small <- mydata[,c(2,6,7,8,9,24,25)]

# FILTER RESULTS FOR YOUR ZIP CODE. REPLACE 11216.

zip <- md_small[md_small$Incident.Zip == 11216, ]
head(zip)

# FILTER RESULTS FOR YOUR COMMUNITY BOARD. REPLACE "08 BROOKLYN"

cd <- md_small[md_small$Community.Board == "08 BROOKLYN",] 
head(cd)
View(cd)

# TABLES

borocounts <- table(md_small$Borough)
borocounts

# SEE PERCENTAGES
prop.table(borocounts)

# ADD A COLUMN
complaints <- table(mydata$Complaint.Type, mydata$Borough)
complaints

# MAKE A BARPLOT

barplot(borocounts)
barplot(complaints)

