prepareData <- function(file=""){
  
  if(file==""){
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
  }
  else{
    print("Getting data into memory...")
    allHouseHold <- read.csv(file, sep = ";",na.strings = "?")  
  }
  
  #Processing data
  print("Processing data")
  #Casting the values from factor to Data types
  allHouseHold$Date <- strptime(paste(allHouseHold$Date,allHouseHold$Time),
                                format="%d/%m/%Y %H:%M:%S")
  #Filtering the data
  beginning <- strptime(x = "01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
  ending <- strptime(x = "03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
  #This is the data we return
  workingData <- allHouseHold[(allHouseHold$Date>=beginning &
                                 allHouseHold$Date<ending),]
  
}