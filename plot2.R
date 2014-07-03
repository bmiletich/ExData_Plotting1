plot2<-function(){
  #Please run this in the directory with the "household_power_consumption.txt" file.
  
  allData<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE)
  
  #convert to proper data types per column
  allData$Global_active_power<-as.numeric(as.character(allData$Global_active_power))
  allData$Date<-as.Date(allData$Date,format="%d/%m/%Y")
  
  #find indices with dates of 2007-02-01 and 2007-02-02, and extract it out
  
  date01<-which(allData$Date=="2007-02-01")
  date02<-which(allData$Date=="2007-02-02")
  
  targetData<-allData[append(date01,date02),]
  
  #create the dateTime data format
  targetData$dateTime<-strptime(paste(targetData$Date,targetData$Time),format="%Y-%m-%d %H:%M:%S")
  
  png(file="plot2.png")
  plot2<-plot(x=targetData$dateTime,y=targetData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
}