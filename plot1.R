# Getting all data from file in the working derictory

dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

# Cleaning data. Clean data represented in "datt" table

dat$Time <- paste(dat$Date, dat$Time, sep="-")
dat$Time <- strptime(dat$Time, "%d/%m/%Y-%H:%M:%S")
dat$Date <- as.Date(dat$Time)
datt <- dat[which(dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02" ),]
datt$Global_active_power <- as.numeric(paste(datt$Global_active_power))

# Making a plot

png("B:/Александр/Documents/R/plot1.png")
with(datt, hist(Global_active_power, col = "red", main = "Clobal Active Power", xlab = "Clobal Active Power (kilowatts)"))
dev.off()