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

#LET'S ADD SOME PACKAGES!

require(dplyr)
require(lubridate)
require(ggplot2)

#TO INSTALL A NEW PACKAGE

install.packages("dplyr")

#DPLYR MAKES IT EASIER TO FILTER DATA

#Look at a subset of complaints in a particular borough, sorted by community board. Replace Borough and Complaint.Type.

tbldata <- tbl_df(mydata) 
seven <- select(tbldata, Created.Date, Complaint.Type, Descriptor, Location.Type, Incident.Zip, Community.Board, Borough)
boropkg <- filter(seven, Borough == "BROOKLYN", Complaint.Type == "Derelict Vehicles")

# Create a filter for another borough. You can get the levels for the Factor Borough
# by typing levels(mydata$Borough)

cbpkg <- arrange(boropkg, Community.Board)
View(cbpkg)

#LUBRIDATE MAKES IT EASIER TO WORK WITH TIME DATA

date <- mdy_hms(as.character(cbpkg$Created.Date))
hr <- hour(date)

# NOW USE DPLYR TO ADD THIS COLUMN
cbpkg <- mutate(cbpkg, hour = hr)
View(cbpkg)

#GGPLOT2 OFFERS MORE DATA VIZ POSSIBILITIES

ggplot(data=cbpkg, aes(x=hour)) + geom_bar(stat="count")

# OR (IF YOU GET A WINDOWS ERROR)

ggplot2::ggplot(data=cbpkg, ggplot2::aes(x=hour))+ ggplot2::geom_bar(stat="count")

#ADD A TITLE AND LEGEND

ggplot(data=cbpkg, aes(x=hour)) + geom_bar(stat="count") + ggtitle("Number of Derelict Vehicle 311 Complaints by Hour in Community District 08-Brooklyn")

#LEARN MORE ABOUT ANY OF THESE PACKAGES (CLICK "HTML" LINK)

browseVignettes(package = "dplyr")
browseVignettes(package = "lubridate")
browseVignettes(package = "ggplot2")

?dplyr
?lubridate
?ggplot2 
       


