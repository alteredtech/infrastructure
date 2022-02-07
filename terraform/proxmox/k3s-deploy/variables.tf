# --- proxmox-root/k3s-deploy/variables.tf
# TODO create descriptions
variable "vault_addr" {
  sensitive = true
}

variable "vault_token" {
  sensitive = true
}

variable "kubernetes" {
  default = {
    // rick is the master node
    rick = {
      count          = 2
      target         = ["pve"]
      clone_template = "tplate-ubuntu-2004-ISO-CINIT"
      os_type        = "ubuntu"
      hardware = {
        memory = 2048
        cores  = 2
      }
      disk = {
        size    = 16
        storage = "local-main"
      }
      networking = {
        model        = "virtio"
        bridge       = "vmbr0"
        ip_base      = "10.0.2.20"
        gw           = "10.0.2.1"
        nameserver   = ["10.0.2.14"]
        searchdomain = "alteredtech.home"
      }
    }
    // morty is the worker node
    morty = {
      count          = 3
      target         = ["pve"]
      clone_template = "tplate-ubuntu-2004-ISO-CINIT"
      os_type        = "ubuntu"
      hardware = {
        memory = 4096
        cores  = 2
      }
      disk = {
        size    = 16
        storage = "local-main"
      }
      networking = {
        model        = "virtio"
        bridge       = "vmbr0"
        ip_base      = "10.0.2.21"
        gw           = "10.0.2.1"
        nameserver   = ["10.0.2.14"]
        searchdomain = "alteredtech.home"
      }
    }
  }
}