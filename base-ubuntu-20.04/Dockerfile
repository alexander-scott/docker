FROM ubuntu:20.04

RUN apt update 
RUN apt install --assume-yes --fix-broken \
    curl \
    git \
    gnupg \
    htop \
    python3 \
    python3-pip \
    sudo \
    tig \
    unzip \
    vim \
    wget \
    zsh

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/mihaigalos/utils/master/setmeup/setup_oh_my_zsh.sh)"
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/mihaigalos/utils/master/setmeup/setup_vim.sh)"

RUN wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
RUN unzip exa-linux-x86_64-0.9.0.zip
RUN rm exa-linux-x86_64-0.9.0.zip
RUN mv exa-linux-x86_64 /usr/bin/exa

RUN wget https://github.com/Byron/dua-cli/releases/download/v2.10.2/dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz
RUN tar -xvf dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz
RUN rm dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz
RUN mv dua-v2.10.2-x86_64-unknown-linux-musl/dua /usr/bin/dua
RUN rm -rf dua-v2.10.2-x86_64-unknown-linux-musl

RUN wget https://github.com/sharkdp/bat/releases/download/v0.16.0/bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
RUN tar -xvf bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
RUN rm bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
RUN mv bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz/bat /usr/bin/bat
RUN rm -rf bat-v0.16.0-x86_64-unknown-linux-gnu
