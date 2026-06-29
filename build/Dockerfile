FROM rust:slim
LABEL org.opencontainers.image.source="https://github.com/Digicatic/rust-devcontainer" \
      org.opencontainers.image.description="A Rust development container with the latest stable toolchain and common development tools." \
      org.opencontainers.image.authors="Pete Goodall <pete@digicratic.com>"
# Install the development dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential curl git libssl-dev pkg-config make \
    clang lld sudo emacs zsh locales && apt-get clean && rm -rf /var/lib/apt/lists/*
# Create a non-root user
ENV USER_NAME=vscode
RUN useradd -m $USER_NAME -s /usr/bin/zsh --home /home/$USER_NAME
USER $USER_NAME
# Install stable toolchain and rustfmt for it and the stable version
RUN rustup toolchain install stable --component rustfmt && rustup component add rustfmt \
    && cargo install cargo-edit cargo-update cargo-audit cargo-udeps && mkdir -p /home/$USER_NAME/workspace
COPY configs/.zshrc configs/.zsh_aliases /home/$USER_NAME/
USER root
RUN chown ${USER_NAME}.${USER_NAME} /home/${USER_NAME}/.zsh* && \
echo "en_GB.UTF-8 UTF-8" > /etc/locale.gen && locale-gen && update-locale && \
apt remove -y locales && rm -rf /usr/local/cargo/registry && apt-get clean
USER ${USER_NAME}