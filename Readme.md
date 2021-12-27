## Introduction
This project collect some programs and scripts for your just installed Linux (Ubuntu). \
Here you can find aliases, tricks, useful things for your interpreter. \
Tested on `bash5.1.8(1)-release` \
Features:
- Function `newalias` with easy control aliases and self update
- File with after-install recommendations
- File with dist aliases
- File with private aliases

## Installation
```shell
# Clone project to home hidden dir
git clone https://github.com/makhnanov/newalias.git $(pwd)/.newalias
# Become god
sudo su
# Connect this project aliases file to global shell
echo ". $(pwd)/.newalias/newalias-dist.sh" >> /etc/bash.bashrc
# Create and connect your private file to global shell
touch $(pwd)/.newalias/newalias-private.sh
echo ". $(pwd)/.newalias/newalias-private.sh" >> /etc/bash.bashrc
```

## Additionally, after just install OS / first start recommendations
```shell
# Fix bluetooth problems
https://github.com/winterheart/broadcom-bt-firmware

# Fast entrance to server
alias serv='sshpass -p VerySecretPassword ssh root@ip.v4.address.dist'

# Install useful programs
sudo apt-get update
sudo apt-get -y install keepassxc git make mc nano nmap sshpass bash-completion cmatrix cheese translate-shell \
     cowsay jq

# Fix chrome require unlock keyring 
/usr/bin/google-chrome-stable %U --password-store=basic

# Download and install chrome and telegram
firefox https://www.google.ru/chrome/ https://desktop.telegram.org/
cd ~/Downloads 2> /dev/null || cd ~/Загрузки
sudo dpkg -i google-chrome
rm google-chrome*
sudo mkdir /opt/Telegram
sudo chmod -R 777 /opt/Telegram
tar -xvf tsetup* -C /opt/Telegram
/opt/Telegram$ Telegram/Telegram
rm tsetup*

# Test SSD/HDD io speed
sudo apt-get -y install fio
fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=fiotest --filename=testfio --bs=4k --iodepth=64 --size=8G --readwrite=randrw --rwmixread=75

# Test SSD/HDD ping
sudo apt-get -y install ioping
ioping -c 20 /tmp/

# Download and install jetbrains toolbox
xdg-open https://www.jetbrains.com/toolbox-app/
sudo mkdir /opt/JBToolbox
sudo chmod -R 777 /opt/JBToolbox
tar -xvf jetbrains-toolbox* -C /opt/JBToolbox
/opt/JBToolbox/jetbrains-toolbox-*/jetbrains-toolbox

# Download and install sublime text
xdg-open https://www.sublimetext.com/docs/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get -y install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Generate new SSH key pair
ssh-keygen -t ed25519 -C "your_email@example.com"
cat $(pwd)/.ssh/id_ed25519.pub

# Download and install Postman Canary
xdg-open https://www.postman.com/downloads/canary/
sudo mkdir /opt/PostmanCanary
sudo chmod -R 777 /opt/PostmanCanary
tar -xvf PostmanCanary-* -C /opt/PostmanCanary
/opt/PostmanCanary/PostmanCanary/PostmanCanary

# Download and install docker
xdg-open https://docs.docker.com/engine/install/ubuntu/
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
xdg-open https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
mkdir /home/"$USER"/.docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo chmod 666 /var/run/docker.sock

# Download and install docker-compose
xdg-open https://docs.docker.com/compose/cli-command/
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo chmod 777 /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Find dir by regex
sudo find / -type d -name 'log' 2>/dev/null
# Find file by regex
sudo find / -type f -name '*.log' 2>/dev/null

```

