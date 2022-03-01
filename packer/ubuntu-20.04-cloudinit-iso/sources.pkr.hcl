source "proxmox" "ubuntu-2004" {
  node                     = "${var.proxmox_node}"
  proxmox_url              = "https://${local.proxmox_host}/api2/json"
  insecure_skip_tls_verify = true
  username                 = "${local.proxmox_api_user}!${local.proxmox_api_token_name}"
  token                    = "${local.proxmox_api_token}"
  vm_name                  = "${var.template_name}"
  template_description     = "${var.template_description}"

  #vm hardware configurations
  os                      = "l26"
  iso_file                = "${var.iso_location}/${var.iso}"
  iso_checksum            = "${var.iso_checksum}"
  cloud_init              = true
  cloud_init_storage_pool = "${var.datastore}"
  qemu_agent              = true
  unmount_iso             = true
  ssh_username            = "${local.ssh_username}"
  ssh_password            = "${local.ssh_password}"
  ssh_timeout             = "90m"
  http_directory          = "./http"
  boot_wait               = "5s"

  disks {
    cache_mode        = "writeback"
    disk_size         = "${var.disk_size}"
    format            = "raw"
    storage_pool      = "${var.datastore}"
    storage_pool_type = "${var.datastore_type}"
    type              = "scsi"
  }

  network_adapters {
    bridge = "${var.bridge_name}"
    model  = "virtio"
  }

  boot_command = [
    "<esc><wait>",
    "<esc><wait>",
    "<enter><wait>",
    "/install/vmlinuz<wait> ",
    "initrd=/install/initrd.gz<wait> ",
    "auto=true<wait> ",
    "priority=critical<wait> ",
    "url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_file}<wait> ",
    "passwd/username=${local.ssh_username}<wait> ",
    "passwd/user-fullname=${local.ssh_fullname}<wait> ",
    "passwd/user-password=${local.ssh_password}<wait> ",
    "passwd/user-password-again=${local.ssh_password}<wait>",
    "<enter>"
  ]
}