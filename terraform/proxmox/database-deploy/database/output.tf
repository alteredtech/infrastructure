# --- proxmox-root/database-deploy/database/output.tf

output "database_name_ip" {
    value = {
        for i in proxmox_vm_qemu.database[*] : i.name => join("-", [i.default_ipv4_address])
    }
}