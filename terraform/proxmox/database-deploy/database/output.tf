# --- proxmox-root/database-deploy/database/output.tf

output "database_output" {
  value = {
    for i in proxmox_vm_qemu.database[*] : i.name => i.default_ipv4_address
  }
}