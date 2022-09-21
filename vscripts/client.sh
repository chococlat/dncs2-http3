export DEBIAN_FRONTEND=noninteractive
sudo ip addr add 192.168.100.2/30 dev enp0s8
sudo ip link set dev enp0s8 up
sudo ip route add 192.168.200.0/30 via 192.168.100.1

#Docker
sudo apt-get update
sudo apt-get -y install docker.io
sudo systemctl start docker
sudo systemctl enable docker

#XORG
sudo apt-get update
sudo apt-get -y install xorg

#Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable

docker pull ymuski/curl-http3
