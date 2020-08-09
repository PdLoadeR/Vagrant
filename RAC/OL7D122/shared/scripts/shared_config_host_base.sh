# remove the first line
sed -i "1d" /etc/hosts

# update the /etc/hosts file
tail -n +2 /vagrant/shared/files/hosts_base >> /etc/hosts

# remove carriage return
sed -i 's/\r$//g' /etc/hosts
