# --- proxmox-root/database/main.tf
resource "proxmox_vm_qemu" "database" {
  count       = var.count_in
  name        = var.db_name_in
  agent       = 1
  target_node = var.target_node_in
  clone       = var.clone_in
  // clone       = "ubuntu-20-04-legacy-LTS-2022-01-22-T21-46-08-UTC"
  full_clone = true
  memory     = var.memory_in
  balloon    = var.ballon_in
  os_type    = var.os_type_in
  cores      = var.cores_in
  sockets    = var.sockets_in
  scsihw     = "lsi"
  bootdisk   = "scsi0"
  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = var.size_in
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
  ipconfig0 = var.ipconfig0_in
}