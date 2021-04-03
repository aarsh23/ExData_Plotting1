full_info <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

info1 <- subset(full_info, Date %in% c("1/2/2007","2/2/2007"))

info1$Date <- as.Date(info1$Date, format="%d/%m/%Y")

hist(info1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)


