# Eyeota DevOps test #

The objective of this test is to implement an Ansible playbook that configures 5 servers according to the given tasks. Unless otherwise specified, the submission is free to accomplish the tasks in any way, as long as it follows these rules:

1. Any code, variable definitions or other items needed to run the solution must be self contained in the git repo supplied.
2. Ansible 2.x (git master or latest stable is recommended) can be the only external dependency. Specify the Ansible version used as part of submission in case of incompatibility.
3. The hosts the playbook will be tested against (defined in the inventory/hosts file) will be bare CentOS 7 installations with root user ssh key login enabled. root ssh key will be supplied as an ansible-playbook using the --private-key parameter. The submitter is free to use any local solution such as VirtualBox, LXC containers etc, to test against during development, as long as the submitted solution will run against.The servers do not need to be provisioned as part of the solution, and can be manually configured.