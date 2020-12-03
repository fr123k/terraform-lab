#!/bin/sh
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo groupadd www
sudo usermod -a -G www ubuntu
sudo usermod -a -G www www-data
sudo chown -R www-data:www /var/www
sudo chmod 770 -R /var/www 
