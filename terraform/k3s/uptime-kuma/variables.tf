#---- terraform/k3s/uptime-kuma/variables.tf
variable "name" {
  default = "up-kuma"
}
variable "namespace" {
  default = "kuma"
}
variable "create_namespace" {
  default = true
}
variable "chart_repo" {
  default = "https://dirsigler.github.io/uptime-kuma-helm"
}
variable "chart" {
  default = "uptime-kuma"
}
variable "values_file_location" {
  default = "./values/values.yaml"
}
variable "vault_addr" {
  sensitive = true
}
variable "vault_token" {
  sensitive = true
}