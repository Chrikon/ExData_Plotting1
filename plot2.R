#author C.P.Konstantinidis
#Variables names
nam<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Power consymprion table from 01-02-2007 to 02-02-2007
cons<-read.csv(file = "household_power_consumption.txt",header = F,sep = ";",as.is = T,na.strings = "?",skip = 66637,nrows = 2880,col.names =nam)
#Auxilliare table of two variables.1st var. Date which is produced by the combination of the var. Date and Time of the original data,2nd var.
#Power which equals the var. "Global_active_power" of the original data
aux<- data.frame(Date=strptime(paste(cons$Date,cons$Time,sep=" "),format = "%d/%m/%Y %H:%M:%S",tz = "EET"),Power=cons$Global_active_power)
#Memory recycle
rm(nam,cons)
#Plotter
plot(x = aux$Date,y = aux$Power,xlab = "",ylab = "Global Active Power (killowatts)",type = "l")
rm(aux)
#dev.copy(png,file="plot2.png")
dev.copy(device=png,file="plot2.png",type="cairo-png",height = 480,width = 480,units="px")
dev.off()
