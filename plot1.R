# Plot 1 - Global Active Power



library(tidyverse)

start_time <- Sys.time()

unzip("exdata_data_household_power_consumption.zip", list = TRUE)
hpc<-readLines(unzip("exdata_data_household_power_consumption.zip",#19.7 MB
                     "household_power_consumption.txt")) # 126.8 MB
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data<-data%>%filter(Date>="2007-02-01" & Date<="2007-02-02")
data$Global_active_power<-as.numeric(data$Global_active_power)
with(data,hist(Global_active_power,col="red",
               main="Global Active Power",
               xlab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot1.png")
dev.off()

end_time <- Sys.time()

end_time - start_time

# Time difference of 39.749 secs





























