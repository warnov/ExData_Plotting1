#This function is intended to generate the second plot suggested in the
#project instructions. It uses the script prepareData.R in order to get
#the dataset to be plotted
plot2 <- function(allHouseHold){
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
  #Generationg the graphic with the suggested texts and colors
  plot(y = wd$Global_active_power, 
       x=wd$Date, 
       type = "l", 
       xlab = "", 
       ylab="Global Active Power (kilowatts)")
  #Flushing the file and closing the device
  dev.off()
  print("plot2.png written")  
}