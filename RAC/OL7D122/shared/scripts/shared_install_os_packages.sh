yum install -y net-tools

yum install -y unixODBC bc binutils compat-libcap1 compat-libstdc++-33 compat-libstdc++-33.i686 dtrace-modules \
dtrace-modules-headers dtrace-modules-provider-headers dtrace-utils elfutils-libelf elfutils-libelf-devel \
elfutils-libelf.i686 elfutils-libelf-devel.i686 fontconfig-devel glibc glibc.i686 glibc-devel glibc-devel.i686 ksh \
libaio libaio.i686 libaio-devel libaio-devel.i686 libdtrace-ctf-devel libXrender libXrender-devel libX11 libX11.i686 \
libXau libXau.i686 libXi libXi.i686 libXtst.i686 libXtst libgcc libgcc.i686 librdmacm-devel libstdc++ libstdc++.i686 \
libstdc++-devel libstdc++-devel.i686 libxcb libxcb.i686 make net-tools nfs-utils python python-configshell \
python-rtslib python-six targetcli smartmontools sysstat gcc-c++ psmisc tree libaio-devel.x86_64 vim bind-utils chrony

yum install -y xorg-x11-xauth xorg-x11-fonts-* xorg-x11-font-utils xorg-x11-fonts-Type1 xorg-x11-apps xdpyinfo --nogpgcheck

yum update -y
