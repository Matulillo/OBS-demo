#!/bin/bash

# Update the package repository
sudo yum update -y

# Install Nginx
sudo amazon-linux-extras install nginx1 -y

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Print the status of Nginx
sudo systemctl status nginx

echo "<h1>Hello Ngnix deployed from Terraform!</h1>"  > /usr/share/nginx/html/index.html

