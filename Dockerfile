FROM centos:6.8
MAINTAINER <adam@cluebyfour.ca>

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN yum -y update && yum -y install wget glibc.i686 libgcc.i686 sudo && yum clean all
RUN useradd -d /home/steam -m steam

# deploy configuration files
RUN mkdir /deploy
COPY . /deploy/
RUN chmod +x /deploy/startcsgo

# defaults
EXPOSE 27015 27015/udp 27005/udp 27020/udp
VOLUME ["/home/steam"]
CMD ["/deploy/startcsgo"]
