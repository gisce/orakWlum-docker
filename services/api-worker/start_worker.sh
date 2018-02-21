celery -A orakwlum.workers.celery worker -f /var/log/orakwlum/worker.log -l INFO --concurrency 1
