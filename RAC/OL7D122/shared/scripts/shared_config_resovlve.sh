# append the entire file except the first line which is an aut-generated message
tail -n +2 /vagrant/shared/files/resolv >> /etc/resolv.conf

# remove Window's CRLF (^M) line ending if present
#sed -i -e $'s/\r$//' /etc/resolv.conf

# Stop NetworkManager altering the /etc/resolve.conf contents.
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service