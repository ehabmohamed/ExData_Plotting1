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
hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab ="Global Active Power (kilowatts)",
     col = "red")
dev.copy(png,'plot1.png', width=480, height=480)
dev.off()