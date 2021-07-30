FROM alpine:3.14

COPY requirements.txt .
RUN apk update &&\
    apk add --no-cache \
        git \
        gcc \
        musl-dev \
        python3-dev \
        py3-pip &&\
    rm -rf /var/cache/apk/* &&\
    pip3 install -r requirements.txt

CMD cd /src && pre-commit run --all-files && pre-commit uninstall
