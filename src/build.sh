#!/bin/bash
OS_VERSION=$(cat /etc/redhat-release)
cd /root/rpmbuild/SPECS
cp nginx.spec nginx.spec.orig
patch -p0 < /vagrant/nginx.spec.patch
rpmbuild -ba nginx.spec
cp /root/rpmbuild/SRPMS/*.rpm /mnt/out
cp /root/rpmbuild/RPMS/x86_64/*.rpm /mnt/out
