# What is this spec?

[Nginx](http://nginx.org) with [headers-more-module](http://wiki.nginx.org/NginxHttpHeadersMoreModule)

You can build SRPM and RPM with headers-more-module using the official SRPM.


#### Dependencies

If you plan to build in a running CentOS 7 system, install the following
dependencies first.


    yum install -y openssl-devel zlib-devel pcre-devel rpm-build make gcc \
      perl-devel perl-ExtUtils-Embed GeoIP GeoIP-devel libxslt libxslt-devel \
      gd gd-devel which

#### Build


    /bootstrap.sh ; /build.sh


#### Build RPM in a Docker container


    git clone git@github.com:ecelis/nginx-headers-more.git
    cd nginx-headers-more
    docker build -t ecelis/nginx:`date +%F` centos:latest .
    docker run -ti -v $(pwd):/mnt ecelis/nginx:`date +%F` bash
    ./build.sh


RPM packages will be put in `/mnt/out` directory.

