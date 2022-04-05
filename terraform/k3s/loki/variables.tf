#---- terraform/k3s/loki/variables.tf
variable "name" {
  default = "loki"
}
variable "namespace" {
  default = "loki"
}
variable "create_namespace" {
  default = true
}
variable "chart" {
  default = "./loki-stack"
}
variable "values_file_location" {
  default = "./values/values.yaml"
}
variable "set_values" {
  default = [{
    name  = "config.lokiAddress"
    value = "http://{{ .Release.Name }}:3100/loki/api/v1/push"
    type  = "auto"
  }]
}

