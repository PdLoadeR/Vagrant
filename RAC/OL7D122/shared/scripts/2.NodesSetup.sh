. /vagrant/config/install.env

echo "+----------------------------------------------------------------------------+"
echo "|                                                                            |"
echo "|                Start - 2.NodesSetup.sh Script.                             |"
echo "|                  Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                                 |"
echo "|                                                                            |"
echo "+----------------------------------------------------------------------------+"

echo " +-----------------------------------------------------------+"
echo " |  Step 1. Configure Local disks: /u01                      |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_u01_disk.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 2. Install OS packages                              |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_install_os_packages.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 3. Install OS packages                              |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_selinux_firewall.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 4. Update /etc/hosts and add all nodes' info        |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_host_base.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 5. Update resolve.conf and stop NetworkManager      |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_resovlve.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 6. Configure shared ASM Disks                       |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_ASM_disks.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 7. Configure Chrony                                 |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_chrony.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 8. create oracle:dba user and group                 |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_create_oracle_user.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 9. Reset root password                              |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
echo -e "${root_pass}\n${root_pass}" | passwd

echo " +-----------------------------------------------------------+"
echo " |  Step 10. Setting Memory parameters for Oracle DB install |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_memory_param.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 11. Finalize oracle user                            |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_finalize_oracle_user.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 12. Generate ssh public key for root user           |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
sh /vagrant/shared/scripts/shared_config_passwordless_ssh_root.sh

echo " +-----------------------------------------------------------+"
echo " |  Step 13. Generate ssh public key for oracle user         |"
echo " |   Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                               |"
echo " +-----------------------------------------------------------+"
su - oracle -c 'sh /vagrant/shared/scripts/shared_config_passwordless_ssh_oracle.sh'

echo "+----------------------------------------------------------------------------+"
echo "|                                                                            |"
echo "|                Finish - 2.NodesSetup.sh Script.                            |"
echo "|                  Date: "`date +"%Y/%m/%d-%H:%M:%S"`"                                 |"
echo "|                                                                            |"
echo "+----------------------------------------------------------------------------+"
