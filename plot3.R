# Getting all data from file in the working derictory

dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

# Cleaning data. Clean data represented in "datt" table

dat$Time <- paste(dat$Date, dat$Time, sep="-")
dat$Time <- strptime(dat$Time, "%d/%m/%Y-%H:%M:%S")
dat$Date <- as.Date(dat$Time)
datt <- dat[which(dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02" ),]
datt$Global_active_power <- as.numeric(paste(datt$Global_active_power))
datt$Sub_metering_1 <- as.numeric(paste(datt$Sub_metering_1))
datt$Sub_metering_2 <- as.numeric(paste(datt$Sub_metering_2))
datt$Sub_metering_3 <- as.numeric(paste(datt$Sub_metering_3))

# Making a plot

png("B:/Александр/Documents/R/plot3.png")
plot(datt$Time, datt$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "", col = "red")
lines(datt$Time, datt$Sub_metering_1)
lines(datt$Time, datt$Sub_metering_2, col="red")
lines(datt$Time, datt$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()