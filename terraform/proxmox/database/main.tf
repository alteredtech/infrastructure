# --- proxmox-root/database/main.tf
resource "proxmox_vm_qemu" "test-resource" {
  count       = 1
  name        = "test-vm-${count.index + 1}"
  agent       = 1
  target_node = "pve"
  clone       = var.template_name
  // clone       = "ubuntu-20-04-legacy-LTS-2022-01-22-T21-46-08-UTC"
  full_clone = true
  memory     = 2048
  balloon    = 512
  os_type    = "ubuntu"
  cores      = 2
  sockets    = 1
  scsihw     = "lsi"
  bootdisk   = "scsi0"
  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = "64G"
    type     = "scsi"
    storage  = "local-main"
    iothread = 1
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ipconfig0 = "ip=10.0.2.20${count.index + 1}/24,gw=10.0.2.1"
}