#!/bin/sh
 
# Read site-name from user
echo "Enter name of your new site (ex. example.com)"
echo "Note: Run this script on Drupal sites folder"
read site_name
 
# Change your database username, password and host as required.
# new database will be created, if exists already than truncated first.
drush site-install standard --account-name=sysop --account-pass=sNmhu78 --db-url=mysql://root:sNmhu78@localhost/$site_name --site-name="$site_name" --sites-subdir="$site_name"
 
#Create site
sudo cp /etc/nginx/sites-available/drupal7 /etc/nginx/sites-available/$site_name
 
#Replace example.com with live site name
sudo sed -i -e "s/example.com/$site_name/" /etc/nginx/sites-available/$site_name
#Enable site
sudo ln -s /etc/nginx/sites-available/$site_name /etc/nginx/sites-enabled/
 
#Reload nginx
sudo service nginx reload
 
#create a host entry for local sites only
#Remove when using on live server.
sudo sh -c "echo "127.0.0.1     $site_name" >>/etc/hosts"
