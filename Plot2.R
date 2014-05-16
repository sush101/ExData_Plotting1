# Exploratory Data Analysis:
# Course Project 1:

# Clean the WorkSpace:
rm(list=ls(all=TRUE))

# set the working Directory:
setwd("D:/ExploratoryDataAnalysis/courseProject1/ExData_Plotting1-master")

# Read the text file in R:
pwrCon<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=F)
pwrCon$Date<-as.Date(pwrCon$Date,"%d/%m/%Y")
summary(pwrCon)
dim(pwrCon)

# sub-setting only 1st feb 2007 and 2nd Feb 2007 data:
pwrConsmptn<-pwrCon[which(pwrCon$Date == '2007-02-01' | pwrCon$Date == '2007-02-02'),]
summary(pwrCon)
dim(pwrConsmptn)

pwrConsmptn$DateTime<-paste(pwrConsmptn$Date,pwrConsmptn$Time,sep=" ")
pwrConsmptn$DateTime<-strptime(pwrConsmptn$DateTime,"%Y-%m-%d %H:%M:%S")
head(pwrConsmptn,n=3)

# Exploratory Analysis:
sum(is.na(pwrConsmptn))
dim(pwrConsmptn)
summary(pwrConsmptn)
str(pwrConsmptn)

pwrConsmptn$Global_active_power<-as.numeric(pwrConsmptn$Global_active_power)
pwrConsmptn$Global_reactive_power<-as.numeric(pwrConsmptn$Global_reactive_power)
pwrConsmptn$Voltage<-as.numeric(pwrConsmptn$Voltage)
pwrConsmptn$Sub_metering_1<-as.numeric(pwrConsmptn$Sub_metering_1)
pwrConsmptn$Sub_metering_2<-as.numeric(pwrConsmptn$Sub_metering_2)
pwrConsmptn$Time<-strptime(pwrConsmptn$Time,"%H:%M:%S")

head(pwrConsmptn,n=3)
rm(pwrCon)

# Plot2:
png("Plot2.png",width=480,height=480)
plot(pwrConsmptn$DateTime,pwrConsmptn$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (Kilowatts)")
dev.off()

