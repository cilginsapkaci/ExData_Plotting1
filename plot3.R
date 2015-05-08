## Code for Plot3 in Course Project1

## Read local file
hhp <- read.csv("~/Desktop/RWD/household_power_consumption.txt", sep=";", header = TRUE, quote="", na.strings = "NA")

## ## Use data.table to subset the rows for Feb 1 and 2, 2007
library(data.table)
hhp <- hhp[c(66637:69516),]

## Generate a new variable which combines Date and Time and converts them to a "date"
datetime <- strptime(paste(hhp$Date, hhp$Time), format= "%d/%m/%Y %H:%M:%S")

## Convert the list of dates to a vector variable and 
## save it into the file as a new variable, convert
## the new datetime variable from POSIXlt to POSIXct
datetimev <- as.vector(datetime)
hhp$datetime <- datetimev
hhp$datetime <- as.POSIXct(hhp$datetime)

## Convert the Sub metering variables from factor to numeric
hhp$Sub_metering_1 <- as.character(hhp$Sub_metering_1)
hhp$Sub_metering_1 <- as.numeric(hhp$Sub_metering_1)
hhp$Sub_metering_2 <- as.character(hhp$Sub_metering_2)
hhp$Sub_metering_2 <- as.numeric(hhp$Sub_metering_2)

## Plot on screen device
plot(hhp$Sub_metering_1 ~ hhp$datetime, type="l", xlab = "", ylab = "Energy sub metering", cex.lab=.75, cex.axis=.75)
lines(hhp$Sub_metering_2 ~hhp$datetime, type="l", col="red")
lines(hhp$Sub_metering_3 ~hhp$datetime, type="l", col="blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), pt.cex=1, cex=.60)

## Save the plot on screen device as a png file
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()