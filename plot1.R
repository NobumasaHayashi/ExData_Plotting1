##Read the data 
hpc<-read.table("household_power_consumption.txt", sep=";", header = TRUE)

##convert the format of "Date" from the character to the Date 
hpc$Time<-strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")
hpc$Date<-strptime(hpc$Date, format = "%d/%m/%Y")

##Extract the data of "2007-02-01" and "2007-02-01" 
df_hpc<-hpc[(hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02"),]

#remove the original data set
rm(hpc)

df_hpc$Global_active_power<-as.numeric(df_hpc$Global_active_power)

##make a histogram 
png(filename = "Plot1.png", width = 480, height = 480)
hist(df_hpc$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

#close the graphic device
##sampleadd
dev.off()
