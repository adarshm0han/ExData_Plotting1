textdata<- read.table("household_power_consumption.txt",   sep=';', header=TRUE, stringsAsFactors=FALSE, na.strings="?", nrows=2075259)
subdata<- subset(textdata, textdata$Date=="1/2/2007" | textdata$Date=="2/2/2007")

dt <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(subdata$Global_active_power)
smt1<-as.numeric(subdata$Sub_metering_1)
smt2<-as.numeric(subdata$Sub_metering_2)
smt3<-as.numeric(subdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dt, smt1, type="l", xlab="", ylab="Energy Submetering")
lines(dt, smt2, type="l", col="red")
lines(dt, smt3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

while(!is.null(dev.list()))
  dev.off()
