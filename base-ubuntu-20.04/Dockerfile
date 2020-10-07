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
