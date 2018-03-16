library(dplyr)
library(lubridate)
library(ggplot2)

#Load Data 

mydata <- read.csv("https://s3.amazonaws.com/datapolitan-training-files/311_Requests_Oct15_Nov20.csv", header=TRUE, sep=",")

#Create Subset

df <- tbl_df(mydata)
df <- select(df, Created.Date, Complaint.Type,Descriptor, Borough)
df <- filter(df, Borough == "BROOKLYN", Complaint.Type %in% c("Noise", "Noise - Commercial", "Noise - Residential"))

# Add Hour Column 
date <- mdy_hms(as.character(df$Created.Date))
hour <- hour(date)

# Plot Noise Complaints by Hour in Brooklyn 
df <- mutate(df, hour = hour)
View(df)
ggplot(data=df, aes(x=hour)) + geom_bar(stat="count") + ggtitle("Noise Complaints by Hour in Brooklyn")

#Plot Noise Complaints by Type in Brooklyn
ggplot(data=df, aes(x=Complaint.Type)) + geom_bar(stat="count")

#Plot Noise Complaints by Hour & Type in Brooklyn 
ggplot(data=df, aes(x=hour, fill=Complaint.Type)) + geom_bar(stat="count") + ggtitle("Noise Complaints by Hour in Brooklyn")
