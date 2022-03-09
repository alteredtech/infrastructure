resource "helm_release" "nfs_subdir" {
  name       = "nfs-subdir"
  repository = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner"
  chart      = "nfs-subdir-external-provisioner"
  version    = "4.0.16"

  values = [
    "${file("values-nfs-subdir.yml")}"
  ]

}