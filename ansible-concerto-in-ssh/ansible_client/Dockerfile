FROM pad92/ansible-alpine:latest as base

RUN apk update &&\
    apk add \
        bash \
        openssh==8.3_p1-r3 \
        python3 \
        sudo \
        wget \
    && ln -sf python3 /usr/bin/python \
    && python --version
RUN cd $(mktemp -d)\
    && wget https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz \
    && tar -xvf *.tar.xz \
    && mv tmate-2.4.0-static-linux-amd64/tmate /usr/bin/ \
    && chmod +x /usr/bin/tmate

WORKDIR /src
