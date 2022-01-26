
source "proxmox" "ubuntu-2004" {
  node                     = "${var.proxmox_node}"
  proxmox_url              = "https://${local.proxmox_host}/api2/json"
  insecure_skip_tls_verify = true
  username                 = "${local.proxmox_api_user}!${local.proxmox_api_token_name}"
  token                    = "${local.proxmox_api_token}"
  // vm_id                    = "${var.vmid}"
  vm_name              = "${var.template_name}"
  template_description = "${var.template_description}"

  #vm hardware configurations
  sockets      = "${var.sockets}"
  cores        = "${var.cores}"
  memory       = "${var.memory}"
  os           = "l26"
  iso_file     = "${var.iso_location}/${var.iso}"
  iso_checksum = "${var.iso_checksum}"
  cloud_init = true
  cloud_init_storage_pool = "${var.datastore}"

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

  qemu_agent  = true
  unmount_iso = true
  ssh_password   = "${local.ssh_password}"
  ssh_timeout    = "90m"
  ssh_username   = "${local.ssh_username}"
  http_directory = "./http"
  boot_wait      = "5s"

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

build {
  sources = ["source.proxmox.ubuntu-2004"]

  provisioner "shell" {
    execute_command = "echo 'packer' | sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/setup.sh"
  }

  provisioner "ansible" {
    extra_arguments = [
      "-v",
      "-e ansible_ssh_pass=${local.ssh_password} VAULT_ADDR='${var.vault_addr}' VAULT_TOKEN='${var.vault_token}'"]
    ansible_env_vars = ["ANSIBLE_CONFIG=playbook/ansible.cfg"]
    playbook_file    = "./playbook/${var.ansible_play}.yml"
    use_proxy        = false
  }
  post-processor "shell-local" {
    inline = ["echo ${var.template_name}"]
  }
}
