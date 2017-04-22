# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
 
  config.vm.box = "sbeliakou/centos-7.3-x86_64-minimal"
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

# TOMCAT with ZABBIX AGENT
    config.vm.define :tomcat do |tomcat|
      tomcat.vm.host_name = "node.lab"
      tomcat.vm.network "private_network", ip:"192.168.55.51"
      tomcat.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "512"]
      end  
      tomcat.vm.provision "shell", name: "zabbix agent provision", path: "za_provision.sh"
    end

# ZABBIX SERVER
    config.vm.define :zabbix do |zabbix|
      zabbix.vm.host_name = "server.lab"
      zabbix.vm.network "private_network", ip:"192.168.55.200"
      zabbix.vm.network "forwarded_port", guest: 80, host: 8080
      zabbix.vm.provider :virtualbox do |vbox|
         vbox.customize ["modifyvm", :id, "--memory", "1024"]
      end
      zabbix.vm.provision "shell", name: "zabbix server and agent provision", path: "zs_provision.sh"
    end

end

