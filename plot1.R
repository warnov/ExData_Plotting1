#This function is intended to generate the first plot suggested in the
#project instructions. It uses the script prepareData.R in order to get
#the dataset to be plotted
plot1 <- function(allHouseHold){
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
  )
  #Generationg the graphic with the suggested texts and colors
  hist(workingData$Global_active_power, col="red", 
       xlab = "Global Active Power (kilowatts)", 
       main="Global Active Power")
  #Flushing the file and closing the device
  dev.off()
  print("PNG File written")  
}