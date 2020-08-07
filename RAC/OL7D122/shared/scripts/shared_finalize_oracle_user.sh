echo "    +---------------------------------------------------------------+"
echo "    |  Set passwords and change ownership of /u01, /stage, /dump    |"
echo "    +---------------------------------------------------------------+"
echo -e "oracle\noracle" | passwd
echo -e "oracle\noracle" | passwd oracle

mkdir /stage
mkdir /dump

chown -R oracle:dba /u01
chown -R oracle:dba /stage
chown -R oracle:dba /dump
chmod -R 775 /u01
chmod -R 775 /stage
chmod -R 775 /dump

echo "    +---------------------------------------------------------------+"
echo "    |  Add oracle to sudoers list                                   |"
echo "    +---------------------------------------------------------------+"
echo "oracle ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
