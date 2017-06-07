#export DEBIAN_FRONTEND=noninteractive

sudo timedatectl set-timezone UTC

sudo yum update -y
sudo yum install -y ntp

sudo systemctl enable ntpd.service
sudo systemctl restart ntpd.service
sudo ntpq -c lpeer

sudo yum install -y git
sudo yum install -y zip
sudo yum install -y wget
