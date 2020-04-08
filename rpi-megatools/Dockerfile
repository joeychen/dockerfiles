#
# DESCRIPTION: A megatools image build from git for raspberry pi  
# 
FROM arm32v7/debian:latest
LABEL maintainer="joeychen"

COPY qemu-arm-static /usr/bin/

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \ 
    apt-get install -y \
    build-essential libglib2.0-dev libssl-dev \
    libcurl4-openssl-dev \
    wget \
    curl \
    git \
    meson

RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*

RUN git clone https://megous.com/git/megatools && \
    cd megatools && \
    meson b && \
    ninja -C b && \
    ninja -C b install


