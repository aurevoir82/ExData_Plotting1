archivo <- "household_power_consumption.txt"
datos <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDatos <- datos[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subDatos)
datetime <- strptime(paste(subDatos$Date, subDatos$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subDatos$Global_active_power)
subMetering1 <- as.numeric(subDatos$Sub_metering_1)
subMetering2 <- as.numeric(subDatos$Sub_metering_2)
subMetering3 <- as.numeric(subDatos$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()