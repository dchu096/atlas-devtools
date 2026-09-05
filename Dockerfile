# Axis DevTools sidecar — allowlisted tooling only.
# Build: docker build -t ghcr.io/atlas-panel/axis-devtools:1 -f devtools/Dockerfile devtools
FROM alpine:3.20

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    gzip \
    jq \
    less \
    nano \
    openssh-client \
    tar \
    unzip \
    vim \
    wget \
    && rm -rf /var/cache/apk/*

# Non-root friendly; Axis remaps to the configured pterodactyl/axis UID at runtime.
WORKDIR /home/container

# Keep a usable interactive shell; security comes from Axis mount flags + CapDrop.
ENV HOME=/home/container \
    TERM=xterm-256color

CMD ["/bin/bash", "-l"]
