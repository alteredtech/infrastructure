resource "helm_release" "pi_hole" {
  name             = "pi-hole"
  create_namespace = true
  namespace        = "pihole"
  repository       = "https://mojo2600.github.io/pihole-kubernetes/"
  chart            = "pihole"
  version          = "2.5.8"

  values = [
    "${file("values-backup.yml")}"
  ]
  set {
    name  = "adminPassword"
    value = local.pihole_pass
  }
}