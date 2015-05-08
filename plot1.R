## Code for Plot1 in Course Project1

## Read local file
hhp <- read.csv("~/Desktop/RWD/household_power_consumption.txt", sep=";", header = TRUE, quote="", na.strings = "NA")

## Use data.table to subset the rows for Feb 1 and 2, 2007
library(data.table)
hhp <- hhp[c(66637:69516),]

## Convert the Global active power variable from factor to numeric
hhp$Global_active_power <- as.character(hhp$Global_active_power)
hhp$Global_active_power <- as.numeric(hhp$Global_active_power)

## Plot a histogram on screen device
hist(hhp$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Copy the histogram on screen device as a png file
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()

## row numbers for subsetting the file
## 66637 -> 1/2/2007 00:00:00
## 68076 -> 1/2/2007 23:59:00
## 69516 -> 2/2/2007 23:59:00