#author C.P.Konstantinidis
#Variables names
nam<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Power consymprion table from 01-02-2007 to 02-02-2007
cons<-read.csv(file = "household_power_consumption.txt",header = F,sep = ";",as.is = T,na.strings = "?",skip = 66637,nrows = 2880,col.names =nam)
#Auxilliare table of four variables.1st var. Date which is produced by the combination of the var. Date and Time of the original data,2nd through 4th var.
# equals the var. "Sub_metering_1","Sub_metering_1" and "Sub_metering_1" of the original data
aux<- data.frame(Date=strptime(paste(cons$Date,cons$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S",tz = "EET"),Sub1=cons$Sub_metering_1,Sub2=cons$Sub_metering_2,Sub3=cons$Sub_metering_3)
#Memory recycle
rm(cons,nam)
#Plotter
plot(x = aux$Date,y = aux$Sub1,xlab = "",ylab = "Energy sub metering",type = "l")
points(aux$Date,aux$Sub2,col="red",type = "l")
points(aux$Date,aux$Sub3,col="blue",type = "l")
legend(x="topright",xpd = -5,b,pt.cex = 2,cex = 0.6, pch = "-", col = c("black","blue", "red"), legend =c("Sub metering 1","Sub metering 2","Sub metering 3"))
#Memory recycle
rm(aux)
dev.copy(device=png,file="plot3.png",type="cairo-png",height = 480,width = 480,units="px")
dev.off()
