#
# DESCRIPTION:	  Create a container with prerequisites to bulid spx 
# 

FROM ubuntu:16.04

# make /bin/sh symlink to bash instead of dash
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure dash

# installing SPX related packages
RUN dpkg --add-architecture i386
RUN apt-get update \
	&& apt-get -y install \
		bc \
		curl \
		gcc-multilib \
		mtd-utils \
		subversion \
		patch \
		patchutils \
		bison \
		libc6-dev \
		libxml-dom-perl \
		zlib1g \
		zlib1g-dev \
		libcurl4-openssl-dev \
		libncurses5:i386 \
		python-numpy \
		doxygen \
		python-apt \
		dmsetup \
		python-svn \
		libpcre3-dev \
		netpbm \
		sqlite3 \
		gawk \
		graphviz \
		nodejs \
		npm \
		luajit \
		php7.0-cli \
		python-dev \
		coreutils \
		openssl \
		libc6:i386 \
		zlib1g:i386

# make the "en_US.UTF-8" locale
RUN apt-get -y install locales \
	&& rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# install additional packages required for Node.js�n
RUN npm i -gq grunt-cli bower coveralls && \
	npm install -g beautifier --save-dev && \
	ln -s /usr/bin/nodejs /usr/bin/node

ENTRYPOINT ["/bin/bash", "-l", "-c"]
