#!/bin/bash
cat /vagrant/shared/files/authorized_keys_root > /root/.ssh/authorized_keys
su - oracle -c 'cat /vagrant/shared/files/authorized_keys_oracle > /home/oracle/.ssh/authorized_keys'
