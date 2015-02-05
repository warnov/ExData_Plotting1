plot1 <- function(allHouseHold){

  #We download the zip file
  print("Downloading Data...")
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)  
  
  #Loading the file data into memory
  print("Getting data into memory...")
  allHouseHold <- read.csv(unz(temp, "household_power_consumption.txt"),
                           sep = ";",na.strings = "?")  
  #Deleting temp files
  unlink(temp)
  
  #Processing data
  print("Processing data and generating graphics")
  #Casting the values from factor to Data types
  allHouseHold$Date <- as.Date(allHouseHold$Date, "%d/%m/%Y")
  #Filtering the data
  beginning <- as.Date("2007-02-01")
  ending <- as.Date("2007-02-02")
  workingData <- allHouseHold[(allHouseHold$Date>=beginning &
                                 allHouseHold$Date<=ending),]
  
  #Preparing the device with the specified size
  png(
    filename = 'plot1.png'
    , width = 480
    , height = 480
    , units = 'px'
    , res = NA
  )
  #Generationg the graphic with the suggested texts and colors
  hist(workingData$Global_active_power, col="red", 
       xlab = "Global Active Power (kilowatts)", 
       main="Global Active Power")
  #Flushing the file and closing the device
  dev.off()
  print("PNG File written")  
}