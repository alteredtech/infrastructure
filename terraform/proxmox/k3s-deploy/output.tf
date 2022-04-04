# --- proxmox-root/k3s/output.tf

output "vm_node_name_ip" {
  value = [for i in module.vm_node[*] : i]
}