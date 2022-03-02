textdata<- read.table("household_power_consumption.txt",   sep=';', header=TRUE, stringsAsFactors=FALSE, na.strings="?", nrows=2075259)
subdata<- subset(textdata, textdata$Date=="1/2/2007" | textdata$Date=="2/2/2007")


subdata$Date<- as.Date(subdata$Date, format="%d/%m/%Y")

hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)

while(!is.null(dev.list()))
  dev.off()

