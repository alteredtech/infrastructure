#---- terraform/k3s/gitlab-runner/variables.tf
variable "name" {
  default = "gitlab-runner"
}
variable "namespace" {
  default = "runner"
}
variable "create_namespace" {
  default = true
}
variable "chart_repo" {
  default = "https://charts.gitlab.io"
}
variable "chart" {
  default = "gitlab-runner"
}
variable "chart_version" {
  default = "0.38.1"
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