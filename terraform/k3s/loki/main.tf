resource "helm_release" "loki_logs" {
  name             = var.release_name
  create_namespace = true
  namespace        = var.release_name
  chart            = "./loki-stack"

  values = [
    "${file("values-loki.yml")}"
  ]
  set {
    name = "config.lokiAddress"
    value = "http://${var.release_name}:3100/loki/api/v1/push"
  }
}