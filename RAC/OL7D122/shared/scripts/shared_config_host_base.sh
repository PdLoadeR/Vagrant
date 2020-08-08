# removing the first line of /etc/hosts which points hostname to 127.0.0.1
sed -i '1d' /etc/hosts

# append the entire file except the first line which is an aut-generated message
tail -n +2 /vagrant/shared/files/hosts_base >> /etc/hosts

# remove Window's CRLF (^M) line ending if present
#sed -i -e $'s/\r$//' /etc/hosts