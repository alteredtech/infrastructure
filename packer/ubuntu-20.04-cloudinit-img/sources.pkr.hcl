#TODO add comments
source "proxmox" "ubuntu-2004-cloudinit" {
  node                     = "${var.proxmox_node}"
  proxmox_url              = "https://${local.proxmox_host}/api2/json"
  insecure_skip_tls_verify = true
  username                 = "${local.proxmox_api_user}!${local.proxmox_api_token_name}"
  token                    = "${local.proxmox_api_token}"
  clone_vm = "${var.clone_source}"
  vm_name              = "${var.template_name}"
  template_description = "${var.template_description}"

  // #vm hardware configurations
  cpu_type = 
  os           = "l26"
  qemu_agent  = true

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

  #TODO create packer user
  #probably wont be release for awhile and here is an issue tracking it
  # https://github.com/hashicorp/packer-plugin-proxmox/issues/7
  
}