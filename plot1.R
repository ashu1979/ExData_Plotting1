##Function to read data from file then filter the data and plot the result on Histogram.
plot1 <- function()
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
  png(filename="plot1.png")
  ## Plot histogram with specified column with desired properties.
  hist(febhpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  ## Close the file device.
  dev.off()
}