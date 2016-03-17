# Eyeota DevOps test #

## Objective ##

The objective of this test is to implement an Ansible playbook that configures 5 servers according to the given requirements. Unless otherwise specified, the submission is free to accomplish the tasks in any way, as long as it follows these rules:

1. Any code, variable definitions or other items needed to run the solution must be self contained in the git repo supplied.
2. Ansible 2.x (git master is recommended) can be the only external dependency. Specify the Ansible version used as part of submission in case of incompatibility.
3. The hosts the playbook will be tested against (defined in the inventory/hosts file) will be bare CentOS 7 installations with root user ssh key login enabled. root ssh key will be supplied as an ansible-playbook using the --private-key parameter. The submitter is free to use any local solution such as VirtualBox, LXC containers etc, to test against during development, as long as the submitted solution will run against.The servers do not need to be provisioned as part of the solution, and can be manually configured. The number of hosts tested might be more than the 5 provided in the inventory file, but only the 2 supplied groups will be used.

## Requirements ##
1. Create an **ansible module** that collects the number of cpu cores and sums all bogomips values found in /proc/cpustats on the host and returns them as ansible facts
2. Create an **ansible filter**, that given the hosts IP address returns a stable numerical ID based on the last 2 two octets of the IP, so that no two host IDs collide given that the two last octets of the IP is unique across the inventory.
3. For each type_b host have ansible create a file named "result.txt" in the root directory of the host that contains the number of cpus and the total bogomips for that host 
4. For each type_a host have ansible create a file named "result.txt" in the root directory of the host that contains the generated id, number of cpus and total bogomips for each host of type_b in the inventory and the current type_a host. One host per line
5. Requirements 1-4 should all be able to execute using only "ansible-playbook -i inventory playbook.yml" (plus any optional private key or user ansible parameter needed). Any other submitted way of running the playbook will not be accepted asa correct solution.

## Submission ##

Do not submit your solutions as a pull request. Instead gzip your local git clone and send it by email.
As part of the submission, state what version of ansible was used.