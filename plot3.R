##Read the data 
hpc<-read.table("household_power_consumption.txt", sep=";", header = TRUE)

##convert the format of "Date" from the character to the Date 
hpc$Time<-strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")
hpc$Date<-strptime(hpc$Date, format = "%d/%m/%Y")

##Extract the data of "2007-02-01" and "2007-02-01" 
df_hpc<-hpc[(hpc$Date=="2007-02-01"|hpc$Date=="2007-02-02"),]

#remove the original data set
rm(hpc)

#convert the data from character to numeric
df_hpc$Sub_metering_1<-as.numeric(df_hpc$Sub_metering_1)
df_hpc$Sub_metering_2<-as.numeric(df_hpc$Sub_metering_2)
df_hpc$Sub_metering_3<-as.numeric(df_hpc$Sub_metering_3)


png(filename = "Plot3.png", width = 480, height = 480)
par(mar=c(3,4,4,2))
with(df_hpc, plot(Time, Sub_metering_1, type="n",
                  ylab = "Energy sub metering"))
lines(df_hpc$Time, df_hpc$Sub_metering_1,col = "black")
lines(df_hpc$Time, df_hpc$Sub_metering_2,col = "red")
lines(df_hpc$Time, df_hpc$Sub_metering_3,col = "blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col = c("black", "red", "blue"))

#close the graphic device
dev.off()