full_info <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

info1 <- subset(full_info, Date %in% c("1/2/2007","2/2/2007"))

info1$Date <- as.Date(info1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(info1$Date), info1$Time)

info1$Datetime <- as.POSIXct(datetime)

with(info1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)