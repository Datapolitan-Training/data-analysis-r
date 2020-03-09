# Reference information from the 311 Data Exercises

# TO INSTALL A NEW PACKAGE

install.packages("dplyr")

# IF YOU GET A WINDOWS ERROR with ggplot2

ggplot2::ggplot(data=cbpkg, ggplot2::aes(x=hour))+ ggplot2::geom_bar(stat="count")
