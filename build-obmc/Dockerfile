#
# DESCRIPTION:	  Create a container with prerequisites to bulid openbmc
# 
FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yy \
    	build-essential \
    	chrpath \
		cpio \
      	debianutils \
      	diffstat \
      	file \
      	gawk \
      	git \
      	iputils-ping \
      	libdata-dumper-simple-perl \
      	liblz4-tool \
      	libsdl1.2-dev \
      	libthread-queue-any-perl \
      	locales \
      	python3 \
      	socat \
      	subversion \
      	texinfo \
      	vim \
      	wget \
      	zstd \
      	screen

RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd --user-group --create-home --no-log-init --shell /bin/bash baker
USER baker
WORKDIR /home/baker
