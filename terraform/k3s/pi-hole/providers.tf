terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.4.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.2.1"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "vault" {
  address = var.vault_addr
  token   = var.vault_token
}