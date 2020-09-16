FROM ubuntu:20.04

RUN apt update 
RUN apt install --assume-yes --fix-broken curl git gnupg htop python3 python3-pip vim wget zsh

RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
RUN mv bazel.gpg /etc/apt/trusted.gpg.d/
RUN echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt update
RUN apt install --assume-yes --fix-broken bazel

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/mihaigalos/utils/master/setmeup/setup_oh_my_zsh.sh)"
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/mihaigalos/utils/master/setmeup/setup_vim.sh)"

ENTRYPOINT cd && /bin/zsh
