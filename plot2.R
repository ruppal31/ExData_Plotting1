data <- read.table("C:\\Users\\dparo\\Downloads\\exdata_data_household_power_consumption\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))

# Filter rows for 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filtered_data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
filtered_data$Datetime <- strptime(paste(filtered_data$Date, filtered_data$Time), 
                                   format = "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(filtered_data$Datetime, filtered_data$Global_active_power, 
     type = "l", col = "blue",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

