databases:
  hosts:
%{for key, value in database_nodes ~}
    ${key}:
      ansible_host: ${value}
      ansible_ssh_user: packer
%{endfor ~}
