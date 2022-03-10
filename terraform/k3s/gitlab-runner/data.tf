data "vault_generic_secret" "gitlab_runner" {
  path = "kv/gitlab-runner"
}