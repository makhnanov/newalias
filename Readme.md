# Newalias

## Introduction
This project collect some programs and scripts for your just installed Linux (Ubuntu). \
Here you can find aliases, tricks, useful things prefer for bash interpreter. \
Tested on `bash5.1.8(1)-release` \
Features:
- Function `newalias` with easy control aliases and self update
- File with after-install recommendations
- File with dist aliases
- File with private aliases

## Installation
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

## Private aliases
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
     cowsay jq net-tools htop filezilla

# Show network addresses
hostname -I
ifconfig -a
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
curl -4 icanhazip.com

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

## VPS / VDS

### Programs
```shell
apt-get -y install htop nano mc git
```

### Nginx
- Install and enable ufw
```shell
apt update
apt install nginx
ufw app list
ufw status
ufw allow 'Nginx HTTP' # Or other
# Before execute next command make sure that you allow OpenSSH if you are on remote server =)
ufw enable # ufw allow 'OpenSSH' 
```

- Default /etc/nginx/nginx.conf in nginx/1.14.0 (Ubuntu)
```pan
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;
        keepalive_timeout 65;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}
#mail {
#       # See sample authentication script at:
#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
# 
#       # auth_http localhost/auth.php;
#       # pop3_capabilities "TOP" "USER";
#       # imap_capabilities "IMAP4rev1" "UIDPLUS";
# 
#       server {
#               listen     localhost:110;
#               protocol   pop3;
#               proxy      on;
#       }
# 
#       server {
#               listen     localhost:143;
#               protocol   imap;
#               proxy      on;
#       }
#}
```
- Default /etc/nginx/sites-available/default in nginx/1.14.0 (Ubuntu)
```pan
##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# https://www.nginx.com/resources/wiki/start/
# https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/
# https://wiki.debian.org/Nginx/DirectoryStructure
#
# In most cases, administrators will remove this file from sites-enabled/ and
# leave it as reference inside of sites-available where it will continue to be
# updated by the nginx packaging team.
#
# This file will automatically load configuration files provided by other
# applications, such as Drupal or Wordpress. These applications will be made
# available underneath a path with that package name, such as /drupal8.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

# Default server configuration
#
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        # SSL configuration
        #
        # listen 443 ssl default_server;
        # listen [::]:443 ssl default_server;
        #
        # Note: You should disable gzip for SSL traffic.
        # See: https://bugs.debian.org/773332
        #
        # Read up on ssl_ciphers to ensure a secure configuration.
        # See: https://bugs.debian.org/765782
        #
        # Self signed certs generated by the ssl-cert package
        # Don't use them in a production server!
        #
        # include snippets/snakeoil.conf;

        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }

        # pass PHP scripts to FastCGI server
        #
        #location ~ \.php$ {
        #       include snippets/fastcgi-php.conf;
        #
        #       # With php-fpm (or other unix sockets):
        #       fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        #       # With php-cgi (or other tcp sockets):
        #       fastcgi_pass 127.0.0.1:9000;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #       deny all;
        #}
}

# Virtual Host configuration for example.com
#
# You can move that to a different file under sites-available/ and symlink that
# to sites-enabled/ to enable it.
#
#server {
#       listen 80;
#       listen [::]:80;
#
#       server_name example.com;
#
#       root /var/www/example.com;
#       index index.html;
#
#       location / {
#               try_files $uri $uri/ =404;
#       }
#}
```

- Test nginx config
```shell
nginx -t
```

- Включение / выключение автостарта
```shell
sudo systemctl enable nginx
sudo systemctl disable nginx
```

- Redirect from HTTP to HTTPS
```
server {
    listen 80 default_server;
    server_name  example.com;
    return 302 https://$server_name$request_uri;
}
```

- Set HTTPS / SSL
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

- Troubleshooting with crt / key
```
-----BEGIN TRUSTED CERTIFICATE-----
-----END TRUSTED CERTIFICATE-----
-----BEGIN RSA PRIVATE KEY-----
-----END RSA PRIVATE KEY-----
```

## Docker
WIP