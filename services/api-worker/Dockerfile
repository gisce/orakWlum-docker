FROM okw/api
ARG ORAKWLUM_API_VERSION=master

WORKDIR /opt/orakWlum-api
ADD start_worker.sh /opt/orakWlum-api/utils/start_worker.sh
RUN chmod +x /opt/orakWlum-api/utils/start_worker.sh
CMD /opt/orakWlum-api/utils/start_worker.sh
