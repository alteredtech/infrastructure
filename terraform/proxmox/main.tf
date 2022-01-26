# --- proxmox-root/main.tf
module "database" {
  source          = "./database"
  count_in        = 1
  db_name_in      = "database-test"
  target_node_in  = "pve"
  clone_in        = "tplate-ubuntu-2004-ISO-CINIT"
  memory_in       = 2048
  ballon_in       = 512
  os_type_in      = "ubuntu"
  cores_in        = 2
  sockets_in      = 1
  #TODO add condition that it can not be lower than the value specified in the template creation, currently 64
  size_in         = "64G"
  storage_in      = "local-main"
  model_in        = "virtio"
  bridge_in       = "vmbr0"
  ipconfig0_in    = "ip=10.0.2.201/24,gw=10.0.2.1"
  nameserver_in   = "second-pi.alteredtech.home"
  searchdomain_in = "alteredtech.home"
}

// module "k3s" {
//   source = "./k3s"
// }