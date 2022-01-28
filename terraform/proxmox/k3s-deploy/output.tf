# --- proxmox-root/k3s/output.tf

output "node_name_ip" {
  value = [for i in module.node[*] : i]
}