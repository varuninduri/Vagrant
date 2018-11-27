Vagrant.configure("2") do |config|

  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "ubuntu/trusty64"
        proxy.vm.hostname = "proxy.localnet"
        proxy.vm.network "forwarded_port", guest: 81, host: 81   # Haproxy
        proxy.vm.network "private_network", ip: "192.168.30.2"
        proxy.vm.provision :shell, :path => "proxy.sh"
  end

  config.vm.define "data" do |data|
    data.vm.box = "ubuntu/trusty64"
        data.vm.hostname = "data.localnet"
        data.vm.network "forwarded_port", guest: 27017, host: 27017   # MongoDB
        data.vm.network "private_network", ip: "192.168.30.4"
        data.vm.provision :shell, :path => "db.sh"
  end

  config.vm.define "application" do |application|
    application.vm.box = "ubuntu/trusty64"
        application.vm.hostname = "application.localnet"
        application.vm.network "forwarded_port", guest: 3000, host: 3000
        application.vm.network "forwarded_port", guest: 8085, host: 8085
        application.vm.network "private_network", ip: "192.168.30.3"
        application.vm.provision :shell, :path => "app.sh"
        application.vm.provision :shell, :path => "run.sh"
  end
end
