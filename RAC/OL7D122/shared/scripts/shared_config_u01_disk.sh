
# Partition disk
echo -e "n\np\n1\n\n\nw" | fdisk /dev/sdb

# Add file system.
mkfs.xfs -f /dev/sdb1

# Mount it.
UUID=`blkid -o value /dev/sdb1 | grep -v xfs`
mkdir /u01
cat >> /etc/fstab <<EOF
UUID=${UUID}  /u01    xfs    defaults 1 2
EOF
mount /u01
