FROM okw/api
ARG ORAKWLUM_API_VERSION=master

RUN apt update && apt install -y vim 

WORKDIR /opt/orakWlum-api

RUN echo "uwsgi --ini config/api.ini --py-autoreload" > start.sh

CMD bash
