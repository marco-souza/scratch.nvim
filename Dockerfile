# Dockerfile to setup nvim in the latest version
FROM alpine:latest

WORKDIR /root/.config/nvim

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    git \
    zig \
    neovim \
    ripgrep \
    lua-language-server \
    nodejs \
    npm;

CMD ["/bin/bash"]
