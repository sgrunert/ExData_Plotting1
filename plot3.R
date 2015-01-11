###################################################
#Author: S. Grunert
#Create: 10January2015
#Description:
#The following is for Coursera Course: exdata-010: Project 1
###Plot 3
###################################################

##Upload full data set.
fullTable<-read.table("household_power_consumption.txt",header = TRUE,sep = ";", stringsAsFactors = FALSE)

##Reduce to working data set.
workTable <- fullTable[(fullTable$Date =="1/2/2007"|fullTable$Date =="2/2/2007"),]
rm(fullTable)

##Modify date and time into date/timeclass on working data set
workTable$DateandTime <- paste(workTable$Date,workTable$Time)
workTable$DateTime <- strptime(workTable$DateandTime,"%d/%m/%Y %H:%M:%S")

##Make plot png file

plot(workTable$DateTime,as.numeric(workTable$Sub_metering_1)
     , type = "n"
     , ylab = "Energy sub metering"
     , xlab = " ")
points(workTable$DateTime,as.numeric(workTable$Sub_metering_1)
     , type = "l")
points(workTable$DateTime,as.numeric(workTable$Sub_metering_2)
        , type = "l"
        , col="red")
points(workTable$DateTime,as.numeric(workTable$Sub_metering_3)
       , type = "l"
       , col="blue")
legend("topright",lwd = "1",col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,cex = .5, text.width = strwidth("10,000,000"))
dev.copy(png, width = 480, height = 480, file = "plot3.png")
dev.off(which = 4)


