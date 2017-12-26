# gs-afterhours
Freepbx tool for switching on grandstream screen savers after hours


usage:

crontab -u asterisk -e
0 6 * * * cd /opt/ && ./gs-afterhours.sh off
0 18 * * * cd /opt/ && ./gs-afterhours.sh on
