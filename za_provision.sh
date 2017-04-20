# 1.Installing Zabbix Repo
yum install -y http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm

# 6. Zabbix Agent
# 6.1. Installing Zabbix Agent
yum install -y zabbix-agent

# 6.2. Configure Zabbix Agent service
/bin/cp /vagrant/zabbix/zabbix_agentd.conf  /etc/zabbix/zabbix_agentd.conf

# 6.3. Starting Zabbix Agent service
systemctl start zabbix-agent