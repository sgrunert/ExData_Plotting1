###################################################
#Author: S. Grunert
#Create: 10January2015
#Description:
#The following is for Coursera Course: exdata-010: Project 1
###Plot 2
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
with(workTable,plot(workTable$DateTime,as.numeric(Global_active_power)
                    , type = "l"
                    , ylab = "Global Active Power (kilowatts)"
                    , xlab = " "))
dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off(which = 4)

