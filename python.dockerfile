FROM nvidia/cuda:11.1-cudnn8-devel-ubuntu20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt update && \
  apt install -y \
    git \
    curl \
    python3.8 \
    python3.8-distutils \
    python3-virtualenv

# python symlinks
RUN ln -sf /usr/bin/python3.8 /usr/bin/python3 && \
  ln -sf /usr/bin/python3 /usr/bin/python && \
  python --version

# poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
ENV PATH="/root/.local/bin:$PATH"
RUN poetry config virtualenvs.in-project true
