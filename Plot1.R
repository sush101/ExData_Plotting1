# Exploratory Data Analysis:
# Course Project 1:

# Clean the WorkSpace:
rm(list=ls(all=TRUE))

# set the working Directory:
setwd("D:/sushma/ExploratoryDataAnalysis/courseProject1/ExData_Plotting1-master")

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

# Making Plots:
# Plot1:
png("Plot1.png",height=480,width=480)
hist(pwrConsmptn$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
