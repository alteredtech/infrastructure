worker_processes 4;
worker_rlimit_nofile 40000;

events {
    worker_connections 8192;
}

stream {
    upstream rancher_servers_http {
        least_conn;
        %{for key, value in worker_nodes ~}
        server ${value}:80 max_fails=3 fail_timeout=5s;
        %{endfor ~}
    }
    server {
        listen 80;
        proxy_pass rancher_servers_http;
    }

    upstream rancher_servers_https {
        least_conn;
        %{for key, value in worker_nodes ~}
        server ${value}:443 max_fails=3 fail_timeout=5s;
        %{endfor ~}
    }
    server {
        listen     443;
        proxy_pass rancher_servers_https;
    }

}