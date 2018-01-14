## Set working directory and download + unzip data file. This code is not included here. 
## This code assumes that the data file is available in current directory

## build column names vector
ColNames <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## Read the data file
data.file <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = "?",col.names = ColNames)

## Subset the data frame for data between two dates
data.analysis <- data.file[data.file$Date %in% c("1/2/2007","2/2/2007"),]

##build the date and time variable and plot the graph
dateandtime <- strptime(paste(data.analysis$Date,data.analysis$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
dateandtime <- na.omit(dateandtime)
data.analysis$dateandtime <- as.POSIXct(dateandtime)

png(file = "plot3.png",width=480,height=480)
plot(data.analysis$dateandtime,data.analysis$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering",col="black")
points(data.analysis$dateandtime,data.analysis$Sub_metering_2,type="l",col="red")
points(data.analysis$dateandtime,data.analysis$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col = c("black","red","blue"))

dev.off()


