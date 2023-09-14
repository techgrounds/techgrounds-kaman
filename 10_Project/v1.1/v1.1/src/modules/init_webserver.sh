#!bin/bash

# Switch to root user
sudo su - <<'EOF'

# Update package list and upgrade all packages
apt-get update && apt-get upgrade -y

# Install Apache web server
apt-get install -y apache2

# Enable Apache to start at boot time
systemctl enable apache2

# Start Apache web server immediately
systemctl start apache2

EOF