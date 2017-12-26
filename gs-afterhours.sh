#!/bin/bash

if [ "$1" = "on" ]
then
	#Grandstream MAC OUI: 000B82
	find /tftpboot/ -iname 000B82*.cfg |
	while read filename
	do
		# Screensaver on
		#P2918 = 1
		sed -i '/^P2918/c\P2918 = 1' $filename
		# Screensaver Timeout. Minutes. Number: 3 - 60 
		#P2919 = 3
		sed -i '/^P2919/c\P2919 = 3' $filename
		# LCD Display Backlight Brightness. Active.
		#P334 = 90
		sed -i '/^P334/c\P334 = 90' $filename
		#  LCD Display Backlight Brightness. Idle.
		#P335 = 50
		sed -i '/^P335/c\P335 = 50' $filename
		#Active Backlight Timeout
		#P8356=5
		sed -i '/^P8356/c\P8356 = 5' $filename
		MAC=$(echo $filename | sed -e 's/.cfg//g' -e 's/\/tftpboot\///g')
		./gs-cfg2bin.pl ${MAC} $filename /tftpboot/cfg${MAC}
	done
	exit 0
fi

if [ "$1" = "off" ]
then
	#Grandstream MAC OUI: 000B82
	find /tftpboot/ -iname 000B82*.cfg |
	while read filename
	do
		# Screensaver off
		#P2918 = 0
		sed -i '/^P2918/c\P2918 = 0' $filename
		# LCD Display Backlight Brightness. Active.
		#P334 = 100
		sed -i '/^P334/c\P334 = 100' $filename
		#  LCD Display Backlight Brightness. Idle.
		#P335 = 100
		sed -i '/^P335/c\P335 = 100' $filename
		MAC=$(echo $filename | sed -e 's/.cfg//g' -e 's/\/tftpboot\///g')
		./gs-cfg2bin.pl ${MAC} $filename /tftpboot/cfg${MAC}
	done
	exit 0
fi

echo "usage: gs-afterhours [off] [on]"

exit 0
