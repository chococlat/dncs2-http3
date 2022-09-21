Vagrant.configure("2") do |config|
    config.vm.box_check_update = false

    config.ssh.forward_agent = true  #
    config.ssh.forward_x11 = true    # to use the graphical output (for the browser)

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--usb", "on"]
      vb.customize ["modifyvm", :id, "--usbehci", "off"]
      vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
      vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
      vb.customize ["modifyvm", :id, "--nicpromisc4", "allow-all"]
      vb.customize ["modifyvm", :id, "--nicpromisc5", "allow-all"]
      vb.cpus = 1 #cores amount
    end

    #Router
    config.vm.define "router" do |router|
      router.vm.box = "ubuntu/bionic64"
      router.vm.hostname = "router"
      router.vm.network "private_network", virtualbox__intnet: "broadcast_router-client", auto_config: false
      router.vm.network "private_network", virtualbox__intnet: "broadcast_router-server", auto_config: false
      router.vm.provision "shell", path: "vscripts/router.sh"
      router.vm.provider "virtualbox" do |vb|
            vb.memory = 512    
        end
    end

    #Webserver
    config.vm.define "webserver" do |webserver|
      webserver.vm.box = "ubuntu/bionic64"
      webserver.vm.hostname = "webserver"
      webserver.vm.network "private_network", virtualbox__intnet: "broadcast_router-server", auto_config: false
      webserver.vm.provision "shell", path: "vscripts/webserver.sh"
      webserver.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
        end
    end

    #Client
    config.vm.define "client" do |client|
      client.vm.box = "ubuntu/bionic64"
      client.vm.hostname = "client"
      client.vm.network "private_network", virtualbox__intnet: "broadcast_router-client", auto_config: false
      client.vm.provision "shell", path: "vscripts/client.sh"
      client.vm.provider "virtualbox" do |vb|
            vb.memory = 2048
        end
    end
end
