FROM saravanabalagi/python:py38-cuda11.1-cudnn8-nvcc-ubuntu20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && apt install -y \
    build-essential \
    ffmpeg \
    parallel \
    pv \
    jq \
    bc \
    zip \
    unzip \
    unrar \
    curl \
    wget \
    git \
    cmake

# install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt install -y nodejs && \
    npm install -g yarn
