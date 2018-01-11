#!/bin/bash

# bash <( curl -s http://telily.com/downloads/gs-afterhours/install.sh )

wget http://telily.com/downloads/gs-afterhours/gs-afterhours.txt -O /opt/gs-afterhours.sh
wget http://telily.com/downloads/gs-afterhours/gs-cfg2bin.txt -O /opt/gs-cfg2bin.pl

echo "0 20 * * * root cd /opt/ && ./gs-afterhours.sh on && ./gs-afterhours.sh reboot" > /etc/cron.d/gs-afterhours-on
echo "45 6 * * * root cd /opt/ && ./gs-afterhours.sh off && ./gs-afterhours.sh reboot" > /etc/cron.d/gs-afterhours-off
echo "0 7 * * * root cd /opt/ && ./gs-afterhours.sh reboot" > /etc/cron.d/gs-afterhours-reboot

chmod 0644 /etc/cron.d/gs-afterhours-off
chmod 0644 /etc/cron.d/gs-afterhours-on
chmod 0644 /etc/cron.d/gs-afterhours-reboot

chmod 0644 /opt/gs-afterhours.sh
chmod +x /opt/gs-afterhours.sh
chmod 0644 /opt/gs-cfg2bin.pl
chmod +x /opt/gs-cfg2bin.pl
