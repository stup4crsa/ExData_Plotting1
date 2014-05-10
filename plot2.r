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

png('plot2.png', width = 480, height = 480)

plot(a, dat$Global_active_power, type='l', xlab = '',
	ylab='Global Active Power (kilowatts)')

dev.off()
