FROM ubuntu:16.04

MAINTAINER Xavi Torelló <info@gnuites.cat>

ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    bcrypt \
    python3.6-dev \
    python3-pip \
    libbson-dev \
    libsasl2-dev \
    build-essential \
    libssl-dev \
    mongodb \

    && rm -rf /var/lib/apt/lists/*


ENV ORAKWLUM_BACKEND_VERSION 1.0.0

RUN mkdir /tmp/todel && cd /tmp/todel

RUN wget https://github.com/mongodb/mongo-c-driver/releases/download/1.5.0/mongo-c-driver-1.5.0.tar.gz --no-check-certificate \
    && tar xfzp mongo-c-dr*

RUN cd mongo-c-driver* \
    && ./configure --enable-ssl=yes --enable-sasl=yes \
    && make \
    #&& make test \
    && make install \
    && ln -s /usr/local/lib/lib* /usr/lib/

RUN ln -s /usr/bin/python3.6 /usr/bin/python

RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip

RUN pip install setuptools

RUN pip install monary==0.5.0
