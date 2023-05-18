#!/bin/bash

while true; do
read -p "Install Docker? (y/n) " yn
case $yn in
        [yY] ) varInstallDocker=y;
                break;;
        [nN] ) varInstallDocker=n;
                break;;
        * ) echo invalid response;;
esac
done

while true; do
read -p "Install Docker-Compose? (y/n) " yn
case $yn in
        [yY] ) varInstallDockerCompose=y;
                break;;
        [nN] ) varInstallDockerCompose=n;
                break;;
        * ) echo invalid response;;
esac
done

while true; do
read -p "Install Webmin? (y/n) " yn
case $yn in
        [yY] ) varInstallWebmin=y;
                break;;
        [nN] ) varInstallWebmin=n;
                break;;
        * ) echo invalid response;;
esac
done


#Install Dependencies
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python3 zip unzip -y

if [ $varInstallDocker = y ]; then
echo "Installing Docker..."

	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	usermod -aG docker $(logname)
	usermod -aG dialout $(logname)

fi

if [ $varInstallDockerCompose = y ]; then
	echo "Installing Docker-Compose..."

	case $(uname -m) in
	   "x86_64") curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
	   ;;
	   "armv71") curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-armv7 -o /usr/local/bin/docker-compose
	   ;;
	   "aarch64") curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-aarch64 -o /usr/local/bin/docker-compose
	   ;;
	esac

	chmod +x /usr/local/bin/docker-compose

fi

if [ $varInstallWebmin = y ]; then
	echo "Installing Webmin..."

	curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
	sh setup-repos.sh
	apt-get install webmin

fi

echo "Please log out and log back in"
