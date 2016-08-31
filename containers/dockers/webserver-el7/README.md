# Ansible Inventory Testing
  * Add this to your /etc/hosts. This is to simulate multiple hosts in the ansible inventory.
  ```
#ansible host docker containers inventory
192.168.99.100 eyeota-webserver1.test.com
192.168.99.100 eyeota-webserver2.test.com
192.168.99.100 eyeota-webserver3.test.com
192.168.99.100 eyeota-restapi-1.test.com
192.168.99.100 eyeota-restapi-2.test.com
```  