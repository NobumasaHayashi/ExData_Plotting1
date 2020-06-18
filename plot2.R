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
df_hpc$Global_active_power<-as.numeric(df_hpc$Global_active_power)

par(mar=c(3,4,4,2))
with(df_hpc, plot(Time, Global_active_power, type="l",
                  ylab = "Global Active Power (killowatts)"))

##Copy the graph in the graphic device onto png file
dev.copy(png, file = "Plot2.png")

#close the graphic device
dev.off()