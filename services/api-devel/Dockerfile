FROM okw/api
ARG ORAKWLUM_API_VERSION=master
ARG ESIOS_TOKEN=none

ENV ESIOS_TOKEN=$ESIOS_TOKEN

RUN apt update && apt install -y vim telnet mongodb-clients iputils-ping

WORKDIR /opt/orakWlum-api

RUN echo "uwsgi --ini config/api.ini --py-autoreload 1" > start.sh

#CMD bash start.sh

ENTRYPOINT bash /opt/orakWlum-api/start.sh
