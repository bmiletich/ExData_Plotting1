plot1<-function(){
  
  #Please run this in the directory with the "household_power_consumption.txt" file.
  
  allData<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
  
  #convert to proper data types per column
  allData$Global_active_power<-as.numeric(as.character(allData$Global_active_power))
  allData$Date<-as.Date(allData$Date,format="%d/%m/%Y")
  
  #find indices with dates of 2007-02-01 and 2007-02-02, and extract it out
  
  date01<-which(allData$Date=="2007-02-01")
  date02<-which(allData$Date=="2007-02-02")
  
  targetData<-allData[append(date01,date02),]
  
  #run and save histogram
  png(file="plot1.png")
  histPlot1<-hist(targetData$Global_active_power,col=c(2),main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
  
  
}