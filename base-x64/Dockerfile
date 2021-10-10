FROM debian:bookworm-slim

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install --yes --fix-broken \
        curl \
        git \
        gnupg \
        htop \
        locales \
        python3 \
        python3-pip \
        sudo \
        tig \
        tmate \
        unzip \
        vim \
        wget \
        zsh

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN chmod a+rx /root

RUN cd $(mktemp -d) \
    && git clone https://github.com/mihaigalos/config.git \
    && cd config \
    && ./setup_oh_my_zsh.sh \
    && ./setup_vim.sh

RUN wget https://raw.githubusercontent.com/mihaigalos/utils/master/url-install/url-install.sh \
    && chmod a+x url-install.sh \
    && mv url-install.sh /usr/bin/url-install \
    && mkdir -p ~/.local/bin \
    && PATH=~/.local/bin:$PATH

RUN cd $(mktemp -d) \
    && wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz \
    && tar -xvf *.tar.xz \
    && mv tmate-2.4.0-static-linux-amd64/tmate /usr/bin/ \
    && chmod +x /usr/bin/tmate

RUN url-install \
    https://github.com/sharkdp/bat/releases/download/v0.16.0/bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz \
    https://github.com/dandavison/delta/releases/download/0.4.4/delta-0.4.4-x86_64-unknown-linux-gnu.tar.gz \
    https://github.com/Byron/dua-cli/releases/download/v2.10.2/dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz \
    https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip \
    https://github.com/XAMPPRocky/tokei/releases/download/v12.0.4/tokei-x86_64-unknown-linux-gnu.tar.gz \
    https://github.com/beefsack/webify/releases/download/v1.5.0/webify-v1.5.0-linux-amd64.tar.gz

COPY .gitconfig /root

RUN cp /root/.zshrc /etc/zsh/zshrc \
    && echo '[ ! -f "/home/$USER/.gitconfig" ] && ln -s /root/.gitconfig /home/$USER/' >> /etc/zsh/zshrc \
    && echo '[ ! -f "/home/$USER/.vimrc" ] && ln -s /root/.vimrc /home/$USER' >> /etc/zsh/zshrc \ \
    && echo '[ ! -d "/home/$USER/.vim" ] && ln -s /root/.vim /home/$USER' >> /etc/zsh/zshrc

RUN mkdir -p /src
WORKDIR /src

CMD /bin/zsh