##Function to read data from file then filter the data and plot the results with multiple Energy sub metering line.
plot3 <- function()
{
  ##Read data from specified file.
  hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  ##Convert Date column to Date data type format.
  hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
  ##Subset data only for 2 days in February 2007.
  febhpc <- subset(hpc, hpc$Date==as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"))
  ##Change the Time column to Date/Time format.
  febhpc$Time <- strptime(paste(febhpc$Date, febhpc$Time), format="%Y-%m-%d %H:%M:%S")
  ## Initialize png file device, with default hight and width 480x480 in pixel. 
  png(filename="plot3.png")
  ## Plot empty canvas with desired properties.
  plot(sub$Time, sub$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
  ## Add lines for different sub metering with black, red and blue colors.
  lines(sub$Time, sub$Sub_metering_1, col="black")
  lines(sub$Time, sub$Sub_metering_2, col="red")
  lines(sub$Time, sub$Sub_metering_3, col="blue")
  ## Add legend to plot.
  legend("topright", lty=c(1, 1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ## Close the file device.
  dev.off()
}