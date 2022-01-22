terraform {
  required_providers {
      proxmox = {
          source = "telmate/proxmox"
          version = "2.9.4"
      }
  }
}

provider "proxmox" {
    #TODO
    # pm_api_url =
    # pm_user = 
    # pm_api_token_id = 
    # pm_api_token_secret = 
    pm_tls_insecure = true
}