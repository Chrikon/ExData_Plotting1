nam<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
cons<-read.csv(file = "household_power_consumption.txt",header = F,sep = ";",as.is = T,na.strings = "?",skip = 66637,nrows = 2880,col.names =nam)
aux<- data.frame(Date=strptime(paste(cons$Date,cons$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S",tz = "EET"),APower=cons$Global_active_power,RPower=cons$Global_reactive_power,Voltage=cons$Voltage,Sub1=cons$Sub_metering_1,Sub2=cons$Sub_metering_2,Sub3=cons$Sub_metering_3)
rm(nam,cons)
par(mfrow=c(2,2),mai=c(0.5,0.5,0.5,0.5))
##Plot 1
plot(x = aux$Date,y = aux$APower,xlab = "",ylab = "Global Active Power",type = "l")
##Plot 2
plot(x = aux$Date,aux$Voltage,xlab="datetime",ylab="Volatge",type="l")
##Plot 3
plot(x = aux$Date,y = aux$Sub1,xlab = "",ylab = "Energy sub metering",type = "l")
points(aux$Date,aux$Sub2,col="red",type = "l")
points(aux$Date,aux$Sub3,col="blue",type = "l")
legend(x="topright",xpd = -5,b,pt.cex = 2,cex = 0.6, pch = "-", col = c("black","blue", "red"), legend =c("Sub metering 1","Sub metering 2","Sub metering 3"))
##Plot 4
plot(x = aux$Date,y = aux$RPower,xlab = "datetime",ylab = "Global reactive power",type = "l")
rm(aux)
dev.copy(device=png,file="plot4.png",type="cairo-png",height = 480,width = 480,units="px")
dev.off()
