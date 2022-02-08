[master]
%{for key, value in master_nodes ~} 
${key} ansible_host=${value} ansible_ssh_user=packer ansible_python_interpreter=/usr/bin/python3
%{endfor ~}

[node]
%{for key, value in worker_nodes ~}
${key} ansible_host=${value} ansible_ssh_user=packer ansible_python_interpreter=/usr/bin/python3
%{endfor ~}

[loadbalancer]
lb-1 ansible_host=10.0.2.20

[k3s_cluster:children]
master
node