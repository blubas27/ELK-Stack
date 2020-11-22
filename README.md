## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/blubas27/ELK-Stack/blob/main/Diagrams/ELK-Diagram.png (ELK-Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the     .yml file may be used to install only certain pieces of it, such as Filebeat.

  - https://github.com/blubas27/ELK-Stack/blob/main/Ansible/filebeat-playbook.yml 

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available and consistent, in addition to restricting traffic to the network.

- Load balancers protect availability, this will ensure a server will not become overloaded.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat monitors specified log files, and collects log events.
- Metricbeat records metrics and statistics from the operating system, and applications running on servers.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.1.0.6   | Linux            |
| Web-1    | Webserver| 10.1.0.10  | Linux            |
| Web-2    | Webserver| 10.1.0.8   | Linux            |
| ELK      | Log Mgr  | 10.2.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Local IP Address (My personal IP)

Machines within the network can only be accessed by SSH.
- Jump Box Provisioner (Public IP address of your Jump Box)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses                               |
|----------|---------------------|----------------------------------------------------|
| Jump Box |  No                 | Local IP Address (My personal IP)                  |
| Web-1    |  No                 | Local IP Address (My personal IP)                  |
| Web-2    |  No                 | Local IP Address (My personal IP)                  |
| ELK      |  No                 | Local IP Address (My personal IP)                  |  

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- This allows you to configure multiple VM's at the same time. This also can eliminate erros, and increase time management.

The playbook implements the following tasks:
- Install docker.io
- Install Python 3 and the python module
- Configure python module
- Download elk image
- Configure ports and launch container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/blubas27/ELK-Stack/blob/main/Images/ELK_docker_ps.png (ELK_docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.1.0.10 (Private IP address)
- Web-2 10.1.0.8  (Private IP Address)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log data and events, providing information such as a failed or successful SSH attempt.

- Metricbeat collects metric data or the operating system, such as CPU and memory usuage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the source file to the destination file.
- Update the config file to include the group of servers and the IP addresses.
- Run the playbook, and navigate to the target machines, and run sudo docker ps to see if the correct containers have been installed and to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
    The playbook is the set of instructions that you hand to ansible to install applications on your web servers, ie (filebeat-playbook.yml).  You copy this file from your ansible container to your web VM's.
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
    This is the config file, ie (filebeat-config-yml). You would sepcify which machine ansible is installing on by inserting the private IP addresses of the VM's into a selected group, ie (webservers).
- _Which URL do you navigate to in order to check that the ELK server is running?
     http://ELK Public IP]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

Download Playbook:

curl
https://upenn.bootcampcontent.com/upenn-bootcamp/upenn-eng-cyber-pt-08-2020-u-c/raw/master/1-Lesson-Plans/13-Elk-Stack-Project/2/Activities/01_Activity/Unsolved/Resources/filebeat-playbook.yml?inline=false > etc/ansible/roles/filebeat-playbook.yml

Download Cofnig File:

curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml
Update the playbook 
Update the config file 
and then run
ansible-playbook filebeat-config.yml
