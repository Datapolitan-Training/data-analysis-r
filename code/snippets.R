
#### Old Faithful Data Set

# filtering rows and return result
faithful[faithful$eruptions <=5,]
faithful[faithful$eruptions >=4,]

# count rows matching filter condition
nrow(faithful[faithful$eruptions >=4,]) 


# sort the dataframe 
df[order(df$column_to_sort_by),] # general pattern
faithful[order(faithful$waiting),] # order by waiting time (ascending)
faithful[order(faithful$eruptions,decreasing = TRUE),] # order by eruptions (descending)
faithful[order(faithful$waiting,decreasing = TRUE),] # order by waiting time (descending)

# alternative sort syntax
faithful[order(faithful$eruptions),] # ascending
faithful[order(-faithful$eruptions),] # descending

faithful[order(faithful$waiting),] # ascending
faithful[order(-faithful$waiting),]  # descending

# sort on multiple columns
faithful[order(faithful$eruptions,faithful$waiting),]


# create a histogram with label
hist(faithful$waiting, main="Time Until Eruptions of Old Faithful", xlab="Old Faithful Waiting Time")


#### 311 Exercise

# Read from local copy 
mydata <- read.csv("311_Requests_Oct15_Nov20.csv", header=TRUE, sep=",")

# SEE PERCENTAGES in the table
borocounts <- table(mdsmall$Borough) # assign table to variable borocounts
prop.table(borocounts) # generate the percentages table
barplot(prop.table(borocounts)) #chart the percentages in a barplot

# Complaints by boro
boro_complaints <- table(mydata$Complaint.Type, mydata$Borough)
barplot(complaints)

# Get the date from the timestamp
ts <- mdy_hms(as.character(md_small$Created.Date))
dt <- date(ts)
md_small <- mutate(md_small,date = dt)

# get counts by date
dt_count <- table(md_small$date[md_small$date != '2016-11-20']) # partial count for 20 Nov 2016

# calculate the average per day 
mean(dt_count)

# Plot the dates above in a line chart
plot(dt_count,type="l")

# Fuzzy match 
# Filter Parameters (https://www.rdocumentation.org/packages/dplyr/versions/0.7.3/topics/filter)

df <- tbl_df(mydata)
df <- select(df, Created.Date, Complaint.Type, Descriptor, Borough)
df <- filter(df, Borough == "BROOKLYN", Complaint.Type %in% c("Noise", "Noise - Commercial", "Noise - Residential"))

# Combine on an OR condition (Complaint.Type "Illegal Parking" OR "Blocked Driveway")
henrypkg <- filter(subset, Community.Board == "11 QUEENS", Complaint.Type == "Illegal Parking" | Complaint.Type == "Blocked Driveway" )

# Combine the mutate into a single liner
#HEAT/HOT WATER is the top complaint so when does that happen
flatbush_heat <- filter(flatbush, Complaint.Type == "HEAT/HOT WATER")
flatbush_heat <- mutate(flatbush_heat, hour = hour(mdy_hms(as.character(flatbush_heat$Created.Date))))

# Find most common complaint types
compcount <- sort(table(mydata$Complaint.Type), decreasing=TRUE)
compcount
head(compcount)
barplot(head(compcount))

# Most common complaint types in Manhattan
manhattan <- mydata[mydata$Borough == "MANHATTAN", ]
compcountmanhattan <- sort(table(manhattan$Complaint.Type), decreasing=TRUE)
compcountmanhattan
barplot(head(compcountmanhattan),main="Top 6 Complaint Types in Manhattan\n15 October - 20 November 2016")
