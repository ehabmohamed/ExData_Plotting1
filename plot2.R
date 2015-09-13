fileName <- "household_power_consumption.txt"
header <- read.table(file = fileName, 
                     sep = ";", 
                     nrows = 1)
data <- read.table(file = fileName, 
                   sep = ";", 
                   na.strings = "?", 
                   skip = 66637, 
                   nrows = 2880)
colnames(data) <- unlist(header)
data$datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(x = data$datetime, format = "%d/%m/%Y %H:%M:%S")
plot(data$datetime, data$Global_active_power, type = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines (data$datetime, data$Global_active_power, type = "l")
dev.copy(png,'plot2.png', width=480, height=480)
dev.off()

