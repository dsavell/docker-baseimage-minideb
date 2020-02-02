FROM bitnami/minideb:buster

# Set Environment Variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/root" \
  LANGUAGE="en_GB.UTF-8" \
  LANG="en_GB.UTF-8" \
  TERM="xterm"

RUN \
  ## Application User & Default Directories
  useradd -u 911 -U -d /config -s /bin/false xyz && \
  usermod -G users xyz && \
  mkdir -p \
    /app \
    /config \
    /defaults && \
  ## Operating System Tools
  install_packages \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    cron \
    curl \
    locales \
    lsb-release \
    tzdata \
    unzip \
    vim \
    wget && \
  ## Generate Locales
  locale-gen en_GB.UTF-8
