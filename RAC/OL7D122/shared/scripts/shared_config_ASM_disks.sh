#!/bin/bash
# Export ASM related variables from the vagrant.yaml file
#while read assign; do
# export "$assign"; 
#done < <(cat /vagrant/config/vagrant.yml | grep ASM | sed 's/ //g' | sed 's/:/=/g' | sed "s/'//g")
cat /vagrant/config/vagrant.yml | grep ASM | sed 's/ //g' | sed 's/:/=/g' | sed "s/'//g" > /tmp/test.tmp
while read assign; do 
 export "$assign"; 
done < /tmp/test.tmp

# get all disks into an array
disks=($(ls  /dev/sd* | grep -v '[0-9]')) 

# loop over disks in array and format them
for i in $(echo ${disks[@]}); do
    # check if it has a partition
    diskcheck=$(ls ${i}* | grep '[0-9]')
    # if not, print it
    if [ -z "$diskcheck" ]; then
        echo $i
	echo -e "n\np\n1\n\n\nw" | fdisk $i
    fi
done

# list all disks
ls -l /dev/sd*

# Add udev rules 
disk_num=1
disk_name=$ASM_DATA_filename
disks=($(ls  /dev/sd* | grep '[0-9]' | grep -v a | grep -v b))
for i in $(echo ${disks[@]}); do
    # write the partition rule in
        echo "Disk is ${i} and disk_num is ${disk_num}"
        ASM_DISK=`/usr/lib/udev/scsi_id -g -u -d $i`
        if [[ $disk_num -gt $ASM_DATA_disk_count ]]; then 
	 disk_name=$ASM_FRA_filename
	 disk_num=1
	fi
cat >> /etc/udev/rules.d/99-oracle-asmdevices.rules <<EOF
KERNEL=="sd?1", SUBSYSTEM=="block", PROGRAM=="/usr/lib/udev/scsi_id -g -u -d /dev/\$parent", RESULT=="${ASM_DISK}", SYMLINK+="oracleasm/asm_${disk_name}$(printf "%02d" $disk_num)", OWNER="oracle", GROUP="dba", MODE="0660"
EOF
        let "disk_num+=1"
done

# cat the udev rules file
cat /etc/udev/rules.d/99-oracle-asmdevices.rules

# Do partprobe and reload twice.
# Sometimes links don't all appear on first run.

disks=($(ls  /dev/sd* | grep '[0-9]' | grep -v a | grep -v b))
for i in $(echo ${disks[@]}); do
	/usr/sbin/partprobe $i
done
sleep 10
/sbin/udevadm control --reload-rules
sleep 10
disks=($(ls  /dev/sd* | grep '[0-9]' | grep -v a | grep -v b))
for i in $(echo ${disks[@]}); do
	/usr/sbin/partprobe $i
done
sleep 10
/sbin/udevadm control --reload-rules
sleep 10
ls -al /dev/oracleasm/*
