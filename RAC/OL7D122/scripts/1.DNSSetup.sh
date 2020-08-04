echo "******************************************************************************"
echo "*                                                                            *"
echo "             Start 1.DNSSetup.sh Script." `date`
echo "*                                                                            *"
echo "******************************************************************************"

echo "******************************************************************************"
echo "Prepare yum with the latest repos." `date`
echo "******************************************************************************"
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Stop NetworkManager altering the /etc/resolve.conf contents.
echo "******************************************************************************"
echo "Stop NetworkManager." `date`
echo "******************************************************************************"
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service

echo "******************************************************************************"
echo "Install dnsmasq." `date`
echo "******************************************************************************"
yum install -y dnsmasq
systemctl enable dnsmasq
systemctl restart dnsmasq

echo "******************************************************************************"
echo "*                                                                            *"
echo "             Finish 1.DNSSetup.sh Script." `date`
echo "*                                                                            *"
echo "******************************************************************************"