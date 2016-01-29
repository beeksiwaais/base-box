#!/bin/sh -eux

# Disable automatic udev rules for network interfaces in Ubuntu,
# source: http://6.ptmc.org/164/
rm -f /etc/udev/rules.d/70-persistent-net.rules;
mkdir -p /etc/udev/rules.d/70-persistent-net.rules;
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules;
rm -rf /dev/.udev/ /var/lib/dhcp3/* /var/lib/dhcp/*;

# Adding a 2 sec delay to the interface up, to make the dhclient happy
echo "pre-up sleep 2" >>/etc/network/interfaces;


# Restore networking see: https://gist.github.com/brbsix/b70413dec907906ef659
# Disable Predictable Network Interface Names
find /etc/default -name grub -exec sed -i "s/GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"net.ifnames=0\"/g" {} \;
update-grub

# Reconfigure network intefaces
echo "auto eth0" >>/etc/network/interfaces;
echo "iface eth0 inet dhcp" >>/etc/network/interfaces;

echo "auto eth1" >>/etc/network/interfaces;
echo "iface eth1 inet dhcp" >>/etc/network/interfaces;


