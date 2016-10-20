FROM centos:latest
MAINTAINER Ernesto Celis <ernesto@tic.uno>

COPY src /

ENTRYPOINT ["/bin/bash"]

CMD ["./bootstrap.sh ; ./build.sh"]
