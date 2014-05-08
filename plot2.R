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
png(file="plot2.png")
plot(as.numeric(as.character(subconsumption$Global_active_power)), xaxt='n',type="l", xlab="",  ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1441,2880),labels=c("Thu","Fri","Sat")) #using the positions for each day as x
dev.off()

