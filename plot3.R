#This function is intended to generate the third plot suggested in the
#project instructions. It uses the script prepareData.R in order to get
#the dataset to be plotted
plot3 <- function(allHouseHold){
  source('prepareData.R')
  
  #Let's get the data ready to work with
  workingData <- prepareData()
  
  #Preparing the device with the specified size
    png(
      filename = 'plot3.png'
      , width = 480
      , height = 480
      , units = 'px'
      , res = NA
      , bg = "transparent"
    )
  #Generationg the graphic with the suggested texts and colors
  plot(y = wd$Sub_metering_1, 
       x=wd$Date, 
       type = "l", 
       xlab = "", 
       ylab="Energy sub metering")
  lines(y = wd$Sub_metering_2, x=wd$Date, col="red")
  lines(y = wd$Sub_metering_3, x=wd$Date, col="blue")
  legend("topright", 
         pch="_", 
         col=c("black", 
               "red", 
               "blue"), 
         legend=c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))
  #Flushing the file and closing the device
  dev.off()
  print("plot3.png written")  
}