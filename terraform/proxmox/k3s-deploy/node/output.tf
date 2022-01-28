# --- proxmox-root/k3s/node/output.tf

output "node_output" {
  value = {
    for i in proxmox_vm_qemu.k3s_nodes[*] : i.name => i.default_ipv4_address
  }
}