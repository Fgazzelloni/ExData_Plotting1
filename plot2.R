# Global Active Power by days of the week


library(tidyverse)
Sys.setlocale("LC_TIME", "English")

start_time <- Sys.time()



unzip("exdata_data_household_power_consumption.zip", list = TRUE)
hpc<-readLines(unzip("exdata_data_household_power_consumption.zip",#19.7 MB
                     "household_power_consumption.txt")) # 126.8 MB

data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-data%>%filter(Date>="2007-02-01" & Date<="2007-02-02")
table(data$Date)

data$Global_active_power<-as.numeric(data$Global_active_power)

with(data,plot(Global_active_power,
               type="l",
               xlab="",
               xaxt = "n",
               ylab="Global Active Power (kilowatts)"))

axis(1, at=c(0, 1500,2880 ), labels=c("Thu","Fri","Sat"), las=1)



dev.copy(png,file="plot2.png")
dev.off()

end_time <- Sys.time()

end_time - start_time #Time difference of 23.126 secs





















