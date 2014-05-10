# outside program to reduce the size to only the days that we want:
# grep -e ^1/2/2007 -e ^2/2/2007 -e ^Date household_power_consumption.txt >
# smaller

# a = strptime('2/2/2014 00:13:00', '%d/%m/%Y %H:%M:%S')
# converts from string date+time to internal
 
dat = read.csv('smaller', sep=';')
str(dat)

dt = paste(dat$Date, dat$Time)
# gives: "2/2/2007 23:59:00"

dt = strptime(dt, '%d/%m/%Y %H:%M:%S')
# gives internal representation

png('plot4.png', width = 480, height = 480)
par(mfcol = c(2, 2))

# same as plot 2:
plot(a, dat$Global_active_power, type='l', xlab = '',
	ylab='Global Active Power')

# same as plot 3:
plot(a, dat$Sub_metering_1, type = 'n', xlab ='', ylab = "Energy sub metering")
lines(a, dat$Sub_metering_1, col = 'black')
lines(a, dat$Sub_metering_2, col = 'red')
lines(a, dat$Sub_metering_3, col = 'blue')
legend('topright', lty=1, col=c('black','red','blue'),
	legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# new
plot(a, dat$Voltage, type='l', xlab = 'datetime',
	ylab='Voltage')

plot(a, dat$Global_reactive_power, type='l', xlab = 'datetime',
	ylab='Global_reactive_power', yaxs = 'r')

dev.off()

