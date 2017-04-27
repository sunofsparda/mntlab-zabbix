# 0.Prepare /etc/hosts
grep -q -F '192.168.55.200 server.lab' /etc/hosts || echo '192.168.55.200 server.lab' >> /etc/hosts
grep -q -F '192.168.55.51 node.lab' /etc/hosts || echo '192.168.55.51 node.lab' >> /etc/hosts


# 1.Installing Zabbix Repo
yum install -y http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm

# 2. Installing and configuring MySQL DB (MariaDB)
# 2.1 Install mysql server
yum install -y mariadb mariadb-server

# 2.2 Mysql Initial configuration 
/usr/bin/mysql_install_db --user=mysql

# 2.3 Starting and enabling mysqld service  
systemctl enable mariadb
systemctl start mariadb   # or service mysqld start

# 2.4 Creating initial database  
mysql -uroot <<MYSQL_SCRIPT
create database zabbix character set utf8 collate utf8_bin;
grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';
quit;
MYSQL_SCRIPT
echo "MySQL base created."

# 3. Installing and configuring Zabbix Server
# 3.1 Install Zabbix DB packages
yum install -y zabbix-server-mysql zabbix-web-mysql

# 3.2 Import initial schema and data  
zcat /usr/share/doc/zabbix-server-mysql-*/create.sql.gz | mysql --user=zabbix --password=zabbix zabbix
# 3.3 Database configuration for Zabbix server 
/bin/cp /vagrant/zabbix/zabbix_server.conf /etc/zabbix/zabbix_server.conf

# 3.4 Starting Zabbix server process 
systemctl enable zabbix-server 
systemctl start zabbix-server 

# 4. Configuring Front-end (httpd)
# 4.1 Configuring PHP settings  
/bin/cp /vagrant/zabbix/httpd_zabbix.conf /etc/httpd/conf.d/zabbix.conf

# 4.2 Starting Front-end 
systemctl enable httpd
systemctl start httpd

# 5. Configure Zabbix server
# 5.1 Configuration
/bin/cp /vagrant/zabbix/zabbix.conf.php /etc/zabbix/web/zabbix.conf.php

# 6. Zabbix Agent
# 6.1. Installing Zabbix Agent
yum install -y zabbix-agent

# 6.2. Starting Zabbix Agent service
systemctl enable zabbix-agent
systemctl start zabbix-agent

# 7. Zabbix Agent
# 7.1. Installing Zabbix get and sender
yum install -y zabbix-get zabbix-sender