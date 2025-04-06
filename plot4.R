#set directory and download ggplot library
setwd("C:/Users/Tal's laptop/OneDrive - weizmann.ac.il/MSc weizmann/Coursera exploratory data analysis/final assignment")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# subset coal combustion source factors in NEI data.
comR <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coalR <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE) 
coalCom <- (comR & coalR)
CSCC <- SCC[coalCom,]$SCC
CNEI <- NEI[NEI$SCC %in% CSCC,]

# Create the PNG file with specified width and height
png("plot4.png", width=480, height=480)

#plot data for plot4
plot4 <- ggplot(CNEI,aes(factor(year),Emissions/10^5)) +
              geom_bar(stat = "identity", fill="darkgrey", width = 0.6) +
              theme_bw() + guides(fill = FALSE) +
              labs(x = "year", 
                   y = expression("Total PM"[2.5]*" Emission (10^5 Tons)"), 
                   title = expression("PM"[2.5]*" Coal Combustion Source Emissions Across the US from 1999-2008"))
print(plot4)

# close the PNG file
dev.off()
