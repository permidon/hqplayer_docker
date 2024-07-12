FROM fedora:39
ENV GMPRIS_VERSION="2.2.1-7"
ENV HQPLAYERD_VERSION="5.6.3-20"
RUN dnf install wget -y 
RUN wget https://www.sonarnerd.net/src/fc39/libgmpris-${GMPRIS_VERSION}.fc39.x86_64.rpm https://www.signalyst.eu/bins/hqplayerd/fc39/hqplayerd-${HQPLAYERD_VERSION}.fc39.x86_64.rpm
RUN yum install -y ./libgmpris-${GMPRIS_VERSION}.fc39.x86_64.rpm ./hqplayerd-${HQPLAYERD_VERSION}.fc39.x86_64.rpm
RUN hqplayerd -s hqplayer hqplayer
ENV HOME="/var/lib/hqplayer/home"
ENTRYPOINT ["/usr/bin/hqplayerd"]
