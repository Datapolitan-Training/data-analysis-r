# graph the top 5 locations in the data
tbl_loc <- table(mydata$Location.Type)
#graph the top 5 complaints 
barplot(head(sort(tbl_loc,decreasing = TRUE),5)) 


md_small <- mydata[,c(2,6,7,8,9,11,24,25)]

junc_blvd_zip <- md_small[md_small$Incident.Zip == '11373' & md_small$Street.Name == 'JUNCTION BOULEVARD',]
