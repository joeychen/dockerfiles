#
# DESCRIPTION: 
# 

FROM centos:centos6
LABEL maintainer="joeychen"

RUN yum -y update; yum clean all
RUN yum -y groupinstall 'Development Tools'; yum clean all
RUN yum -y install openssl-devel

ENTRYPOINT ["/bin/bash", "-l", "-c"]
