# Energy sub-metering by days of the week



library(tidyverse)
Sys.setlocale("LC_TIME", "English")

start_time <- Sys.time()


unzip("exdata_data_household_power_consumption.zip", list = TRUE)
hpc<-readLines(unzip("exdata_data_household_power_consumption.zip",#19.7 MB
                     "household_power_consumption.txt")) # 126.8 MB

data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-data%>%filter(Date>="2007-02-01" & Date<="2007-02-02")

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


dev.copy(png,file="plot3.png")
dev.off()

end_time <- Sys.time()
end_time - start_time #Time difference of 20.97 secs






