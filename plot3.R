plot3 <- function() {
  ## Download the file to the working directory
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip")
  data.dt <- read.table(unz("./power.zip", "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
  
  ## concatenate and convert the character date and time strings to POSIX
  data.dt$Time <- strptime(paste(data.dt$Date, data.dt$Time), format="%d/%m/%Y %H:%M:%S")
  
  ## convert character data string to Date class
  data.dt$Date <- as.Date(data.dt$Date, "%d/%m/%Y")
  
  ## subset the larger data for only the two days required
  plot.data <- subset(data.dt, data.dt$Date == as.Date("01/02/2007", "%d/%m/%Y") | data.dt$Date == as.Date("02/02/2007", "%d/%m/%Y"))
  
  ## open graphics device
  png(filename="plot3.png")
  
  ## create requested plot in a png file staring with a blank canvas and adding each line
  plot(plot.data$Time, plot.data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering ")
  lines(plot.data$Time, plot.data$Sub_metering_1, col="black")
  lines(plot.data$Time, plot.data$Sub_metering_2, type="l", col="red", xlab="", ylab="")
  lines(plot.data$Time, plot.data$Sub_metering_3, type="l", col="blue", xlab="", ylab="")
  legend("topright", pch="____", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  ## close graphics device
  dev.off()
}