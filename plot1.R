#This function is intended to generate the first plot suggested in the
#project instructions. It uses the script prepareData.R in order to get
#the dataset to be plotted
plot1 <- function(){
  #This script contains the function prepareData()
  #The source of the script is included in the repository
  #and is well documented. Its main function, is to download
  #read and filter the data to work with
  source('prepareData.R')

  #Let's get the data ready to work with  
  workingData <- prepareData()
  
  #Preparing the device with the specified size
  png(
    filename = 'plot1.png'
    , width = 480
    , height = 480
    , units = 'px'
    , res = NA
    , bg = "transparent"
  )
  #Generating the graphic with the suggested texts and colors
  hist(workingData$Global_active_power, col="red", 
       xlab = "Global Active Power (kilowatts)", 
       main="Global Active Power")
  #Flushing the file and closing the device
  dev.off()
  print("plot1.png written")  
}