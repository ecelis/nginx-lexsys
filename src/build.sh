#!/bin/bash

OS_VERSION=$(cat /etc/redhat-release)
NHMTAG=v0.31
NHMURL=https://github.com/openresty/headers-more-nginx-module/archive/${NHMTAG}.tar.gz
if [[ $OS_VERSION == *" 7."* ]]; then
  NGINXRPM=nginx-1.10.1-1.el7.ngx.src.rpm
  RPMURL=http://nginx.org/packages/centos/7/SRPMS/
elif [[ $OS_VERSION == *" 6."* ]]; then
  NGINXRPM=nginx-1.10.1-1.el6.ngx.src.rpm
  RPMURL=http://nginx.org/packages/centos/6/SRPMS/
fi
curl -LO $RPMURL/$NGINXRPM
rpm -Uvh $NGINXRPM
cd $HOME/rpmbuild/SOURCES
curl -L -o ${NHMTAG}.tar.gz ${NHMURL}

cd $HOME/rpmbuild/SPECS
cp nginx.spec nginx.spec.orig
patch -p0 < /nginx.spec.patch
rpmbuild -ba nginx.spec
#cp /root/rpmbuild/SRPMS/*.rpm /mnt/out
#cp /root/rpmbuild/RPMS/x86_64/*.rpm /mnt/out
