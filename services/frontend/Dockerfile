# Use latest node image
FROM node:latest

ARG ORAKWLUM_FRONTEND_VERSION=master

WORKDIR /tmp
# Clone repository
# * Node image already have git so no apt-get install git needed
RUN git clone -b $ORAKWLUM_FRONTEND_VERSION --depth 1 https://github.com/gisce/orakWlum-frontend.git 

WORKDIR /tmp/orakWlum-frontend
# Install node dependencies
RUN npm install

# Build page
RUN chmod +x utils/build.sh
RUN utils/build.sh

# Copy page to nginx output at containter start
CMD rm -fR /orakwlum/*
CMD rm -fR /orakwlum/.*
CMD cp -R . /orakwlum
