resource "helm_release" "prometheus-monitoring" {
  name             = "prom-monitor"
  create_namespace = true
  namespace        = "monitor-prom"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "33.2.0"

  values = [
    "${file("values-test.yml")}"
  ]
}