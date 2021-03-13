ARG VERSION

FROM bitnami/minideb:${VERSION}

# Set Environment Variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV HOME="/root" \
  LANGUAGE="en_GB.UTF-8" \
  LANG="en_GB.UTF-8" \
  TERM="xterm"

RUN \
  ## Operating System Tools
  install_packages \
    apt-transport-https \
    apt-utils \
    bash \
    ca-certificates \
    curl \
    lsb-release \
    locales \
    tzdata \
    wget && \
  ## Generate Locales
  locale-gen en_GB.UTF-8 && \
  ## Application User & Default Directories
  useradd -u 911 -U -d /config -s /bin/false xyz && \
  usermod -G users xyz && \
  mkdir -p \
    /app \
    /config \
    /defaults && \
  ## Generate Version File
  echo "${VERSION}" > VERSION

# Add Local Files
COPY root/ /

ENTRYPOINT ["/init"]
