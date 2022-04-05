#---- ./terraform/modules/helm-tf/variables.tf
variable "name" {
  description = "Release name."
}
variable "namespace" {
  default     = "default"
  description = "The namespace to install the release into."
}
variable "create_ns" {
  default     = false
  description = "Create the namespace if it does not yet exist."
}
variable "chart_repo" {
  description = "Repository URL where to locate the requested chart."
}
variable "chart_name" {
  description = "Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. It is also possible to use the <repository>/<chart> format here if you are running Terraform on a system that the repository has been added to with helm repo add but this is not recommended."
}
variable "chart_version" {
  description = "Specify the exact chart version to install. If this is not specified, the latest version is installed."
}
variable "set_values" {
  description = "Value block with custom values to be merged with the values yaml."
}
variable "set_sensitive_values" {
  description = "Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff."
}
variable "repository_key_file" {
  description = "The repositories cert key file."
}
variable "repository_cert_file" {
  description = " The repositories cert file."
}
variable "repository_ca_file" {
  description = "The Repositories CA File."
}
variable "repository_username" {
  description = "Username for HTTP basic authentication against the repository."
}
variable "repository_password" {
  description = "Password for HTTP basic authentication against the repository."
}
variable "devel" {
  description = "Use chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored."
}
variable "verify" {
  default     = false
  description = "Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart."
}
variable "keyring" {
  default     = "/.gnupg/pubring.gpg"
  description = "Location of public keys used for verification. Used only if verify is true."
}
variable "timeout" {
  default     = 300
  description = "Time in seconds to wait for any individual kubernetes operation."
}
variable "disable_webhooks" {
  default     = false
  description = "Prevent hooks from running"
}
variable "reuse_values" {
  default     = false
  description = "When upgrading, reuse the last release's values and merge in any overrides. If 'reset_values' is specified, this is ignored."
}
variable "reset_values" {
  default     = false
  description = "When upgrading, reset the values to the ones built into the chart."
}
variable "force_update" {
  default     = false
  description = "Force resource update through delete/recreate if needed."
}
variable "recreate_pods" {
  default     = false
  description = "Perform pods restart during upgrade/rollback."
}
variable "cleanup_on_fail" {
  default     = false
  description = "Allow deletion of new resources created in this upgrade when upgrade fails."
}
variable "max_history" {
  default     = 0
  description = "Maximum number of release versions stored per release. "
}
variable "atomic" {
  default     = false
  description = "If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used."
}
variable "skip_crds" {
  default     = false
  description = "If set, no CRDs will be installed. By default, CRDs are installed if not already present."
}
variable "render_subchart_notes" {
  default     = true
  description = "If set, render subchart notes along with the parent."
}
variable "disable_openapi_validation" {
  default     = false
  description = "If set, the installation process will not validate rendered templates against the Kubernetes OpenAPI Schema."
}
variable "wait" {
  default     = true
  description = "Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout"
}
variable "wait_for_jobs" {
  default     = false
  description = "If wait is enabled, will wait until all Jobs have been completed before marking the release as successful. It will wait for as long as timeout."
}
variable "dependency_update" {
  default     = false
  description = "Runs helm dependency update before installing the chart."
}
variable "replace" {
  default     = false
  description = "Re-use the given name, only if that name is a deleted release which remains in the history. This is unsafe in production."
}
variable "description" {
  description = "Set release description attribute (visible in the history)."
}
variable "postrender" {
  description = "Configure a command to run after helm renders the manifest which can alter the manifest contents."
}
variable "lint" {
  default     = false
  description = "Run the helm chart linter during the plan."
}
