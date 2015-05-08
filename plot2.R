## Code for Plot2 in Course Project1

## Read local file
hhp <- read.csv("~/Desktop/RWD/household_power_consumption.txt", sep=";", header = TRUE, quote="", na.strings = "NA")

## ## Use data.table to subset the rows for Feb 1 and 2, 2007
library(data.table)
hhp <- hhp[c(66637:69516),]

## Generate a new variable which combines Date and Time and converts them to a "date"
datetime <- strptime(paste(hhp$Date, hhp$Time), format= "%d/%m/%Y %H:%M:%S")

## Convert the list of dates to a vector variable and 
## save it into the file as a new variable
datetimev <- as.vector(datetime)
hhp$datetime <- datetimev

## Convert the Global active power variable from factor to numeric and convert
## the new datetime variable from POSIXlt to POSIXct
hhps$Global_active_power <- as.character(hhps$Global_active_power)
hhps$Global_active_power <- as.numeric(hhps$Global_active_power)
hhp$datetime <- as.POSIXct(hhp$datetime)

## Plot Global active power against datetime on screen device
plot(hhp$Global_active_power ~ hhp$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="", mar=c(4,4,4,2), cex.lab=.75, cex.axis=.75)

## Save the plot on screen device as a png file
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
