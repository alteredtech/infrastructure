locals {
  runner_token = sensitive("${data.vault_generic_secret.gitlab_runner.data["runner-token"]}")
}