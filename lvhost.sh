#!/bin/bash
 
# Script for creating Virtual Servers On Apache in Linux
 
# Check for the correct parameters
if [ $# -eq 0 ]; then
echo 'Uso: lvhost app-name'
exit 0
fi
 
# Assign Variables
SITE=$1
USUARIO=user
 
# Create the Directory which will contain your Virtual Site
if [ ! -d /var/www/$SITE ]; then
 mkdir /var/www/$SITE
fi
 
# Create the Config file for your virtual site
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/$SITE.l.conf
echo "    ServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$SITE.l.conf
echo "    DocumentRoot /var/www/$SITE" >> /etc/apache2/sites-available/$SITE.l.conf
echo "    ServerName $SITE.l" >> /etc/apache2/sites-available/$SITE.l.conf
echo "    <Directory "/var/www/$SITE">" >> /etc/apache2/sites-available/$SITE.l.conf
echo "        Options Indexes FollowSymLinks" >> /etc/apache2/sites-available/$SITE.l.conf
echo "        AllowOverride All" >> /etc/apache2/sites-available/$SITE.l.conf
echo "        Allow from all" >> /etc/apache2/sites-available/$SITE.l.conf
echo "    </Directory>" >> /etc/apache2/sites-available/$SITE.l.conf
echo "    ErrorLog /var/log/$SITE-error.log" >> /etc/apache2/sites-available/$SITE.l.conf
echo "    CustomLog /var/log/$SITE-access.log combined" >> /etc/apache2/sites-available/$SITE.l.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/$SITE.l.conf
 
# Create the Sym Link to enable your Virtual Site
if [ ! -L /etc/apache2/sites-enabled/$SITE.l.conf ]; then
ln -s /etc/apache2/sites-available/$SITE.l.conf /etc/apache2/sites-enabled/
fi
 
# Include server name (domain name) and any aliases in file hosts
echo "127.0.0.1       $SITE.l" >> /etc/hosts
echo "" >> /etc/hosts
 
# Reload in service the apache2
service apache2 reload
 
# Change the user and group of the folder in apache
chown -Rf $USUARIO:www-data /var/www/$SITE