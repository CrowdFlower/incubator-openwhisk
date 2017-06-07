# required for ansible
sudo yum install -y gcc
sudo yum install -y python-devel
sudo yum install -y openssl-devel

sudo pip install markupsafe
sudo pip install ansible==2.3.0.0
sudo pip install docker==2.2.1


ansible --version
ansible-playbook --version
