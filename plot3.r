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

png('plot3.png', width = 480, height = 480)

plot(a, dat$Sub_metering_1, type = 'n', xlab ='', ylab = "Energy sub metering")
lines(a, dat$Sub_metering_1, col = 'black')
lines(a, dat$Sub_metering_2, col = 'red')
lines(a, dat$Sub_metering_3, col = 'blue')
legend('topright', lty=1, col=c('black','red','blue'),
	legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()

# example:
#plot(x,sin(x),type='n')
#lines(x,sin(x),col='red')
#lines(x,cos(x),col='green')
#legend('topright', lty=1, col=c('red','green'), legend=c('sin()', 'cos()'))
