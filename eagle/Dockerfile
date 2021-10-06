FROM ubuntu:14.04
RUN apt-get -y update

RUN apt-get install -y \
    gcc-multilib \
    libcups2 \
    libfontconfig1 \
    libpthread-stubs0-dev \
    libssl-dev \
    libssl1.0.0 \
    libXcursor1 \
    libXi6 \
    libXrandr2 \
    libXrender1 \
    libz1 \
    wget \
    xvfb \
    xdotool \
    zsh 

RUN wget ftp://ftp.cadsoft.de/eagle/program/7.7/eagle-lin64-7.7.0.run
RUN chmod +x $PWD/eagle-lin64-7.7.0.run
RUN $PWD/eagle-lin64-7.7.0.run /opt
RUN cd $(mktemp -d) \
    && wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz \
    && tar -xvf *.tar.xz \
    && mv tmate-2.4.0-static-linux-amd64/tmate /usr/bin/ \
    && chmod +x /usr/bin/tmate
ENV EAGLE /opt/eagle-7.7.0/bin/eagle

COPY .eaglerc /root

ENV DISPLAY :99

ADD xvfb_init /etc/init.d/xvfb 
RUN chmod a+x /etc/init.d/xvfb

# Example usage:
# export DISPLAY=:99; Xvfb $DISPLAY -pixdepths 32 -screen 0 1280x1024x24 >/dev/null 2>&1 &
# /opt/eagle-7.7.0/bin/eagle & sleep 3; setxkbmap us; sleep 1; xdotool key Tab; xdotool key KP_Enter; sleep 1; xdotool key alt+f o; sleep 1;xdotool type "/src/dotcast_uart.sch"; sleep 1; xdotool key KP_Enter; sleep 1; xdotool key KP_Enter; sleep 1; xdotool type "print file /src/dotcast_uart.sch.pdf paper A4 sheets ALL landscape";sleep 1; xdotool key KP_Enter; sleep 1; xdotool key KP_Enter; sleep 1; xdotool type "quit"; sleep 1; xdotool key KP_Enter
