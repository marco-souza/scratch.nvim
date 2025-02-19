# Dockerfile to setup nvim in the latest version
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    git \
    zig \
    neovim \
    nodejs \
    npm;

CMD ["/bin/bash"]
