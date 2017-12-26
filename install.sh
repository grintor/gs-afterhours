wget http://telily.com/downloads/gs-afterhours/gs-afterhours.sh -O /opt/gs-afterhours.sh
wget http://telily.com/downloads/gs-afterhours/gs-cfg2bin.pl -O /opt/gs-cfg2bin.pl

echo "0 20 * * * cd /opt/ && ./gs-afterhours.sh on" > /etc/cron.d/gs-afterhours-on
echo "0 6 * * * cd /opt/ && ./gs-afterhours.sh off" > /etc/cron.d/gs-afterhours-off

chmod 0644 /etc/cron.d/gs-afterhours-off
chmod 0644 /etc/cron.d/gs-afterhours-on
chmod 0644 /opt/gs-afterhours.sh
chmod 0644 /opt/gs-cfg2bin.pl
