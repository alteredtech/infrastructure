module "helm_release" {
  source               = "../../modules/helm-tf"
  name                 = var.name
  namespace            = var.namespace
  create_namespace     = var.create_namespace
  chart_repo           = var.chart_repo
  chart                = var.chart
  values_file_location = var.values_file_location
}