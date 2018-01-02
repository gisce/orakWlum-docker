FROM orakwlum/orakwlum-base:1.0.0

ARG ORAKWLUM_API_VERSION=master

RUN # "=========Installing oraKWlum API v$ORAKWLUM_API_VERSION=========="

# Get oKW
RUN apt-get update && apt-get install -y --no-install-recommends\
    ssh \
    git \
    && rm -rf /var/lib/apt/lists/*

# Add required SSH pubkey from HOST
RUN mkdir -p ~/.ssh
ADD ssh/id_rsa.pub /root/.ssh/id_rsa.pub
ADD ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa*

# Fetch github footprint
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

# Clone repository
WORKDIR /opt/orakWlum-api
RUN git clone -b $ORAKWLUM_API_VERSION --depth 1 git@github.com:gisce/orakWlum-api.git .

# Delete ssh key
RUN rm /root/.ssh/id_rsa*

# Install python requirements from api repository
RUN pip install -r /opt/orakWlum-api/requirements.txt
RUN pip install -r /opt/orakWlum-api/requirements-dev.txt

# Ensure py-bcrypt is not corrupted by flask
RUN pip uninstall -y py-bcrypt && pip install py-bcrypt

# "Set Environment Vars"
ENV PATHH=/opt/orakWlum-api PROCESSES=20 SOCKET="-s /tmp/orakwlum-api.sock"

#EXPOSE 5000

# Run the API! when starting the container
RUN chmod +x /opt/orakWlum-api/utils/start_api_server.sh
CMD /opt/orakWlum-api/utils/start_api_server.sh