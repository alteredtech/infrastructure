# --- proxmox-root/variables.tf
# TODO create descriptions
variable "vault_addr" {
  sensitive = true
}

variable "vault_token" {
  sensitive = true
}

variable "database" {
  default = {
    database = {
      count          = 1
      target         = ["pve"]
      clone_template = "tplate-ubuntu-2004-ISO-CINIT"
      os_type        = "ubuntu"
      hardware = {
        memory = 8192
        cores  = 4
      }
      disk = {
        size    = 16
        storage = "local-main"
      }
      networking = {
        model        = "virtio"
        bridge       = "vmbr0"
        ip_base      = "10.0.2.2"
        gw           = "10.0.2.1"
        nameserver   = ["10.0.2.14"]
        searchdomain = "alteredtech.home"
      }
    }
  }
}