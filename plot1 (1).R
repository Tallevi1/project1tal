#set directory
setwd("C:/Users/Tal's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis/final assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
AT <- aggregate(Emissions ~ year,NEI, sum)

# Create the PNG file with specified width and height
png("plot1.png", width=480, height=480)

#plot data for plot1
barplot((AT$Emissions)/10^6, 
        names.arg = AT$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (10^6 Tons)",
        main = "Total PM2.5 Emissions From All US Sources",
        col = "black")

# close the PNG file
dev.off()
