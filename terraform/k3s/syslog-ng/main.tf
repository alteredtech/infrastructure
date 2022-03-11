resource "helm_release" "syslog" {
  name             = "syslog-ng"
  namespace = "syslog-forwarder"
  create_namespace = true
  chart            = "../../../helm/syslog-ng"
  version          = "0.2"

  values = [
    "${file("values-syslog.yaml")}"
  ]
}