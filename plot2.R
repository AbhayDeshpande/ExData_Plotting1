# Reading data into R
ele_cons <- read.table("household_power_consumption.txt", sep=";", nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting data to obtain the data of required two days
ele_sub <- subset(ele_cons, (ele_cons$Date == "1/2/2007" | ele_cons$Date == "2/2/2007"))

# Changing the class of Date & Time variable from character to Date & Time
ele_sub$Date <- as.Date(ele_sub$Date, format = "%d/%m/%Y")
ele_sub$DateTime <- as.POSIXct(paste(ele_sub$Date, ele_sub$Time))

# Creating the plot2
png("plot2.png", width = 480, height = 480)
plot(ele_sub$DateTime, ele_sub$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()