events {}

stream {
  upstream k3s_servers {
    %{for key, value in master_nodes ~}
    server ${value}:6443;
    %{endfor ~}
  }

  server {
    listen 6443;
    proxy_pass k3s_servers;
  }
}