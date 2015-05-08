## Code for Plot4 in Course Project1

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

## Convert variables from factor to numeric as necessary
hhp$Global_active_power <- as.character(hhp$Global_active_power)
hhp$Global_active_power <- as.numeric(hhp$Global_active_power)

hhp$Sub_metering_1 <- as.character(hhp$Sub_metering_1)
hhp$Sub_metering_1 <- as.numeric(hhp$Sub_metering_1)

hhp$Sub_metering_2 <- as.character(hhp$Sub_metering_2)
hhp$Sub_metering_2 <- as.numeric(hhp$Sub_metering_2)

hhp$Voltage <- as.character(hhp$Voltage)
hhp$Voltage <- as.numeric(hhp$Voltage)

hhp$Global_reactive_power <- as.character(hhp$Global_reactive_power)
hhp$Global_reactive_power <- as.numeric(hhp$Global_reactive_power)

## Plot on screen device
par(mfrow = c(2,2), mar = c(5,4,2,1), oma = c(0,0,2,0), mgp = c(2,0.5,0))
with(hhp,{
    plot(hhp$Global_active_power ~ hhp$datetime, type="l", ylab="Global Active Power", xlab="", cex.lab=.75, cex.axis=.75)
    plot(hhp$Voltage ~ hhp$datetime, type="l", ylab="Voltage", xlab="datetime", cex.lab=.75, cex.axis=.75)
    plot(hhp$Sub_metering_1 ~ hhp$datetime, type="l", xlab = "", ylab = "Energy sub metering", cex.lab=.75, cex.axis=.75)
    lines(hhp$Sub_metering_2 ~hhp$datetime, type="l", col="red")
    lines(hhp$Sub_metering_3 ~hhp$datetime, type="l", col="blue")
    legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), bty="n", pt.cex=1, cex=.60)
    plot(hhp$Global_reactive_power ~ hhp$datetime, type="l", ylab="Global_reactive_power", xlab="datetime", cex.lab=.75, cex.axis=.75)
    
})

## Save the plot on screen device as a png file
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()