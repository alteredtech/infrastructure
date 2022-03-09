resource "helm_release" "vault" {
  name             = "vault"
  create_namespace = true
  namespace        = "vault"
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "vault"
  version          = "v0.19.0"

  values = [
    "${file("values-vault.yml")}"
  ]

}
// vault write auth/kubernetes/role/internal-app \
//     bound_service_account_names=internal-app \
//     bound_service_account_namespaces=* \
//     policies=internal-app \
//     ttl=24h