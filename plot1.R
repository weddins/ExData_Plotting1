# Create the first graph
setwd("C:/coursera/DataScientist/4-ExpDataAnalysis/Project 1")
rm(list=ls())
# Read the dataset
chrFile <- "household_power_consumption.txt"
dfPwr <- read.csv2(chrFile, header = TRUE, 
                   stringsAsFactors = FALSE, na.strings = "?")

# Filter the appropriate dates
dfPwr$Date <- as.POSIXct(dfPwr$Date, format = "%d/%m/%Y")
dfPwr <- dfPwr[dfPwr$Date>="2007-02-01" & dfPwr$Date<="2007-02-02",]

# Convert column to numeric
dfPwr$Global_active_power <- as.numeric(dfPwr$Global_active_power)


# Create the first graph
hist(dfPwr$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off() ## Close the PDF file device
