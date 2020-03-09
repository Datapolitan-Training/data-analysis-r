# Sorting by eruption times (ascending)
faithful[order(faithful$eruptions),]

# Sorting by eruption times (descending)
faithful[order(-faithful$eruptions),]


# Filter for waiting times greater than 80
faithful[faithful$waiting>80,]


# How many instances (rows) have a waiting time greater than 80 (look at our examples above)
nrow(faithful[faithful$waiting>80,]) 
dim(faithful[faithful$waiting>80,])

# What about waiting times greater than 30?
faithful[faithful$waiting>30,]

# Sort now by waiting time (ascending)
faithful[order(faithful$waiting),]

# Sort now by waiting time (descending)
faithful[order(-faithful$waiting),]


# Sort by first Waiting Time and then Eruptions
faithful[order(faithful$eruptions, faithful$waiting),]


# Sort by first Eruptions and then Waiting Time
faithful[order(faithful$waiting, faithful$eruptions),]


# Filter for eruptions greater than or equal to 4 mintues
faithful[faithful$eruptions >= 4,]


# Filter on two criteria (greater than or equal to 4 mins and waiting time greater than or equal to 70)
faithful[faithful$eruptions >= 4 &faithful$waiting >= 70,]