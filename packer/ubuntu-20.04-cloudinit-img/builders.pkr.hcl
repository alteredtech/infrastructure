build {
  sources = ["source.proxmox.ubuntu-2004"]

  provisioner "shell" {
    execute_command = "echo 'packer' | sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/setup.sh"
  }

  provisioner "ansible" {
    extra_arguments = [
      "-v",
    "-e ansible_ssh_pass=${local.ssh_password} VAULT_ADDR='${var.vault_addr}' VAULT_TOKEN='${var.vault_token}' ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'"]
    ansible_env_vars = ["ANSIBLE_CONFIG=playbook/ansible.cfg"]
    playbook_file    = "./playbook/${var.ansible_play}.yml"
    use_proxy        = false
  }
  post-processor "shell-local" {
    inline = ["echo ${var.template_name}"]
  }
}
