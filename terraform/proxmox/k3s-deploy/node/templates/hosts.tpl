all:
  children:
    master:
      hosts:
    %{for key, value in master_nodes ~}
        ${key}:
          ansible_host: ${value}
          ansible_ssh_user: packer
    %{endfor ~}
    workers:
      hosts:
    %{for key, value in worker_nodes ~}
        ${key}:
          ansible_host: ${value}
          ansible_ssh_user: packer
    %{endfor ~}