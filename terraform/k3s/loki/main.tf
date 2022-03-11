resource "helm_release" "loki_logs" {
  name             = "loki"
  create_namespace = true
  namespace        = "loki"
  // repository       = "https://grafana.github.io/helm-charts"
  // chart            = "loki-stack"
  chart = "../../k3s/loki-stack"
  // version          = "2.6.1"

  values = [
    "${file("values-loki.yml")}"
  ]
}