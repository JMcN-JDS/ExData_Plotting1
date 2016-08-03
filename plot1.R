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

png("plot1.png", width = 480, height = 480)
hist(feb1st2nd2007data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()


