ARG APP_VERSION
ARG DEBIAN_FRONTEND="noninteractive"

FROM bitnami/minideb:${APP_VERSION}

ENV HOME="/root" \
  LANGUAGE="en_GB.UTF-8" \
  LANG="en_GB.UTF-8" \
  TERM="xterm"

RUN \
  install_packages \
    apt-transport-https \
    apt-utils \
    bash \
    ca-certificates \
    curl \
    lsb-release \
    locales \
    tzdata \
    unzip \
    wget \
    zip && \
  locale-gen en_GB.UTF-8 && \
  useradd -u 911 -U -d /config -s /bin/false xyz && \
  usermod -G users xyz && \
  mkdir -p \
    /app \
    /config \
    /defaults

COPY root/ /

ENTRYPOINT ["/init"]
