proxmox_host           = vault("kv/data/prox-node-1", "prox-host")
proxmox_node           = "pve"
proxmox_api_user       = vault("kv/data/prox-node-1", "prox-user")
proxmox_api_token_name = vault("kv/data/prox-node-1", "prox-token-name")
proxmox_api_token      = vault("kv/data/prox-node-1", "prox-api-token")

template_name        = "ubuntu-20-04-legacy-LTS-{{ isotime \"2006-01-02-T15-04-05\" }}-UTC"
template_description = "Ubuntu 20.04.1 Legacy (focal) x86_64, generated by packer on {{ isotime \"2006-01-02-T15-04-05\" }}-UTC"

ssh_fullname = "packer"
ssh_username = vault("kv/data/prox-node-1", "username")
ssh_password = vault("kv/data/prox-node-1", "password")

hostname       = "ubuntu-20-04-1-cloudinit"
vmid           = "4000"
locale         = "en_US"
cores          = "2"
sockets        = "1"
memory         = "2048"
disk_size      = "64G"
datastore      = "local-main"
datastore_type = "directory"
iso            = "ubuntu-20.04.1-legacy-server-amd64.iso"
iso_checksum   = "sha256:f11bda2f2caed8f420802b59f382c25160b114ccc665dbac9c5046e7fceaced2"

preseed_file = "preseed.cfg"
ansible_play = "packer-ubuntu-20-04"

bridge_name = "vmbr0"