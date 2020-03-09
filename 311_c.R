# Packages help extend the functionality of R as well as making some basic functionality easier. 

# DPLYR MAKES IT EASIER TO FILTER DATA
library(dplyr)
# for more information, see https://www.rdocumentation.org/packages/dplyr/versions/0.7.8

# Look at a subset of complaints in a particular borough, sorted by community board. Replace Borough and Complaint.Type.

# Create a dplyr object from mydata
tbldata <- tbl_df(mydata) 

# deal with not finding the code 
# https://www.tidyverse.org/articles/2018/06/conflicted/
tbldata <- dplyr::as_tibble(mydata) # new version of dplyr

# Select only 7 columns from tbldata
tbl_small <- select(tbldata, Created.Date, Complaint.Type, Descriptor, Location.Type, Incident.Zip, Community.Board, Borough)

# Filter tbl_small for specific rows
brklyn_dv <- filter(tbl_small, Borough == "BROOKLYN", Complaint.Type == "Derelict Vehicles")

# Arrange brklyn_dv by Community.Board (optional)
brklyn_dv <- arrange(brklyn_dv, Community.Board)
View(brklyn_dv)

# LUBRIDATE MAKES IT EASIER TO WORK WITH TIME DATA
library(lubridate)
?lubridate # for more information on lubridate

date <- mdy_hms(as.character(brklyn_dv$Created.Date))
hr <- hour(date)

# NOW USE DPLYR TO ADD THIS COLUMN

brklyn_dv <- mutate(brklyn_dv, hour = hr)
View(brklyn_dv)

# GGPLOT2 OFFERS MORE DATA VIZ POSSIBILITIES
library(ggplot2)
?ggplot2 # for more information on ggplot2

ggplot(data=brklyn_dv, aes(x=hour)) + geom_bar(stat="count")

#ADD A TITLE AND LEGEND

ggplot(data=brklyn_dv, aes(x=hour)) + geom_bar(stat="count") + ggtitle("Number of Derelict Vehicle 311 Complaints by Hour in Community District 08-Brooklyn")




       


