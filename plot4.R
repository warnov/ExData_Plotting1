#This function is intended to generate the fourth plot suggested in the
#project instructions. It uses the script prepareData.R in order to get
#the dataset to be plotted
plot4 <- function(){
  source('prepareData.R')

  #Let's get the data ready to work with
  workingData <- prepareData()
  
  #Preparing the device with the specified size
  png(
    filename = 'plot4.png'
    , width = 480
    , height = 480
    , units = 'px'
    , res = NA
    , bg = "transparent"
  )
  
  #Preparing the canvas to draw 4 graphics  
  par(mfrow=c(2,2))
  
  #Generating the upper left graphic
  plot(y = workingData$Global_active_power, 
       x=workingData$Date, 
       type = "l", 
       xlab = "", 
       ylab="Global Active Power")
  
  #Generating the upper right graphic
  plot(y = workingData$Voltage, 
       x=workingData$Date, 
       type = "l", 
       xlab = "datetime", 
       ylab = "Voltage")

  #Generating the lower left graphic
  plot(y = workingData$Sub_metering_1, 
       x=workingData$Date, 
       type = "l", 
       xlab = "",        
       ylab="Energy sub metering")
  lines(y = workingData$Sub_metering_2,
        x=workingData$Date, col="red")
  lines(y = workingData$Sub_metering_3, 
        x=workingData$Date, col="blue")
  legend("topright", 
         lty=1,
         bty = "n",
         col=c("black", 
               "red", 
               "blue"), 
         legend=c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))
  
  #Generating the lower right graphic
  plot(y = workingData$Global_reactive_power, 
     x=workingData$Date, 
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")
    
  #Flushing the file and closing the device
  dev.off()
  print("plot4.png written.")  
}