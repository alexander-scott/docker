FROM alpine:latest

RUN apk update && \
    apk upgrade

RUN apk add \
    avr-libc \
    bash \
    curl \
    g++ \
    git \
    gcc-avr \
    vim \
    wget \
    zsh 

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i -e 's/ZSH_THEME.*/ZSH_THEME="af-magic-time"/' ~/.zshrc
RUN wget https://gist.githubusercontent.com/mihaigalos/bde132c03ba2ae6a5f4d5c0cfedbcd61/raw/8c3dff083b3141b1ee202d93d2cb4df2aff28d6b/af-magic-time.zsh-theme -O ~/.oh-my-zsh/themes/af-magic-time.zsh-theme

RUN wget https://raw.githubusercontent.com/mihaigalos/utils/master/url-install/url-install.sh
RUN chmod a+x url-install.sh
RUN mv url-install.sh /usr/bin/url-install

COPY . /tmp/demo
RUN cd /tmp/demo && avr-gcc -D __AVR__  -fstack-usage -std=c++14 -mmcu=atmega328p -Os demo_application.cpp -o main.elf && avr-nm --size-sort -C -r --radix=d main.elf
RUN rm -rf /tmp/demo

CMD /bin/zsh

