#Download the data from assignment url and decompress it in your working directory
#Read de data
household_power_consumption <- read.csv("~/household_power_consumption.txt", sep=";")
#Data atributes
class(household_power_consumption)  #data frame
class(household_power_consumption$Time) #factor
class(household_power_consumption$Date) #factor
#convert factor variables to data and time variables
household_power_consumption$DateTime<-paste(household_power_consumption$Date,household_power_consumption$Time)
strptime(household_power_consumption$DateTime, "%d/%m/%Y %H:%M:%S")
household_power_consumption$Date2<-as.Date(as.character(household_power_consumption$Date), "%d/%m/%Y")
class(household_power_consumption$Date2)
head(household_power_consumption$Date2)
#subset data
subconsumption<-subset(household_power_consumption,household_power_consumption$Date2==as.Date("2007-02-01") | household_power_consumption$Date2==as.Date("2007-02-02"))
dim(subconsumption)
subconsumption$week<-weekdays(as.Date(subconsumption$Date2))
subconsumption$week #to see what position is each day
class(subconsumption$Global_active_power) #to check the class of active power
as.numeric(as.character(subconsumption$Global_active_power)) #convert to a numeric value
png(file="plot4.png")
par(mfrow=c(2,2))
plot(as.numeric(as.character(subconsumption$Global_active_power)), xaxt='n',type="l", xlab="",  ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441,2880),labels=c("Thu","Fri","Sat")) #using the positions for each day as x
plot(as.numeric(as.character(subconsumption$Voltage)), xaxt='n',type="l", xlab="datetime",  ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441,2880),labels=c("Thu","Fri","Sat")) #using the positions for each day as x
plot(as.numeric(as.character(subconsumption$Sub_metering_1)), xaxt='n',type="l", xlab="",  ylab="Energy sub metering")
axis(1, at=c(1,1441,2880),labels=c("Thu","Fri","Sat")) #using the positions for each day as x
lines(as.numeric(as.character(subconsumption$Sub_metering_2)),col="red")
lines(as.numeric(as.character(subconsumption$Sub_metering_3)),col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2", "sub_metering_3"), cex=0.8)
plot(as.numeric(as.character(subconsumption$Global_reactive_power)), xaxt='n',type="l", xlab="datetime",  ylab="Global_Reative_Power")
axis(1, at=c(1,1441,2880),labels=c("Thu","Fri","Sat")) #using the positions for each day as x
dev.off()