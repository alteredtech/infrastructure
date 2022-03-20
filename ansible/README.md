## Ansible

Plays and roles to provision VMs.
Playbooks:
* create-database - installs influxdb and postgresql
* create-k3s-lb - setups nginx loadbalancer for kubernetes and web access
* create-k3s - setups and installs k3s on vms
* create-website - create personal websites with ansible
* dev-play - used to test new roles
* reset-k3s - removes all k3s from nodes

Roles:
* blog - create blog website with docker
* influx - create influxdb and chronograf with docker
* nginx - sets up loadbalancers with nginx
* postgres - create postgres and pgadmin with docker
* resume - create resume website with docker
* install-docker - installs docker to the machine and groups
* k3s
    * config - copies kubernetes configuration to local machine
    * download - downloads the correct k3s for the node architecture
    * master - sets up the master nodes
    * node - sets up the worker nodes
    * prereq - does prerequirements for the nodes
    * raspberrypi - sets the raspberry pi up for use in k3s
    * reset - removes k3s from all nodes
* mount-database
* secure-ssh
* update-machine