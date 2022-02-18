# run packer (prints to stdout, but stores the output in a variable)
packer_out=$(packer build $HOME/Coding/infrastructure/packer/ubuntu-20.04-cloudinit-iso | tee /dev/tty)

# packer prints the id of the generated AMI in its last line
template=$(echo "$packer_out" | tail -n 10 | grep -oP '(tplate-).*(CINIT)' )

# create the 'prox.tf' file from the template:
export TEMPLATE_GENERATED_BY_PACKER="$template" && envsubst < $HOME/Coding/infrastructure/terraform/proxmox/database-deploy/prox.tf.template > $HOME/Coding/infrastructure/terraform/proxmox/database-deploy/prox.tf
