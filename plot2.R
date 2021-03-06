#This function is intended to generate the second plot suggested in the
#project instructions. It uses the script prepareData.R in order to get
#the dataset to be plotted
plot2 <- function(){
  #This script contains the function prepareData()
  #The source of the script is included in the repository
  #and is well documented. Its main function, is to download
  #read and filter the data to work with  
  source('prepareData.R')

  #Let's get the data ready to work with
  workingData <- prepareData()
  
  #Preparing the device with the specified size
  png(
    filename = 'plot2.png'
    , width = 480
    , height = 480
    , units = 'px'
    , res = NA
    , bg = "transparent"
  )
  #Generating the graphic with the suggested texts and colors
  plot(y = workingData$Global_active_power, 
       x=workingData$Date, 
       type = "l", 
       xlab = "", 
       ylab="Global Active Power (kilowatts)")
  #Flushing the file and closing the device
  dev.off()
  print("plot2.png written")  
}