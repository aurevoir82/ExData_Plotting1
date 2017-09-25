archivo <- "household_power_consumption.txt"
datos <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subDatos <- datos[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subDatos)
globalActivePower <- as.numeric(subDatos$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()