#This function is intended to download the raw data, 
#then convert factors to dates, and filter as stated in the project instructions.
#It returns a dataset ready to be plotted with the options described.
#It allows to indicate the name of the .txt file with all the raw data if it has been
#already downloaded, through the "file" parameter.
#If the "file" parameter is omitted, then, the .zip file is downloaded again 
#and stored in a temporary file, for its reading. After being read into memory,
#the temporary file is deleted.
#The returned data set will be used to make all the project's graphics
prepareData <- function(file=""){
  
  #If no txt file is specified, we need to download the zip again
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
  #We already have download and unzipped the txt file with the raw data
  #so let's use it!
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