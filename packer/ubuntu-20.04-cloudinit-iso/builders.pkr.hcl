build {
  sources = ["source.proxmox.ubuntu-2004"]

  provisioner "shell" {
    execute_command = "echo '${local.ssh_password}' | sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/setup.sh"
  }

  provisioner "ansible" {
    extra_arguments = [
      "-v",
    "-e ansible_ssh_pass=${local.ssh_password} ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'"]
    ansible_env_vars = ["ANSIBLE_CONFIG=playbook/ansible.cfg"]
    playbook_file    = "./playbook/${var.ansible_play}.yml"
    use_proxy        = false
  }
  post-processor "shell-local" {
    inline = ["echo ${var.template_name}"]
  }
}