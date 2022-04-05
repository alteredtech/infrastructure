locals {
  set_sensitive_values = [{
    name  = "runnerRegistrationToken"
    value = "${data.vault_generic_secret.gitlab_runner.data["runner-token"]}"
    type  = "auto"
  }]
}