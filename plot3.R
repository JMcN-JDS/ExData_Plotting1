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
par(mfrow = c(1,1))

feb1st2nd2007data$Sub_metering_1 <- as.numeric(feb1st2nd2007data$Sub_metering_1)
feb1st2nd2007data$Sub_metering_2 <- as.numeric(feb1st2nd2007data$Sub_metering_2)
feb1st2nd2007data$Sub_metering_3 <- as.numeric(feb1st2nd2007data$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(feb1st2nd2007data$DateTime, feb1st2nd2007data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(feb1st2nd2007data$DateTime, feb1st2nd2007data$Sub_metering_2, type = "l", col = "red")
lines(feb1st2nd2007data$DateTime, feb1st2nd2007data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()
