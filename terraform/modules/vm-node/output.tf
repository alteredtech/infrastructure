# --- terraform/modules/vm-node/output.tf

output "vm_node_output" {
  value = {
    for i in proxmox_vm_qemu.vm_nodes[*] : i.name => i.default_ipv4_address
  }
}