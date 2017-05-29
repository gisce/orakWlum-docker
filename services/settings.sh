socket_path="/tmp/okw_api"
sockets="-v $socket_path:/tmp/"
base_logs="/var/log/orakwlum"

# Frontend conf
frontend_image="okw/frontend"
frontend_container="frontend"
frontend_ports_mapping="-p 80:80 -p 443:443"
frontend_pid=$socket_path/$frontend_container.pid
frontend_logs_destination="$base_logs/frontend"
frontend_logs="-v $frontend_logs_destination:/var/log/orakwlum"

# API conf
API_image="okw/api:latest"
API_container="api"
API_pid=$socket_path/$API_container.pid
API_logs_destination="$base_logs/api"
API_logs="-v $API_logs_destination:/var/log/orakwlum"
