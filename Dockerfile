FROM rust:slim
LABEL org.opencontainers.image.source="https://github.com/pgoodall/mutex_lab"
# Install the development dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential curl git libssl-dev pkg-config make \
    clang lld sudo emacs zsh locales && apt-get clean && rm -rf /var/lib/apt/lists/*
# Create a non-root user
ENV USER_NAME=vscode
RUN useradd -m $USER_NAME -s /usr/bin/zsh
USER $USER_NAME
# Install nightly toolchain and rustfmt for it and the stable version
RUN rustup toolchain install stable --component rustfmt && rustup component add rustfmt \
    && cargo install cargo-edit cargo-update cargo-audit cargo-udeps && mkdir -p /home/$USER_NAME/workspace
COPY configs/.zshrc configs/.zsh_aliases /home/$USER_NAME/
USER root
RUN echo "$USER_NAME ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/$USER_NAME && \
    echo "en_GB.UTF-8 UTF-8" > /etc/locale.gen && locale-gen && update-locale
# Delete all the cargo cache and the apt cache
RUN apt remove -y locales && rm -rf /usr/local/cargo/registry && apt-get clean