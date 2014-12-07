# Reading data into R
ele_cons <- read.table("household_power_consumption.txt", sep=";", nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting data to obtain the data of required two days
ele_sub <- subset(ele_cons, (ele_cons$Date == "1/2/2007" | ele_cons$Date == "2/2/2007"))

# Changing the class of Date variable from character to Date
ele_sub$Date <- as.Date(ele_sub$Date, format = "%d/%m/%Y")

# Creating the plot1
png("plot1.png", width = 480, height = 480)
hist(ele_sub$Global_active_power, main = "Global Active Power", col = 'red', ylab = "Frequency", xlab = "Global Active Power(kilowatts)")
dev.off()