# append the entire file except the first line which is an aut-generated message
tail -n +2 /vagrant/shared/files/hosts_scan >> /etc/hosts

# remove Window's CRLF (^M) line ending if present
#sed -i -e $'s/\r$//' /etc/hosts