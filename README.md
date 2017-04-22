# mntlab-zabbix

# Task 1: Basics

Testing Infrastructure:
Vagrantfile to spin up 2 VMs (virtualbox): zabbix server, provisioned by Vagrant provisioner
Zabbix agents on both VMs, provisioned by Vagrant provisioner

I. You should install and configure Zabbix server and agents.

1. Create User group “Project Owners”
2. Create User (example “FirstName LastName”), assign user to “Project Owners”, set email

- created user 'acherlyonok'
<img src="report/1.1.1.users.png">

- added user 'acherlyonok' to group 'Project Owners'
<img src="report/1.1.2.groups.png">


3. Add 2nd VM to zabbix: create Host group (“Project Hosts”), create Host in this group, enable ZABBIX Agent monitoring

- created host 'Tomcat' and enabled ZABBIX Agent monitoring
<img src="report/1.1.3.1.hosts.png">

- created group 'Project Hosts' and added 'Tomcat' to it
<img src="report/1.1.3.2.host_groups.png">


4. Assign to this host template of Linux 

- linked 'Template OS Linux' to 'Tomcat'
<img src="report/1.1.4.host_templates.png">


5. Create custom checks (CPU Load, Memory load, Free space on file systems, Network load)

- created apllication 'custom application (CPU Load, Memory load, Free space on file systems, Network load)'
<img src="report/1.1.5.1.applications.png">

- created custom checks (items)
<img src="report/1.1.5.2.custom_checks.png">


6. Create trigger with Severity HIGH, check if it works (Problem/Recovery)

- created custom trigger
<img src="report/1.1.6.trigger.png">


7. Create Action to inform “Project Owners” if HIGH triggers happen

- created custom action
<img src="report/1.1.7.1.action.png">

- email configuration
<img src="report/1.1.7.2.email_configuration.png">

8. Test

- expecting issue
<img src="report/1.1.8.1.problems_dashboard.png">

- view excisting issues
<img src="report/1.1.8.2.problems.png">

- got email notificaion
<img src="report/1.1.8.3.notification.png">

- notification about problem
<img src="report/1.1.8.4.notification_problem.png">

- notification that everything is OK
<img src="report/1.1.8.5.notification_ok.png">


8. *Super Task*: Configure zabbix to work on the server directly without /zabbix 
http://zabbix-server/zabbix -> http://zabbix-server

II. Using Zabbix UI:
1. Configure “Network discovery” so that, 2nd VM will be joined to Zabbix (group “Project Hosts”, Template “Template OS Linux”)

- created new discovery rule
<img src="report/1.2.2.1.discovery_rule.png">

- created action with included discovery rule as a condition
<img src="report/1.2.2.2.discovery_rule_action.png">

- added register operation and link to the template
<img src="report/1.2.2.3.host_register_rule.png">

- action summary
<img src="report/1.2.2.4.action_summary.png">

- check new host
<img src="report/1.2.2.5.discovery_status.png">

- ensure host was added to 'Project hosts'
<img src="report/1.2.2.6.approved_host.png">

- ensure template was assigned to the founded host
<img src="report/1.2.2.7.applied_template.png">

- status
<img src="report/1.2.2.8.status_dashboard.png">


# Task 2: Tools

Testing Infrastructure:
Vagrantfile to spin up 2 VMs (virtualbox): zabbix server, provisioned by Vagrant provisioner
Linux VM with zabbix agent, script for registration on zabbix server, all provisioned by Vagrant provisioner

1. Configure the agent for replying to the specific server in passive and active mode.

2. Use zabbix_sender to send data to server manually (use zabbix_sender with key –vv for maximal verbosity).

3. Use zabbix_get as data receiver and examine zabbix agent sending’s. 
