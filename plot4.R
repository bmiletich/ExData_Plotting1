plot4<-function(){
  #Please run this in the directory with the "household_power_consumption.txt" file.
  
  allData<-read.table(file="household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
  
  #convert to proper data types per column
  allData$Global_reactive_power<-as.numeric(as.character(allData$Global_reactive_power))
  allData$Sub_metering_1<-as.numeric(as.character(allData$Sub_metering_1))
  allData$Sub_metering_2<-as.numeric(as.character(allData$Sub_metering_2))
  allData$Sub_metering_3<-as.numeric(as.character(allData$Sub_metering_3))
  allData$Global_active_power<-as.numeric(as.character(allData$Global_active_power))
  allData$Voltage<-as.numeric(as.character(allData$Voltage))
  
  allData$Date<-as.Date(allData$Date,format="%d/%m/%Y")
  
  #find indices with dates of 2007-02-01 and 2007-02-02, and extract it out
  
  date01<-which(allData$Date=="2007-02-01")
  date02<-which(allData$Date=="2007-02-02")
  
  
  
  targetData<-allData[append(date01,date02),]
  
  #free up memory
  rm(allData)
  
  #create the dateTime data format
  targetData$dateTime<-strptime(paste(targetData$Date,targetData$Time),format="%Y-%m-%d %H:%M:%S")


  
  #plot graphs and save as file and alter windows to  2 by 2
  png(file="plot4.png")
  
  par(mfrow=c(2,2))
  
  plot(x=targetData$dateTime,y=targetData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(x=targetData$dateTime,y=targetData$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  plot(x=targetData$dateTime,y=targetData$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
  lines(x=targetData$dateTime,y=targetData$Sub_metering_2,col="red")
  lines(x=targetData$dateTime,y=targetData$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3"))
  
  plot(x=targetData$dateTime,y=targetData$Global_reactive_power,type="l",col="black",xlab="dateTime",ylab="Global_Reactive_Power")
  dev.off()
}