#author C.P.Konstantinidis
#Variables names
nam<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Power consymprion table from 01-02-2007 to 02-02-2007
cons<-read.csv(file = "household_power_consumption.txt",header = F,sep = ";",as.is = T,na.strings = "?",skip = 66637,nrows = 2880,col.names =nam)
#Histogram and png creation
hist(x = cons$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (killowatts)",col = "red")
#dev.copy(png,file="plot1.png")
dev.copy(device=png,file="plot1.png",type="cairo-png",height = 480,width = 480,units="px")
dev.off()
#Memeory recycle
rm(nam,cons)