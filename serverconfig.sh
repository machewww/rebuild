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



apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python3 zip unzip -y




if [ $varInstallDocker = y ]; then
echo "Installing Docker..."
#---Install Docker

#docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker $(logname)
usermod -aG dialout $(logname)

fi


if [ $varInstallDockerCompose = y ]; then
echo "Installing Docker-Compose..."
#---Install Docker-Compose
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-armv7 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

fi






if [ $varInstallWebmin = y ]; then
echo "Installing Webmin..."
#---Install Webmin
wget https://gigenet.dl.sourceforge.net/project/webadmin/webmin/2.010/webmin_2.010_all.deb
dpkg --install webmin_2.010_all.deb

fi

#echo "Please log out and log back in"

https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-armv7

sudo curl -L --fail https://github.com/docker/compose/releases/download/1.29.2/run.sh -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
