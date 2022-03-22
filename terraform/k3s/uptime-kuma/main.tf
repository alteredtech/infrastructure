resource "helm_release" "uptime_kuma" {
  name             = "up-kuma"
  create_namespace = true
  namespace        = "kuma"
  repository       = "https://dirsigler.github.io/uptime-kuma-helm"
  chart            = "uptime-kuma"
  // version          = "2.5.8"

  values = [
    "${file("values-kuma.yml")}"
  ]
  // set {
  //   name  = "adminPassword"
  //   value = local.pihole_pass
  // }
}