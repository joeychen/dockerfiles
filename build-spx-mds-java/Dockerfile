#
# DESCRIPTION:	  Create a container with prerequisites to bulid spx and running mds
# 

FROM ubuntu:16.04
LABEL maintainer="Joey Chen <joeychen.zh@gmail.com>"

ENV TERM=$xterm

# make the "en_US.UTF-8" locale
RUN apt-get update && \
	apt-get -y install locales && \
	rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# make /bin/sh symlink to bash instead of dash
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure dash

# installing SPX related packages
RUN dpkg --add-architecture i386
RUN apt-get update && \
	apt-get -y install \
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

# build vncserver                                                                                                                                                                        
RUN apt-get update && \                                                                                                                                                                  
    apt-get -y install autoconf automake libtool pkg-config 

# download 
RUN apt-get -y install wget

# install additional packages required for nodejs
RUN npm i -gq grunt-cli bower coveralls && \
	npm install -g beautifier --save-dev && \
	ln -s /usr/bin/nodejs /usr/bin/node

ENV PATH $PATH:/usr/local/lib/python2.7/dist-packages

#  generating RSA key pair for enc image
RUN openssl genrsa -out /private.pem && \
	openssl rsa -in /private.pem -outform PEM -pubout -out /public.pem 

# avoid ttyname failed message
RUN sed -i 's/mesg n/test -t 0 \&\& mesg n/' /root/.profile

# download and install Oracle Java
# http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html  
# webupd8team/java PPA is DISCONTINUED
ENV JAVA_VERSION_MAJOR=8
ENV JAVA_VERSION_MINOR=231
ENV JAVA_VERSION_BUILD=11
ENV JAVA_DOWNLOAD_HASH=5b13a193868b4bf28bcb45c792fce896

RUN mkdir -p /usr/lib/jvm \
    && cd /usr/lib/jvm \
    && wget -nv --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_DOWNLOAD_HASH}/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    && tar xf jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    && rm jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    && update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/bin/java" 1


RUN apt-get update && apt-get install -y libgtk2.0-0 libcanberra-gtk-module

ENTRYPOINT ["/bin/bash", "-l", "-c"]
