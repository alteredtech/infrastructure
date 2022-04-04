# --- terraform/modules/vm-node/main.tf
resource "proxmox_vm_qemu" "vm_nodes" {
  depends_on  = [random_shuffle.target_node]
  count       = var.count_in
  name        = join("-", [var.vm_node_name_in, (count.index + 1)])
  agent       = 1
  target_node = one(random_shuffle.target_node.result)
  clone       = var.clone_in
  full_clone  = true
  memory      = var.memory_in
  os_type     = var.os_type_in
  cores       = var.cores_in
  scsihw      = "lsi"
  bootdisk    = "scsi0"
  disk {
    slot     = 0
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