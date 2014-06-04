plot2 <- function(){
  # set working directory
  setwd('D:/Archiv/Vladimir/projekt/course/coursera/Exploratory_Data_Analysis/Project')
  
  # read the whole data
  hpc_all_data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
  
  # get data from the dates 2007-02-01 and 2007-02-02
  hpc <- subset(hpc_all_data, as.character(Date) == "1/2/2007" | as.character(Date) == "2/2/2007" )
  
  # concat columns Date and Time
  DT <- with(hpc, paste(Date, Time, sep=","))
  DT <- strptime(DT, "%d/%m/%Y,%H:%M:%S")
  hpc$DT <- DT
  
  # prepare the graphical device
  png(filename ="plot2.png", width = 480, height = 480)
  
  # plot the histogram
  with(hpc, plot(DT, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))
  
  # explicitly close graphics device with dev.off()
  dev.off()
}