FROM alpine:3.14

RUN apk update
RUN apk add --no-cache \
    git \
    gcc \
    musl-dev \
    python3-dev \
    py3-pip

COPY requirements.txt .
RUN pip3 install -r requirements.txt

CMD cd /src && pre-commit run --all-files && pre-commit uninstall
