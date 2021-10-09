FROM docker.pkg.github.com/mihaigalos/docker/base-x64

RUN apt-get update

RUN apt install --assume-yes --fix-broken \
    avr-libc \
    bash \
    curl \
    g++ \
    git \
    gcc-avr \
    sudo \
    vim \
    wget \
    zsh 

COPY barebones /tmp/demo/barebones
RUN cd /tmp/demo/barebones && avr-gcc -D __AVR__  -fstack-usage -std=c++14 -mmcu=atmega328p -Os demo_application.cpp -o main.elf && avr-nm --size-sort -C -r --radix=d main.elf
RUN rm -rf /tmp/demo


RUN wget https://github.com/bazelbuild/bazelisk/releases/download/v1.7.4/bazelisk-linux-amd64 -O /usr/bin/bazelisk
RUN chmod a+x /usr/bin/bazelisk
RUN ln -s /usr/bin/bazelisk /usr/bin/bazel
RUN bazel version

COPY bazelized /src
RUN cd /src && bazel build //...
RUN cd /src && bazel build --config=328p --verbose_failures --color=yes 2>&1 //:uartboot_hex
RUN rm -rf /src

CMD /bin/zsh

