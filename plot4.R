# Global Active Power, Voltage, Energy sub-metering and Global reactive power



library(tidyverse)
Sys.setlocale("LC_TIME", "English")

start_time <- Sys.time()


unzip("exdata_data_household_power_consumption.zip", list = TRUE)
hpc<-readLines(unzip("exdata_data_household_power_consumption.zip",#19.7 MB
                     "household_power_consumption.txt")) # 126.8 MB

data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-data%>%filter(Date>="2007-02-01" & Date<="2007-02-02")


par(mfrow=c(2,2))

#plot1
data$Global_active_power<-as.numeric(data$Global_active_power)

with(data,plot(Global_active_power,
               type="l",
               xlab="",
               xaxt = "n",
               ylab="Global Active Power (kilowatts)"))

axis(1, at=c(0, 1500,2880 ), labels=c("Thu","Fri","Sat"), las=1)


head(data)
#plot2
with(data,plot(Voltage,
               type="l",
               xlab="datetime",
               xaxt = "n",
               ylab="Voltage"))

axis(1, at=c(0, 1500,2880 ), labels=c("Thu","Fri","Sat"), las=1)


#plot3
with(data,plot(Sub_metering_1,
     type="l",
     xlab="",
     xaxt = "n",
     ylab="Energy sub metering"))
lines(data$Sub_metering_2,type="l",col="red")
lines(data$Sub_metering_3,type="l",col="blue")

axis(1, at=c(0, 1500,2880 ), labels=c("Thu","Fri","Sat"), las=1)
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=1,cex=1,
       col=c("black","red","blue"))

#plot4
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)

with(data,plot(Global_reactive_power,
               type="h",
               lwd=0.001,
               xlab="datetime",
               xaxt = "n",
               ylab="Global_reactive_power"))

axis(1, at=c(0, 1500,2880 ), labels=c("Thu","Fri","Sat"), las=1)

par(mfrow=c(1,1))


dev.copy(png,file="plot4.png")
dev.off()

end_time <- Sys.time()
end_time - start_time #Time difference of 25.182 secs
