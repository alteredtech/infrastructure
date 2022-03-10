resource "helm_release" "gitlab_runner" {
  name             = "gitlab-runner"
  create_namespace = true
  namespace        = "runner"
  repository       = "https://charts.gitlab.io"
  chart            = "gitlab-runner"
  version          = "0.38.1"

  values = [
    "${file("values-runner.yml")}"
  ]
  set {
    name  = "runnerRegistrationToken"
    value = local.runner_token
  }
}