#!/bin/bash

# bash <( curl -s http://telily.com/downloads/gs-afterhours/install.sh )

wget http://telily.com/downloads/gs-afterhours/gs-afterhours.txt -O /opt/gs-afterhours.sh
wget http://telily.com/downloads/gs-afterhours/gs-cfg2bin.txt -O /opt/gs-cfg2bin.pl

echo "SHELL=/bin/bash" > /etc/cron.d/gs-afterhours-on
echo "HOME=/opt" >> /etc/cron.d/gs-afterhours-on
echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/cron.d/gs-afterhours-on
echo "45 19 * * * root ./gs-afterhours.sh on && ./gs-afterhours.sh reboot" >> /etc/cron.d/gs-afterhours-on

echo "SHELL=/bin/bash" > /etc/cron.d/gs-afterhours-off
echo "HOME=/opt" >> /etc/cron.d/gs-afterhours-off
echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/cron.d/gs-afterhours-off
echo "30 6 * * * root ./gs-afterhours.sh off && ./gs-afterhours.sh reboot" >> /etc/cron.d/gs-afterhours-off

echo "SHELL=/bin/bash" > /etc/cron.d/gs-afterhours-reboot
echo "HOME=/opt" >> /etc/cron.d/gs-afterhours-reboot
echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /etc/cron.d/gs-afterhours-reboot
echo "45 6 * * * root ./gs-afterhours.sh reboot" >> /etc/cron.d/gs-afterhours-reboot

chmod 0644 /etc/cron.d/gs-afterhours-off
chmod 0644 /etc/cron.d/gs-afterhours-on
chmod 0644 /etc/cron.d/gs-afterhours-reboot

chmod 0644 /opt/gs-afterhours.sh
chmod +x /opt/gs-afterhours.sh
chmod 0644 /opt/gs-cfg2bin.pl
chmod +x /opt/gs-cfg2bin.pl
