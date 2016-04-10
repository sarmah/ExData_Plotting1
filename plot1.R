plot1 <- function() {
  ## Download the file to the working directory
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip")
  data.dt <- read.table(unz("./power.zip", "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
  
  ## convert character data sdtring to Date class
  data.dt$Date <- as.Date(data.dt$Date, "%d/%m/%Y")
  
  ## subset the larger data for only the two days required
  plot.data <- subset(data.dt, data.dt$Date == as.Date("01/02/2007", "%d/%m/%Y") | data.dt$Date == as.Date("02/02/2007", "%d/%m/%Y"))
  
  ## open graphics device
  png(filename="plot1.png")
  
  ## plot requested histogram in a png file
  hist(plot.data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  ##close graphics device
  dev.off()
}