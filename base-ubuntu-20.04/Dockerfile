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

RUN wget https://raw.githubusercontent.com/mihaigalos/utils/master/url-install/url-install.sh
RUN chmod a+x url-install.sh
RUN mv url-install.sh /usr/bin/url-install

RUN url-install https://github.com/sharkdp/bat/releases/download/v0.16.0/bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz
RUN url-install https://github.com/dandavison/delta/releases/download/0.4.4/delta-0.4.4-x86_64-unknown-linux-gnu.tar.gz
RUN url-install https://github.com/Byron/dua-cli/releases/download/v2.10.2/dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz
RUN url-install https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
RUN url-install https://github.com/XAMPPRocky/tokei/releases/download/v12.0.4/tokei-x86_64-unknown-linux-gnu.tar.gz

COPY .gitconfig /root
