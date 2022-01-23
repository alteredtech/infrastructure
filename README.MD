# Alteredtech homelab/infra

Automating the creation of my homelab infrastructure. Using proxmox as my base for all my vms. Using packer and ansible to create vm templates. Then creating vms based on those templates with terraform. Ansible will provision the vms with their intended purpose.

## Future plans
make it so you run one command and it will deploy on the different types of clouds you provide. Set up bare metal machines to proxmox cluster running your vms.

## File Flow
/ubuntu-20.04/variables.pkr.hcl -> ubuntu-20.04.pkr.hcl -> vars.yml+packer-ubuntu-20-04.yml+ansible.cfg+preseed.cfg+setup.sh = ubuntu-template
/terraform/proxmox/variables.tf+providers.tf+locals.tf+data.tf->main.tf+ubuntu-template->outputs.tf = proxmox vms

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
BREAKING MERGE('what/feat/chore/etc'): what change does this merge do that breaks previous interations*

*This is not when code was commited and a process is broken because it was not tested, that is a revert to a previous working state. Breaking merge is a known reason why future iterations will not work the same way they did before, like an api change.