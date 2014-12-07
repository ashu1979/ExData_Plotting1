## Functions to add four different plots on single canvas.
plot4 <- function()
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
  png(filename="plot4.png")
  ## Change property to allow multiple plot on single canvas.
  par(mfrow=c(2,2))
  ## Plot first line graph for global active power.
  plot(sub$Time, sub$Global_active_power, ylab="Global Active Power", xlab="", type="l")
  ## Plot line graph for Voltage on same row next to above plot.
  plot(sub$Time, sub$Voltage, ylab="Voltage", xlab="datetime", type="l")
  ## Plot third graph for sub metering with legend on second row as first item.
  plot(sub$Time, sub$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
  lines(sub$Time, sub$Sub_metering_1, col="black")
  lines(sub$Time, sub$Sub_metering_2, col="red")
  lines(sub$Time, sub$Sub_metering_3, col="blue")
  legend("topright", lty=c(1, 1), bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ## Plot line graph for global reactive power next to sub metering plot on second row.
  plot(sub$Time, sub$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
  ## Close the file device.
  dev.off()
}