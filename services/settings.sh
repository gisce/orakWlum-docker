socket_path="/tmp/okw_api"
sockets="-v $socket_path:/tmp/"
base_logs="/var/log/orakwlum"
base_csvs="/var/data/orakwlum"

# Frontend conf
frontend_image="okw/frontend"
frontend_container="frontend"
frontend_ports_mapping="-p 80:80 -p 443:443"
frontend_pid=$socket_path/$frontend_container.pid
frontend_logs_destination="$base_logs/frontend"
frontend_logs="-v $frontend_logs_destination:/var/log/orakwlum"

# API conf
API_image="okw/api"
API_container="api"
API_pid=$socket_path/$API_container.pid
API_logs_destination="$base_logs/api"
API_logs="-v $API_logs_destination:/var/log/orakwlum"
API_csvs_destination="$base_csvs/csv"
API_csvs="-v $API_csvs_destination:/var/data/orakwlum/csv"

# Worker conf
HOW_MANY_WORKERS=2
WORKER_image="okw/worker"
WORKER_container="worker"
WORKER_pid=$socket_path/$WORKER_container.pid
WORKER_logs_destination="$base_logs/worker"
WORKER_logs="-v $WORKER_logs_destination:/var/log/orakwlum"
