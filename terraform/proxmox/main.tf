# --- proxmox-root/main.tf
// module "database" {
//   source = "./database"
//   count_in = 
//   name = 
//   clone_in = 
//   memory = 

// }

// module "k3s" {
//   source = "./k3s"
// }

resource "proxmox_vm_qemu" "test-resource" {
  count       = 1
  name        = "test-vm-${count.index + 1}"
  agent       = 1
  target_node = "pve"
  clone       = var.template_name
}