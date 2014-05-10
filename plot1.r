# outside program to reduce the size to only the days that we want:
# grep -e ^1/2/2007 -e ^2/2/2007 -e ^Date household_power_consumption.txt >
# smaller
 
dat = read.csv('smaller', sep=';')
str(dat)

png('plot1.png', width = 480, height = 480)

hist(dat$Global_active_power, main='Global Active Power',
	xlab='Global Active Power (kilowatts)', col = 'red')

dev.off()

