# mntlab-zabbix

# API
You should develop a script (on Python 2.x) which registers given host in Zabbix.

Testing Infrastructure:
Vagrantfile to spin up 2 VMs (virtualbox):
zabbix server, provisioned by Vagrant provisioner
Linux VM with zabbix agent, script for registration on zabbix server, all provisioned by Vagrant provisioner

Registering Script requirements:
Written on Python 2.x
Starts at VM startup or on provision phase
Host registered in Zabbix server should have Name = Hostname (not IP)
Host registered in Zabbix server should belong to ”CloudHosts” group
Host registered in Zabbix server should be linked with Custom template
This script should create group “CloudHosts” id it doesn’t exist

For both VMs use vagrant box “sbeliakou/centos-7.3-x86_64-minimal”


# JAVA
You should install and configure Zabbix server and agents.

Testing Infrastructure:
Vagrantfile to spin up 2 VMs (virtualbox):
zabbix server, provisioned by Vagrant provisioner
Zabbix agents on both VMs, provisioned by Vagrant provisioner
Install Tomcat 7 on 2nd VM

Tasks:
Configure Zabbix to examine Java parameters via Java Gateway (http://jmxmonitor.sourceforge.net/jmx.html)
Configure triggers to alert once these parameters changed.


# WEB
Testing Infrastructure:
Vagrantfile to spin up 2 VMs (virtualbox):
zabbix server, provisioned by Vagrant provisioner
Zabbix agents on both VMs, provisioned by Vagrant provisioner
Install Tomcat 7 on 2nd VM, deploy any “hello world” application

Tasks:
Configure WEB check:
Scenario to test Tomcat availability as well as Application heath
Configure Triggers to alert once WEB resources become unavailable

For both VMs use vagrant box “sbeliakou/centos-7.3-x86_64-minimal”


# Template

