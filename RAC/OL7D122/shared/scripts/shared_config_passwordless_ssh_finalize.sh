#!/bin/bash
cat /vagrant/shared/files/authorized_keys_root > /root/.ssh/authorized_keys
sh /vagrant/shared/files/passwordlesssssh_ssh-keyscan.sh
su - oracle -c 'cat /vagrant/shared/files/authorized_keys_oracle > /home/oracle/.ssh/authorized_keys'
su - oracle -c 'sh /vagrant/shared/files/passwordlesssssh_ssh-keyscan.sh'
