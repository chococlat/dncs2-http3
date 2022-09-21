export DEBIAN_FRONTEND=noninteractive
sudo ip addr add 192.168.200.2/30 dev enp0s8
sudo ip link set dev enp0s8 up
sudo ip route add 192.168.100.0/30 via 192.168.200.1

#Docker
sudo apt-get update
sudo apt-get -y install docker.io
sudo systemctl start docker
sudo systemctl enable docker

#Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable

sudo docker run --name h3web -d -p 80:80 -p 443:443/tcp -p 443:443/udp -v /vagrant/docker/http3.web.conf:/etc/nginx/nginx.conf -v /vagrant/certs/:/etc/nginx/certs/ -v /vagrant/docker/html/:/etc/nginx/html/ chocolat1/http3server:first
