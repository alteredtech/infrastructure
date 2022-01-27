# --- proxmox-root/providers.tf
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.4"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.2.1"
    }
  }
}

provider "proxmox" {
  pm_api_url          = local.prox_api_url
  pm_api_token_id     = local.prox_api_id
  pm_api_token_secret = local.prox_api_token
  pm_tls_insecure     = true
    // pm_log_enable = true
    // pm_log_file   = "terraform-plugin-proxmox.log"
    // pm_debug      = true
    // pm_log_levels = {
    //   _default    = "debug"
    //   _capturelog = ""
    // }
}

provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}