FROM centos:latest
MAINTAINER Ernesto Celis <ernesto@tic.uno>

COPY src /
# rpmbuild command recommends to use `builder:builder` as user:group.
RUN yum -y install epel-release ; \
  yum -y update ; \
  yum install -y openssl-devel zlib-devel pcre-devel rpm-build make gcc \
     perl-devel perl-ExtUtils-Embed GeoIP GeoIP-devel libxslt libxslt-devel \
     gd gd-devel which ; \
  useradd -u 1000 builder ; \
  chmod a+x /build.sh

WORKDIR /home/builder
USER builder
