events {}

stream {
  upstream external_services {
    %{for key, value in worker_nodes ~}
    server ${value}:443;
    %{endfor ~}
    
    %{for key, value in worker_nodes ~}
    server ${value}:80;
    %{endfor ~}
  }

  server {
    listen 443;
    listen 80;
    proxy_pass external_services;
  }
}