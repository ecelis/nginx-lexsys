#!/bin/bash
OS_VERSION=$(cat /etc/redhat-release)
NHMTAG=v0.31
NHMURL=https://github.com/openresty/headers-more-nginx-module/releases/tag/${NHMTAG}
if [[ $OS_VERSION == *" 7."* ]]; then
  NGINXRPM=nginx-1.10.1-1.el7.ngx.src.rpm
  RPMURL=http://nginx.org/packages/centos/7/SRPMS/
elif [[ $OS_VERSION == *" 6."* ]]; then
  NGINXRPM=nginx-1.10.1-1.el6.ngx.src.rpm
  RPMURL=http://nginx.org/packages/centos/6/SRPMS/
fi
cd /root
yum -y install epel-release
yum -y update
yum install -y openssl-devel zlib-devel pcre-devel rpm-build make gcc \
       perl-devel perl-ExtUtils-Embed GeoIP GeoIP-devel libxslt libxslt-devel \
       gd gd-devel which
  curl -LO $RPMURL/$NGINXRPM
rpm -Uvh $NGINXRPM
cd /root/rpmbuild/SOURCES
curl -LO "${NHMURL}"
