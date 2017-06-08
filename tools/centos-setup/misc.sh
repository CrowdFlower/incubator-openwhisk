sudo yum update -y

# Enable Extra Packages for Enterprise Linux repository for python-pip
sudo yum install -y epel-release

sudo timedatectl set-timezone UTC
sudo yum install -y ntp
sudo systemctl enable ntpd.service
sudo systemctl restart ntpd.service
sudo ntpq -c lpeer

sudo yum install -y git
sudo yum install -y zip
sudo yum install -y wget

# required for `ansible-playbook prereq_build.yml`
sudo yum install -y sshpass
