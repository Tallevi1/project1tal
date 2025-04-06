#set directory
setwd("C:/Users/Ariella's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis/final assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") from 1999 to 2008.
baltimore <- NEI[NEI$fips=="24510",]
ATB <- aggregate(Emissions ~ year, baltimore,sum)

# Create the PNG file with specified width and height
png("plot2.png", width=480, height=480)

#plot data for plot2
barplot(ATB$Emissions, 
        names.arg = ATB$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (Tons)",
        main = "Total PM2.5 Emissions From All Baltimore City Sources",
        col = "darkgreen")

# close the PNG file
dev.off()
