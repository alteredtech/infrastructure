# --- proxmox-root/main.tf
module "database" {
  source         = "./database"
  for_each       = var.database
  count_in       = each.value.count
  db_name_in     = each.key
  target_node_in = each.value.target
  clone_in       = each.value.clone_template
  memory_in      = each.value.hardware.memory
  ballon_in      = each.value.hardware.ballon
  os_type_in     = each.value.os_type
  cores_in       = each.value.hardware.cores
  #TODO add condition that it can not be lower than the value specified in the template creation, currently 64
  size_in         = each.value.disk.size
  storage_in      = each.value.disk.storage
  model_in        = each.value.networking.model
  bridge_in       = each.value.networking.bridge
  ip_base_in      = each.value.networking.ip_base
  gw_in           = each.value.networking.gw
  nameserver_in   = each.value.networking.nameserver
  searchdomain_in = each.value.networking.searchdomain
}

# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.root}/database/templates/hosts.tpl",
    {
      database_nodes = module.database["database"].database_output
    }
  )
  filename = "${path.root}/../../../ansible/inventory/databases.yml"
}