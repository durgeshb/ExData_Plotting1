data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$newdate <- dmy(subSetData$Date)
 
globalActivePower <- as.numeric(subSetData$Global_active_power)

globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

voltage <- as.numeric(subSetData$Voltage)

submetering1 <- as.numeric(subSetData$Sub_metering_1)
submetering2 <- as.numeric(subSetData$Sub_metering_2)
submetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), voltage, type="l", xlab="datetime", ylab="Voltage")

plot(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), submetering2, type="l", col="red")
lines(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()