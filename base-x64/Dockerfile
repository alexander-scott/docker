FROM debian:bookworm-slim

ARG GIT_COMMIT

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
        tree \
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

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
    && ~/.fzf/install

RUN wget https://raw.githubusercontent.com/mihaigalos/utils/master/url-install/url-install.sh \
    && chmod a+x url-install.sh \
    && mv url-install.sh /usr/bin/url-install \
    && mkdir -p ~/.local/bin \
    && PATH=~/.local/bin:$PATH

RUN url-install \
        https://github.com/Byron/dua-cli/releases/download/v2.10.2/dua-v2.10.2-x86_64-unknown-linux-musl.tar.gz 16c241b0446b2b8ae8851f3facacd7604fe4193b2c0a545ae07652300f63a1e8  \
        https://github.com/XAMPPRocky/tokei/releases/download/v12.0.4/tokei-x86_64-unknown-linux-gnu.tar.gz 0e0f0d7139c8c7e3ff20cb243e94bc5993517d88e8be8d59129730607d5c631b  \
        https://github.com/beefsack/webify/releases/download/v1.5.0/webify-v1.5.0-linux-amd64.tar.gz acbbe41d4f90044d57e4ebea746344b8632cb54a195a958c2e26cb58742d5403  \
        https://github.com/casey/just/releases/download/0.10.2/just-0.10.2-x86_64-unknown-linux-musl.tar.gz 280a6edf58076e90d2002b44d38f93dcd708209c446dbcc38344ed6d21a8aaf7 \
        https://github.com/dandavison/delta/releases/download/0.4.4/delta-0.4.4-x86_64-unknown-linux-gnu.tar.gz 495a64a2fb6c46a19f10606785fea3267d392cebf4987841856b111f195a6f01  \
        https://github.com/imsnif/bandwhich/releases/download/0.20.0/bandwhich-v0.20.0-x86_64-unknown-linux-musl.tar.gz 73416b50baa34d9c3d56958655a789b4697f4f09e6f7ae0e079eb742cce7837b  \
        https://github.com/mgdm/htmlq/releases/download/v0.3.0/htmlq-x86_64-linux.tar.gz cfd8a871b8f3c3921c8b4c943806704cf058af1691248cce382885e8f8ce025f \
        https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip 53d8746b1ca2d945c5b75767edc83addfd1fe3c4a2b0b766c07172473330a50b  \
        https://github.com/rhysd/hgrep/releases/download/v0.1.7/hgrep-v0.1.7-x86_64-unknown-linux-gnu.zip aeb6f20a7b621454ff137108b935559fc4974e7167279531aac83b8fe6decd3f  \
        https://github.com/sachaos/viddy/releases/download/v0.3.2/viddy_0.3.2_Linux_x86_64.tar.gz a11e950b91def821b3f62cdc55036c3e6eaf5bdf0b01cf8ecc6a1c1195cd331c \
        https://github.com/sharkdp/bat/releases/download/v0.16.0/bat-v0.16.0-x86_64-unknown-linux-gnu.tar.gz a9e2d7f5ad5962bca8bd742536c80f9d4d5f42cb1b160bf19671907c3507ab1e \
        https://github.com/sharkdp/hexyl/releases/download/v0.9.0/hexyl-v0.9.0-x86_64-unknown-linux-gnu.tar.gz 8d5b505b3ae1f65a236e907e39ede6b4287661b0cf39443a51304272a58e8139 \
        https://github.com/sharkdp/hyperfine/releases/download/v1.11.0/hyperfine-v1.11.0-x86_64-unknown-linux-gnu.tar.gz e3ad877029778b1f82651fa2e2285a6a32e446f2ca2cf11e8b6979f83843cb9d

RUN url-install --install_all \
        https://github.com/mihaigalos/tmux-thumbs/releases/download/0.6.0/tmux-thumbs-v0.6.0-x86_64-unknown-linux-gnu.tar.gz 3fcd8c0fe22c812c0a7c36ce04cd02b1f40672c4d371c6878d83b176a334676e

RUN git clone --depth 1 -b 0.6.0 https://github.com/fcsonline/tmux-thumbs.git ~/.tmux/plugins/tmux-thumbs 2>/dev/null

RUN mkdir -p /sources_base_x64
COPY Dockerfile Justfile /sources_base_x64/
RUN echo ${GIT_COMMIT} > /sources_base_x64/git_commit.log

RUN cp /root/.zshrc /etc/zsh/zshrc \
    && echo '[ ! -d "/home/$USER/.tmux" ] && ln -s /root/.tmux /home/$USER' >> /etc/zsh/zshrc \
    && echo '[ ! -d "/home/$USER/.vim" ] && ln -s /root/.vim /home/$USER' >> /etc/zsh/zshrc \
    && echo '[ ! -f "/home/$USER/.gitconfig" ] && ln -s /root/.gitconfig /home/$USER/' >> /etc/zsh/zshrc \
    && echo '[ ! -f "/home/$USER/.vimrc" ] && ln -s /root/.vimrc /home/$USER' >> /etc/zsh/zshrc \
    && echo 'export PATH=/root/.local/bin:$PATH' >> /etc/zsh/zshrc \
    && echo 'export DISABLE_AUTO_UPDATE=true' >> /etc/zsh/zshrc

RUN rm -rf /tmp/tmp.

RUN mkdir -p /src
WORKDIR /src

CMD /bin/zsh -c "source /etc/zsh/zshrc && zsh"
