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
plot(data$datetime, data$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub merering")
lines (data$datetime, data$Sub_metering_1, type = "l")
lines (data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines (data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black","red","blue"),
       cex = 0.75)
dev.copy(png,'plot3.png', width=480, height=480)
dev.off()
