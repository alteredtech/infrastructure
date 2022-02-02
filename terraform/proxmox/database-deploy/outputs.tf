#--- proxmox-root/database-deploy/outputs.tf
output "database_name_ip" {
  value = [for i in module.database[*] : i]
}