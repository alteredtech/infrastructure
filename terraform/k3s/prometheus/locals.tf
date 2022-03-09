locals {
  prometheus_url = sensitive("${data.vault_generic_secret.slack_get.data["prometheus-alerts"]}")
}