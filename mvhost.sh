#!/bin/bash
 
# Script for creating Virtual Servers On Apache in Mac OS
 
# Check for the correct parameters
if [ $# -eq 0 ]; then
echo 'Uso: vhost app-name'
exit 0
fi
 
# Assign Variables
SITE=$1
USUARIO=user
 
# Create the Directory which will contain your Virtual Site
if [ ! -d ~/Sites/$SITE ]; then
 mkdir ~/Sites/$SITE
fi

# Create the Config file for your virtual site
echo "<VirtualHost *:80>" > /private/etc/apache2/other/$SITE.l.conf
echo "    ServerAdmin webmaster@localhost" >> /private/etc/apache2/other/$SITE.l.conf
echo "    DocumentRoot /Users/$USUARIO/Sites/$SITE" >> /private/etc/apache2/other/$SITE.l.conf
echo "    ServerName $SITE.l" >> /private/etc/apache2/other/$SITE.l.conf
echo "    <Directory "/Users/$USUARIO/Sites/$SITE">" >> /private/etc/apache2/other/$SITE.l.conf
echo "        Options Indexes FollowSymLinks" >> /private/etc/apache2/other/$SITE.l.conf
echo "        AllowOverride All" >> /private/etc/apache2/other/$SITE.l.conf
echo "        Allow from all" >> /private/etc/apache2/other/$SITE.l.conf
echo "    </Directory>" >> /private/etc/apache2/other/$SITE.l.conf
echo "    ErrorLog /var/log/$SITE-error.log" >> /private/etc/apache2/other/$SITE.l.conf
echo "    CustomLog /var/log/$SITE-access.log combined" >> /private/etc/apache2/other/$SITE.l.conf
echo "</VirtualHost>" >> /private/etc/apache2/other/$SITE.l.conf
 
# Include server name (domain name) and any aliases in file hosts
echo "127.0.0.1       $SITE.l" >> /etc/hosts
echo "" >> /etc/hosts
 
# Reload in service the apache2
sudo apachectl restart
 
# Change the user and group of the folder in apache
sudo chown -Rf $USUARIO:_www ~/Sites/$SITE