full_info <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

info1 <- subset(full_info, Date %in% c("1/2/2007","2/2/2007"))

info1$Date <- as.Date(info1$Date, format="%d/%m/%Y")

timeanddate <- paste(as.Date(info1$Date), USEDdata$Time)

info1$timeanddate <- as.POSIXct(timeanddate)

##code to make plot 2
with(info1, {
  plot(Global_active_power~timeanddate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)