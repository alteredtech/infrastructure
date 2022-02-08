# --- proxmox-root/k3s-deploy/main.tf
module "node" {
  source         = "./node"
  for_each       = var.kubernetes
  count_in       = each.value.count
  node_name_in   = each.key
  target_node_in = each.value.target
  clone_in       = each.value.clone_template
  memory_in      = each.value.hardware.memory
  os_type_in     = each.value.os_type
  cores_in       = each.value.hardware.cores
  #TODO add condition that it can not be lower than the value specified in the template creation, currently 6
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
  content = templatefile("${path.root}/node/templates/hosts.tpl",
    {
      master_nodes = module.node["rick"].node_output
      worker_nodes = module.node["morty"].node_output
    }
  )
  filename = "${path.root}/../../../ansible/inventory/k3s.ini"
}

# generate nginx conf file
resource "local_file" "nginx_cfg" {
  content = templatefile("${path.root}/node/templates/nginx.tpl",
    {
      master_nodes = module.node["rick"].node_output
    }
  )
  filename = "${path.root}/../../../ansible/playbooks/loadbalancer/nginx.conf"
}