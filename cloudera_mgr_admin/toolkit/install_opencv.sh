apt-get update
apt-get install libjpeg8 libtiff4 libjasper1 libgtk2.0-0 libgstreamer0.10-0 libswscale2 libavformat53 libv4l-0 libdc1394-22 libgstreamer-plugins-base0.10-0
echo deb http://ftp.debian.org/debian sid main >> /etc/apt/sources.list
apt-get update
apt-get -t sid install libc6 libc6-dev libc6-dbg
sed -i '/sid/d' /etc/apt/sources.list
apt-get update

