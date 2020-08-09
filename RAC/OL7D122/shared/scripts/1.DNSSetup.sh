. /vagrant/config/install.env

echo "+----------------------------------------------------------------------------+"
echo "|                                                                            |"
echo "|                Start - 1.DNSSetup.sh Script.                               |"
echo "|                  Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                                 |"
echo "|                                                                            |"
echo "+----------------------------------------------------------------------------+"

echo " +-----------------------------------------------------------+"
echo " |  Step 1. Add google DNS to resolv.conf                    |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Stop NetworkManager altering the /etc/resolve.conf contents.
echo " +-----------------------------------------------------------+"
echo " |  Step 2. Stop NetworkManager                              |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sed -i -e "s|\[main\]|\[main\]\ndns=none|g" /etc/NetworkManager/NetworkManager.conf
systemctl restart NetworkManager.service

echo " +-----------------------------------------------------------+"
echo " |  Step 3. Install and configure dnsmasq                    |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
yum install -y dnsmasq
systemctl enable dnsmasq
systemctl restart dnsmasq

echo " +-----------------------------------------------------------+"
echo " |  Step 4. Reset root password                              |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
echo -e "${root_pass}\n${root_pass}" | passwd

echo " +-----------------------------------------------------------+"
echo " |  Step 5. Update /etc/hosts and add all nodes' info        |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_host_base.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 6. Update /etc/hosts and add SCAN ports info        |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_host_scan.sh


echo "+----------------------------------------------------------------------------+"
echo "|                                                                            |"
echo "|                Finish - 1.DNSSetup.sh Script.                              |"
echo "|                  Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                                 |"
echo "|                                                                            |"
echo "+----------------------------------------------------------------------------+"

