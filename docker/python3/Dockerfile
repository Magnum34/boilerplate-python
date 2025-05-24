FROM ubuntu:24.04

LABEL maintainer="Mariusz Milewczyk <mariusz@magnumit.dev>"


ENV TZ=Europe/Warsaw

RUN apt-get update && apt-get install -y  curl \
    p7zip \
    ca-certificates \
    libfontconfig1 \
    m4 \
    make \
    man \
    nano \
    nload \
    neovim \
    htop \
    texlive-latex-recommended \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \ 
    libreadline-dev \
    libffi-dev \
    unzip \
    valgrind \
    squashfs-tools \
    telnet \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/* && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

RUN wget https://www.python.org/ftp/python/3.12.8/Python-3.12.8.tgz && tar -xf Python-3.12.8.tgz && cd Python-3.12.8 && \
    ./configure --enable-optimizations && make install

RUN python3 --version

WORKDIR /app
CMD ['python3']

