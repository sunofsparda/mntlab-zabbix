# 0.Prepare /etc/hosts
grep -q -F '192.168.55.200 server.lab' /etc/hosts || echo '192.168.55.200 server.lab' >> /etc/hosts
grep -q -F '192.168.55.51 node.lab' /etc/hosts || echo '192.168.55.51 node.lab' >> /etc/hosts

# 1.Installing Zabbix Repo
yum install -y http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm

# 6. Zabbix Agent
# 6.1. Installing Zabbix Agent
yum install -y zabbix-agent

# 6.2. Configure Zabbix Agent service
/bin/cp /vagrant/zabbix/zabbix_agentd.conf  /etc/zabbix/zabbix_agentd.conf

# 6.3. Starting Zabbix Agent service
systemctl start zabbix-agent
systemctl enable zabbix-agent

# 7. Zabbix Agent
# 7.1. Installing Zabbix get and sender
yum install -y zabbix-get zabbix-sender

# 8. Tomcat
# 8.1. Installing Tomcat
yum install -y tomcat
systemctl start tomcat
systemctl enable tomcat

# 8.2. Deploying app
wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war -O /var/lib/tomcat/webapps/sample.war

# 9
wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.70/bin/extras/catalina-jmx-remote.jar -O /usr/share/tomcat/lib/catalina-jmx-remote.jar

echo 'JAVA_OPTS="-Djava.rmi.server.hostname=192.168.55.51' >> /etc/tomcat/tomcat.conf
echo '-Dcom.sun.management.jmxremote' >> /etc/tomcat/tomcat.conf
echo '-Dcom.sun.management.jmxremote.authenticate=false' >> /etc/tomcat/tomcat.conf
echo '-Dcom.sun.management.jmxremote.ssl=false"' >> /etc/tomcat/tomcat.conf

echo '<Listener className="org.apache.catalina.mbeans.JmxRemoteLifecycleListener" rmiRegistryPortPlatform="8096" rmiServerPortPlatform="8097" />' >> /etc/tomcat/server.xml


systemctl restart tomcat
