#! /bin/sh

# change govenor to performance
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Setup to install kernel and kernel headers

dpkg-reconfigure locales
dpkg-reconfigure tzdata

apt-get update -y
apt-get dist-upgrade -y

apt-get install curl -y
apt-get install sudo -y
apt-get install binutils -y

echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" >>/etc/apt/sources.list
wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -

apt-get update -y
apt-get upgrade -y

curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update && chmod +x /usr/bin/rpi-update
rpi-update

# Add re-generate SSL keys <--------------------------------

echo "If you saw no errors above REBOOT now!"

