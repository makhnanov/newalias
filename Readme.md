![Newalias](https://github.com/makhnanov/newalias/blob/main/newalias.png?raw=true)

## Introduction
Here you can find aliases, tricks, useful things prefer for bash interpreter. \
This project collect some programs and scripts for your just installed Linux (Ubuntu). \
Tested on `bash5.1.8(1)-release` \
Features:
- Function `newalias` with easy control aliases and self update
- File with dist aliases
- File with your private aliases (unversioned)
- After-install recommendations for PC or VPS
- Default configs for some services
- Troubleshooting for some problems

## Installation via git
```shell
# Clone project to home hidden dir
cd ~
git clone https://github.com/makhnanov/newalias.git $(pwd)/.newalias
# Become god
sudo su
# Connect this project aliases file to global shell
echo ". $(pwd)/.newalias/newalias-dist.sh" >> /etc/bash.bashrc
# Create and connect your private file to global shell
touch $(pwd)/.newalias/newalias-private.sh
echo ". $(pwd)/.newalias/newalias-private.sh" >> /etc/bash.bashrc
```

## newalias -h
```text
Usage:
    newalias # Edit your private file with aliases.
    # or
    newalias [parameter]

Configuration:
    Directory: /home/roman/.newalias
    Dist aliases:  /home/roman/.newalias/newalias-dist.sh
    Private aliases:  /home/roman/.newalias/newalias-private.sh
    Editor: /usr/bin/nano
    Browser: /usr/bin/google-chrome
    Configuration file: /home/roman/.newalias/newalias.conf

Parameters:
    -h, --help           This message with parameters description.
    
    -p, --private-edit   Edit your private file with aliases.
    
    -d, --dist-edit      Edit dist public file with aliases.
                         Not recommend for edit if you are not contributor.
    
    -c, --dist-compare   Open browser to compare changes with version of your public aliases and github version.
    
    -u, --self-update    Self update (git pull) for get new public aliases.
    
    -e, --config-edit    Configure editor and browser for work with newalias, and github check updates.
    
    -v, --version        Show current version and git commit sha.
    
    -t, --test           Test config for check editor and browser existence.
    
    -r, --readme         Show readme for get more useful tips.
```


## Distributed aliases
### [Here](https://github.com/makhnanov/newalias/blob/main/newalias-dist.sh) or use `newalias -d`

## Additionally, after just install OS / first start recommendations
```shell
# Fix bluetooth problems
https://github.com/winterheart/broadcom-bt-firmware

# Fast entrance to server
alias serv='sshpass -p VerySecretPassword ssh root@ip.v4.address.dist'

# Install useful programs
sudo apt-get update
sudo apt-get -y install keepassxc git make mc nano nmap sshpass bash-completion cmatrix cheese translate-shell \
     cowsay jq net-tools htop filezilla rsync

# Show network addresses
hostname -I
ifconfig -a
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
curl -4 icanhazip.com

# Fix chrome require unlock keyring 
/usr/bin/google-chrome-stable %U --password-store=basic
```

### Download and install chrome
```shell
# xdg-open https://www.google.ru/chrome/
cd ~/Downloads 2> /dev/null || cd ~/Загрузки
sudo dpkg -i google-chrome
rm google-chrome*
```

### Download and install telegram
```shell
sudo bash -c "wget -O /opt/tg.tar https://telegram.org/dl/desktop/linux && \
  tar -xvf /opt/tg.tar --directory=/opt && \
  rm /opt/tg.tar"
/opt/Telegram/Telegram

# Desktop shortcut /usr/share/applications
# https://github.com/telegramdesktop/tdesktop/blob/10e7bd0d6eb02c05b49680ad9c3c9270f34c82e9/lib/xdg/telegramdesktop.desktop
```

### Download and install jetbrains toolbox
```shell
sudo bash -c "wget -O /opt/toolbox.tar.gz \
  $(curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release" | jq '.TBA | .[].downloads.linux.link' | xargs) && \
  tar -xvf /opt/toolbox.tar.gz --directory=/opt && \
  rm /opt/toolbox.tar.gz"
$(find /opt/ -iname jetbrains-toolbox)
```

```shell
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

# Add additional git host
sudo nano ~/.ssh/config
[Content](https://github.com/makhnanov/newalias/blob/main/git/config.conf)

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
```

#### Download and install good docker containers viewer
```shell
# xdg-open https://github.com/bcicen/ctop
echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list
wget -qO - https://azlux.fr/repo.gpg.key | sudo apt-key add -
sudo apt update
sudo apt install docker-ctop
```

```shell
# Find dir by regex
sudo find / -type d -name 'log' 2>/dev/null
# Find file by regex
sudo find / -type f -name '*.log' 2>/dev/null

# Install latest PHP
sudo apt update
sudo apt -y install lsb-release ca-certificates apt-transport-https software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt -y install php8.1 php8.1-xml

# Disable / enable apache2 autostart
sudo update-rc.d apache2 disable
sudo update-rc.d apache2 enable
```

## VPS / VDS

### Programs
```shell
apt-get -y install htop nano mc git jq curl rsync
```

### Nginx

#### Default configs [here](https://github.com/makhnanov/newalias/tree/main/default)

#### Install and enable ufw
```shell
apt update
apt install nginx
ufw app list
ufw status
ufw allow 'Nginx HTTP' # Or other
# Before execute next command make sure that you allow OpenSSH if you are on remote server =)
ufw enable # ufw allow 'OpenSSH' 
```

#### Test nginx config
```shell
nginx -t
```

#### Включение / выключение автостарта
```shell
sudo systemctl enable nginx
sudo systemctl disable nginx
```

#### Redirect from HTTP to HTTPS
```
server {
    listen 80 default_server;
    server_name  example.com;
    return 302 https://$server_name$request_uri;
}
```

#### Set HTTPS / SSL
```
server {
    gzip off;

    listen 443 ssl http2 default_server;
    listen [::]:443 ssl http2 default_server;

    ssl_certificate certs/expert.crt;
    ssl_certificate_key certs/expert.key;
    ...
}
```

#### Troubleshooting with crt / key
```
-----BEGIN TRUSTED CERTIFICATE-----
-----END TRUSTED CERTIFICATE-----
-----BEGIN RSA PRIVATE KEY-----
-----END RSA PRIVATE KEY-----
```

#### Install OBS Studio
```
xdg-open https://obsproject.com/wiki/install-instructions#linux-install-directions
sudo apt -y install ffmpeg
sudo apt -y install v4l2loopback-dkms
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt -y install obs-studio
```


## Docker
```shell
### Fix docker in container dns / internet troubles
Create ```/etc/docker/daemon.json```
```json
{
"dns": ["8.8.8.8"]
}
```
### Login
```
docker login -u username -p password host
```
### Other
```shell
docker rm -f $(docker ps -aq)
docker volume rm $(docker volume ls -q)
docker network prune -f
docker network ls
COMPOSE=docker compose \
$(COMPOSE) up --detach --remove-orphans --force-recreate --build
$(COMPOSE) down
```

## Git
```shell
git config --global init.defaultBranch main
git branch -m main
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor nano
git config --global init.defaultBranch main
git config --list
git config user.name
git branch -m main

# How to add read and write access for new autogenerated unversioned files inside docker container
docker compose exec php bash -c "chod 777 $(git ls-files --others --exclude-standard | sed "s/src\///g")"
# Also you can add alias allow-read-write-new-files='...'


```

## Write Windows.iso on linux to USB
[WoeUSB](https://github.com/WoeUSB/WoeUSB-ng)

## Format usb on linux for windows and linux compatibility
sudo fdisk -l
sudo mkfs -t vfat -L FLASH /dev/sdc

## Zip folder
zip -qr backup.zip folder # Without output 
sudo 7z a backup.zip folder # Witho percentage output

## Xubuntu clock date format
```shell
%A %_d %b (%m) %G | <b>%j days</b> | %I:%M %p | <b>%T</b>
```

## Grub disable timeout
```shell
sudo nano /etc/default/grub
GRUB_TIMEOUT=-1
sudo update-grub
# https://andreyex.ru/linux/kak-izmenit-vremya-ozhidaniya-grub-v-linux/
```

## Grub remove useless elements
```shell
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer
```

## Install Postman
```shell
sudo snap install postman
```
