FROM ubuntu:noble

ENV GMPRIS_VERSION="2.2.1-11"
ENV LIBSOUP_VERSION="3.4.4-1"
ENV HQPLAYERD_VERSION="5.14.0-40"

RUN apt update \
  && apt install -y curl udev sudo \
  && mkdir -p /etc/udev/rules.d \
  && mkdir -p /etc/sudoers.d \
  && curl -O https://www.sonarnerd.net/src/noble/libgmpris_2.2.1-12_amd64.deb \
  && curl -O https://www.sonarnerd.net/src/noble/libgupnp-1.6-0_1.6.6-2_amd64.deb \
  && curl -O https://www.signalyst.eu/bins/hqplayerd/noble/hqplayerd_5.14.0-40intel_amd64.deb \
  && ls -la *.deb \
  && apt install -y ./libgmpris_2.2.1-12_amd64.deb \
    ./libgupnp-1.6-0_1.6.6-2_amd64.deb \
    ./hqplayerd_5.14.0-40intel_amd64.deb \
  && rm -f *.deb \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN hqplayerd -s hqplayer hqplayer

ENV HOME="/var/lib/hqplayer/home"

ENTRYPOINT ["/usr/bin/hqplayerd"]
