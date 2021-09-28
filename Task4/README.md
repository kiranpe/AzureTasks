Terraform Task:
---------------

Provisioning an Azure VM with Terraform Modules

Logging in to the Microsoft Azure Portal

Starting an Azure Cloud Shell

Initializing Terraform with the Azure Provider

Setting Up a Data Source to Reference the Lab Resource Group

Using a VNet Module from the Terraform Registry

Using a Security Module from the Terraform Registry

Creating a Local Module for Provisioning Azure VMs

Provisioning an Azure VM with the Local Terraform Module

Validate Provisioning an Azure VM with Terraform Modules

Ansible Task List
------------------

Ansible Lab 1:

Create 5 users called user1, user2, . . . , user5. Each user should use /bin/csh as their default shell. 

Create a home directory with the same name as the user for each. 

The users are part of the following groups: students, wheel, operator.

Each user has a default password of login.

Ansible Lab 2:

Each home directory should contain 6 folders: Lab1, Lab2, . . . , Lab6. 

In each folder, there is a PDF file with the lab exercises (including this one) for each lab

you already did in this lecture (the folder Lab1 contains Lab1.pdf, folder Lab2 has Lab2.pdf, etc).

Ansible Lab 3:

Each user should be able to SSH into the jail. 

To allow certain users to SSH into the jail, add the following line to /etc/ssh/sshd_config, which is the configuration file for the SSH daemon (service):

AllowUsers user1 user2 ...

Afterwards, restart the SSH service to make that configuration take effect. Make sure that you do not lock yourself out of the jail by leaving out the user who is
executing the ansible playbook from that AllowUsers list.

Ansible Lab 4:

When a user logs in, a standard message from /etc/motd3 s displayed. Modify that message to welcome the user and display some information about the system

like the following:
â€¢ IP address
â€¢ hostname
â€¢ architecture
â€¢ processor (count and type)
â€¢ free and total memory

Gather this information as facts from the host and use a Jinja2 template file to fill in these variables with their values for your custom /etc/motd.

Ansible Lab 5:

Write a playbook to create a directory www at /srv on a debian based system using a Ansible playbook?

Ansible Lab 6:

Write a plaaybook to checkout from git, upload the checkout (tarballed) to the production server (hosted externally) and then runs the deployment script.

Ansible Lab 7:

Write a playbook to move/rename a file/directory using an Ansible module on a remote system? I don't want to use the command/shell tasks and I don't want to copy the file from the local system to the remote system.

Ansible Lab 8:

Write a playbook to get a list of Ansible pre-defined variables and print them in nice format using anisble.

Ansible Lab 9:

Find a way to How to only run one task in ansible playbook? For example, in roles/hadoop_primary/tasks/hadoop_master.yml. I have "start hadoop job tracker services" task. Can I just run that one task?

HINTS- tags

Ansible Lab 10:

Write a playbook to Creating a new user and password with Ansible

Ansible Lab 11:

Find a way to pass variable to ansible playbook in the command line?

Ansible Lab 12:

Write a playbook to delete files and folders inside a directory?

Note: Solution is in word document and yaml/TF files are in folders
----
