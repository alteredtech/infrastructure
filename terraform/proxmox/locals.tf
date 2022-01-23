locals {
    prox_api_url          = sensitive("https://${data.vault_generic_secret.prox_terra_get.data["prox-terra-api-url"]}/api2/json")
    prox_api_id     = sensitive("${data.vault_generic_secret.prox_terra_get.data["prox-terra-api-user"]}!${data.vault_generic_secret.prox_terra_get.data["prox-terra-api-token-name"]}")
    prox_api_token = sensitive("${data.vault_generic_secret.prox_terra_get.data["prox-terra-api-token"]}")
}