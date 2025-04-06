#set directory and download ggplot library
setwd("C:/Users/Ariella's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis/final assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# Aggregate total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") from 1999 to 2008.
baltimore <- NEI[NEI$fips=="24510",]
ATB <- aggregate(Emissions ~ year, baltimore,sum)

# Create the PNG file with specified width and height
png("plot3.png", width=480, height=480)

#plot data for plot3
plot3 <- ggplot(baltimore, aes(factor(year), Emissions, fill = type)) +
              geom_bar(stat = "identity") +
              theme_bw() + guides(fill = FALSE) +
              facet_grid(.~type, scales = "free", space = "free") + 
              labs(x = "year", 
                   y = expression("Total PM"[2.5]*" Emission (Tons)"), 
                   title = expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
print(plot3)

# close the PNG file
dev.off()
