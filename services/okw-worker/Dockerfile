FROM python:3.6-slim-jessie
ARG ORAKWLUM_VERSION=master

RUN # "=========Installing oraKWlum API v$ORAKWLUM_API_VERSION=========="

# Get oKW
RUN apt-get update && apt-get install -y --no-install-recommends\
    ssh \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Add required SSH pubkey from HOST
RUN mkdir -p ~/.ssh
ADD ssh/id_rsa.pub /root/.ssh/id_rsa.pub
ADD ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa*

# Fetch github footprint
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

# Clone repository
WORKDIR /opt
RUN git clone -b $ORAKWLUM_VERSION --depth 1 git@github.com:gisce/orakWlum.git 

# Delete ssh key
RUN rm /root/.ssh/id_rsa*

WORKDIR /opt/orakWlum

# Install python requirements from api repository
RUN pip install -r /opt/orakWlum/requirements.txt
RUN pip install -r /opt/orakWlum/requirements-dev.txt

# Start worker
CMD rq worker -c worker_settings
