#Set IP Info

case $(cat /sys/class/net/eth0/address) in
   "00:15:5d:19:f6:02") echo "Test VM"
   ;;
   "dc:a6:32:c5:5d:f3") echo "Core-Pi"
   ;;
   "e4:5f:01:00:ec:88") echo "New Core-Pi"
   ;;
esac

case $(cat /sys/class/net/eth0/address) in
   "00:15:5d:19:f6:02") echo "interface eth0" >> /etc/dhcpcd.conf; echo "static ip_address=192.168.25.209/24" >> /etc/dhcpcd.conf; echo "static routers=192.168.25.1" >> /etc/dhcpcd.conf; echo "static domain_name_servers=192.168.25.11 8.8.8.8" >> /etc/dhcpcd.conf
   ;;
   "dc:a6:32:c5:5d:f3") echo "interface eth0" >> /etc/dhcpcd.conf; echo "static ip_address=192.168.25.29/24" >> /etc/dhcpcd.conf; echo "static routers=192.168.25.1" >> /etc/dhcpcd.conf; echo "static domain_name_servers=192.168.25.11 8.8.8.8" >> /etc/dhcpcd.conf
   ;;
   "e4:5f:01:00:ec:88") echo "interface eth0" >> /etc/dhcpcd.conf; echo "static ip_address=192.168.25.190/24" >> /etc/dhcpcd.conf; echo "static routers=192.168.25.1" >> /etc/dhcpcd.conf; echo "static domain_name_servers=192.168.25.11 8.8.8.8" >> /etc/dhcpcd.conf
   ;;
esac
