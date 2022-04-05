# Alteredtech homelab/infrastructure

Automating the creation of my homelab infrastructure. 
Technologies used to create infrastructure:
* Packer - Create Machine images
* Ansible - Provision Machine images and Virtual Machines
* Terraform - Create Virtual Machines
* Proxmox - Host the Virtual Machines
* Kubernetes - Orchestrate Services
* Docker - Images for Servers
* Helm - Package Manager for Kubernetes

Services used for monitoring and logging:
* Grafana - Display collected data
* Prometheus - Collect metrics from different endpoints
* Alert Manager - Send alerts based on set levels
* Loki - Log aggregation system 
* Promtail - Log collection endpoint for Loki and Syslog

## Future plans
make it so you run one command and it will deploy on the different types of clouds you provide. Set up bare metal machines to proxmox cluster running your vms.


## Standardization

fix('what'): What bug was specifically fixed 
feat('what'): What was the new feature
docs('what'): Documentation changes
refactor('what'): A code change that neither fixes a bug nor adds a feature
chore('what'): What was a chore i.e. update package versions
style('what'): Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
ci('what'): Changes to our CI configuration files and scripts
cd('what'): Changes to our CD configuration files and scripts
perf('what'): A code change that improves performance
test('what'): adding, removing, correcting tests

revert('hash'): why was the revert needed
BREAKING MERGE('what/feat/chore/etc'): what change does this merge do that breaks previous iterations*

*This is not when code was commited and a process is broken because it was not tested, that is a revert to a previous working state. Breaking merge is a known reason why future iterations will not work the same way they did before, like an api change.
