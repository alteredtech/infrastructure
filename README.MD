# Alteredtech homelab/infra

Automating the creation of my homelab infrastructure. Using proxmox as my base for all my vms. Using packer and ansible to create vm templates. Then creating vms based on those templates with terraform. Ansible will provision the vms with their intended purpose.

## Future plans
make it so you run one command and it will deploy on the different types of clouds you provide. Set up bare metal machines to proxmox cluster running your vms.

## File Flow
/ubuntu-20.04/variables.pkr.hcl -> ubuntu-20.04.pkr.hcl -> vars.yml+packer-ubuntu-20-04.yml+ansible.cfg+preseed.cfg+setup.sh->