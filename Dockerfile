FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt update
RUN apt -y dist-upgrade
RUN apt -y install \
  bc \
  bison \
  build-essential \
  curl \
  flex \
  git \
  libssl-dev \
  python \
  python3 \
  python3-pip \
  wget \
  zip

RUN pip3 install gdown

RUN gdown -O /var/tmp/toolchain.tar.gz --id 1yr16nmxu9Yb_o-CpHM_3pDkdNfueEfOe && \
  mkdir -p /opt/toolchain && \
  tar -xvpf /var/tmp/toolchain.tar.gz -C /opt/toolchain && \
  rm -f /var/tmp/toolchain.tar.gz
