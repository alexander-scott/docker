FROM debian:bookworm-slim

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --yes --fix-broken \
        curl \
        git \
        gnupg \
        htop \
        iftop \
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

RUN cd $(mktemp -d) \
    && wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz \
    && tar -xvf *.tar.xz \
    && mv tmate-2.4.0-static-linux-amd64/tmate /usr/bin/ \
    && chmod +x /usr/bin/tmate

RUN wget https://raw.githubusercontent.com/mihaigalos/utils/master/url-install/url-install.sh \
    && chmod a+x url-install.sh \
    && mv url-install.sh /usr/bin/url-install \
    && mkdir -p ~/.local/bin \
    && PATH=~/.local/bin:$PATH

RUN url-install \
        https://github.com/Byron/dua-cli/releases/download/v2.10.2/dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz 16c241b0446b2b8ae8851f3facacd7604fe4193b2c0a545ae07652300f63a1e8  \
        https://github.com/XAMPPRocky/tokei/releases/download/v12.0.4/tokei-x86_64-unknown-linux-gnu.tar.gz 0e0f0d7139c8c7e3ff20cb243e94bc5993517d88e8be8d59129730607d5c631b  \
        https://github.com/beefsack/webify/releases/download/v1.5.0/webify-v1.5.0-linux-amd64.tar.gz acbbe41d4f90044d57e4ebea746344b8632cb54a195a958c2e26cb58742d5403  \
        https://github.com/dandavison/delta/releases/download/0.4.4/delta-0.4.4-x86_64-unknown-linux-gnu.tar.gz 495a64a2fb6c46a19f10606785fea3267d392cebf4987841856b111f195a6f01  \
        https://github.com/imsnif/bandwhich/releases/download/0.20.0/bandwhich-v0.20.0-x86_64-unknown-linux-musl.tar.gz 73416b50baa34d9c3d56958655a789b4697f4f09e6f7ae0e079eb742cce7837b  \
        https://github.com/junegunn/fzf/releases/download/0.27.2/fzf-0.27.2-linux_amd64.tar.gz bfdfbade5e62ef47e2b0707293120ed7829583fdcafe763a5dc904e3e1642271  \
        https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip 53d8746b1ca2d945c5b75767edc83addfd1fe3c4a2b0b766c07172473330a50b  \
        https://github.com/sharkdp/bat/releases/download/v0.16.0/bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz a9e2d7f5ad5962bca8bd742536c80f9d4d5f42cb1b160bf19671907c3507ab1e \
        https://github.com/sharkdp/hexyl/releases/download/v0.9.0/hexyl-v0.9.0-x86_64-unknown-linux-gnu.tar.gz 8d5b505b3ae1f65a236e907e39ede6b4287661b0cf39443a51304272a58e8139 \
        https://github.com/sharkdp/hyperfine/releases/download/v1.11.0/hyperfine-v1.11.0-x86_64-unknown-linux-gnu.tar.gz e3ad877029778b1f82651fa2e2285a6a32e446f2ca2cf11e8b6979f83843cb9d

COPY .gitconfig /root

RUN cp /root/.zshrc /etc/zsh/zshrc \
    && echo '[ ! -f "/home/$USER/.gitconfig" ] && ln -s /root/.gitconfig /home/$USER/' >> /etc/zsh/zshrc \
    && echo '[ ! -f "/home/$USER/.vimrc" ] && ln -s /root/.vimrc /home/$USER' >> /etc/zsh/zshrc \ \
    && echo '[ ! -d "/home/$USER/.vim" ] && ln -s /root/.vim /home/$USER' >> /etc/zsh/zshrc

RUN mkdir -p /src
WORKDIR /src

CMD /bin/zsh
