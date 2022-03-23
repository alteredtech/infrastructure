resource "helm_release" "uptime_kuma" {
  name             = "up-kuma"
  create_namespace = true
  namespace        = "kuma"
  repository       = "https://dirsigler.github.io/uptime-kuma-helm"
  chart            = "uptime-kuma"

  values = [
    "${file("values-kuma.yml")}"
  ]
}