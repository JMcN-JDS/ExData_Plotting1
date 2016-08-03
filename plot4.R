#Moving the R file to the current wd
my.file.rename <- function(from, to) {
        todir <- dirname(to)
        if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
        file.rename(from = from,  to = to)
}

my.file.rename(from = "/Users/jonathan.mcnulty/Downloads/household_power_consumption.txt",
               to = "/Users/jonathan.mcnulty/household_power_consumption.txt")

#Loading the data
household_power_consumption <- read.csv(file = "./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#Subsetting the data
feb1st2nd2007data$Global_active_power <- as.numeric(feb1st2nd2007data$Global_active_power)

#Creating the PNG file and the plot

feb1st2nd2007data$DateTime <- strptime(paste(feb1st2nd2007data$Date, feb1st2nd2007data$Time, sep = ""), format = "%d/%m/%Y %H:%M:%S")
feb1st2nd2007data$Voltage <- as.numeric(feb1st2nd2007data$Voltage)
feb1st2nd2007data$Global_reactive_power <- as.numeric(feb1st2nd2007data$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#top-left plot
plot(feb1st2nd2007data$DateTime, feb1st2nd2007data$Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)")
#top-right plot
plot(feb1st2nd2007data$DateTime, feb1st2nd2007data$Voltage, type = "l", xlab = "datetime", ylab= "Voltage")
#bottom-left plot
plot(feb1st2nd2007data$DateTime, feb1st2nd2007data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(feb1st2nd2007data$DateTime, feb1st2nd2007data$Sub_metering_2, type = "l", col = "red")
lines(feb1st2nd2007data$DateTime, feb1st2nd2007data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
#bottom-right plot
plot(feb1st2nd2007data$DateTime, feb1st2nd2007data$Global_reactive_power, type = "l", xlab = "datetime", ylab= "Global_reactive_power")
dev.off()
