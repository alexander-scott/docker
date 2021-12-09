FROM docker.pkg.github.com/mihaigalos/docker/base-x64

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
        software-properties-common \
        supervisor \
        x11vnc \
        xorg \
        xvfb \
        xterm

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F \
    && apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu bionic main" \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --yes --fix-broken \
        firefox

RUN apt-get remove -y \
        terminator

COPY .Xresources x_config.sh /root/

WORKDIR /usr/share/
RUN git clone --depth 1 https://github.com/kanaka/noVNC \
    && cd noVNC \
	&& ln -s vnc.html index.html

RUN mkdir -p ~/.config/i3 \
    && curl https://raw.githubusercontent.com/mihaigalos/config/master/i3_config -o ~/.config/i3/config \
    && sed -i \
        -e "s/Mod4/Mod1/" \
        -e "s/.*i3status-provider.*//" \
        -e "s/\(.*\)#status_command\(.*\)/\1status_command\2/" \
        ~/.config/i3/config \
    && curl https://raw.githubusercontent.com/mihaigalos/config/master/i3status.conf -o /etc/i3status.conf

COPY supervisord.conf /etc/

EXPOSE 6080

WORKDIR /src
CMD ["/usr/bin/supervisord"]
