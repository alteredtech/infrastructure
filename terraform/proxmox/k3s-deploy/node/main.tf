# --- proxmox-root/k3s-deploy/node/main.tf
resource "proxmox_vm_qemu" "k3s_nodes" {
  depends_on  = [random_shuffle.target_node]
  count       = var.count_in
  name        = join("-", [var.node_name_in, (count.index + 1)])
  agent       = 1
  target_node = one(random_shuffle.target_node.result)
  clone       = var.clone_in
  // clone       = "ubuntu-20-04-legacy-LTS-2022-01-22-T21-46-08-UTC"
  full_clone = true
  memory     = var.memory_in
  os_type    = var.os_type_in
  cores      = var.cores_in
  scsihw     = "lsi"
  bootdisk   = "scsi0"
  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = "${var.size_in}G"
    type     = "scsi"
    storage  = var.storage_in
    iothread = 1
  }
  network {
    model  = var.model_in
    bridge = var.bridge_in
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0    = "ip=${var.ip_base_in}${count.index}/24,gw=${var.gw_in}"
  searchdomain = var.searchdomain_in
  nameserver   = (var.nameserver_in == 1 ? var.nameserver_in[0] : join(",", var.nameserver_in[*]))
}

resource "random_shuffle" "target_node" {
  input        = var.target_node_in
  result_count = 1
}

// # generate inventory file for Ansible
// resource "local_file" "hosts_cfg" {
//   content = templatefile("${path.root}/node/templates/hosts.tpl",
//     {
//       master_nodes = proxmox_vm_qemu.k3s_nodes[*]
//       worker_nodes = proxmox_vm_qemu.k3s_nodes[*]
//       // master_nodes = module.node["rick"].*.rick
//       // worker_nodes = module.node["morty"].*.morty
//     }
//   )
//   filename = "${path.root}/../../../ansible/inventory/k3s.yml"
// }