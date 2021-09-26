FROM pad92/ansible-alpine:latest as base

RUN apk update &&\
    apk add \
    bash \
    openssh \
    sudo

WORKDIR /src
