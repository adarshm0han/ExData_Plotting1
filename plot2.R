textdata<- read.table("household_power_consumption.txt",   sep=';', header=TRUE, stringsAsFactors=FALSE, na.strings="?", nrows=2075259)
subdata<- subset(textdata, textdata$Date=="1/2/2007" | textdata$Date=="2/2/2007")

dt <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap<-as.numeric(subdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dt, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

while(!is.null(dev.list()))
  dev.off()

