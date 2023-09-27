#!bin/bash

# Install and start Apache webserver
sudo apt update
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

# Get system details
apache_status=$(sudo systemctl status apache2)
hostname=$(hostname)
kernel_version=$(uname -r)
ip_address=$(hostname -I)
cpu_info=$(lscpu)
memory_info=$(free -h)

# Overwrite index.html with system details
cat <<EOF > /var/www/html/index.html
<html>
<body>
<pre>
<h1>IT WORKS!</h1>
<strong>Apache Status:</strong>
$apache_status
</pre>
<hr />
<pre>
<strong>Hostname:</strong> $hostname
</pre>
<hr />
<pre>
<strong>Kernel Version:</strong> $kernel_version
</pre>
<hr />
<pre>
<strong>IP Address:</strong> $ip_address
</pre>
<hr />
<pre>
<strong>CPU Info:</strong>
$cpu_info
</pre>
<hr />
<pre>
<strong>Memory Info:</strong>
$memory_info
</pre>
</body>
</html>
EOF
