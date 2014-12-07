# Reading data into R
ele_cons <- read.table("household_power_consumption.txt", sep=";", nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting data to obtain the data of required two days
ele_sub <- subset(ele_cons, (ele_cons$Date == "1/2/2007" | ele_cons$Date == "2/2/2007"))

# Changing the class of Date & Time variable from character to Date & Time
ele_sub$Date <- as.Date(ele_sub$Date, format = "%d/%m/%Y")
ele_sub$DateTime <- as.POSIXct(paste(ele_sub$Date, ele_sub$Time))

# Creating the plot3
png("plot3.png", width = 480, height = 480)
plot(ele_sub$DateTime, ele_sub$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(ele_sub$DateTime, ele_sub$Sub_metering_2, type = "l", col = "red")
lines(ele_sub$DateTime, ele_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()