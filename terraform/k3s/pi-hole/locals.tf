locals {
  pihole_pass = sensitive("${data.vault_generic_secret.prox_terra_get.data["password"]}")
}