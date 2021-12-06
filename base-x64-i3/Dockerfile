FROM ghcr.io/mihaigalos/base-x64:0.0.4

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --yes --fix-broken \
        git \
        gsettings-desktop-schemas \
        i3 \
        i3status \
        net-tools \
        openbox \
        procps \
        python3 \
        rxvt-unicode \
        supervisor \
        x11vnc \
        xorg \
        xvfb \
        xterm

RUN apt-get remove -y \
        terminator
RUN echo 'xterm*background: black' >> ~/.Xresources \
    && echo 'xterm*foreground: lightgray' >> ~/.Xresources \
    && echo 'xterm*faceName: monospace:pixelsize=12' >> ~/.Xresources \
    && echo 'xrdb ~/.Xresources' >> /etc/zsh/zshrc

WORKDIR /usr/share/
RUN git clone --depth 1 https://github.com/kanaka/noVNC \
    && cd noVNC \
	&& ln -s vnc.html index.html

COPY supervisord.conf /etc/

EXPOSE 6080

CMD ["/usr/bin/supervisord"]
