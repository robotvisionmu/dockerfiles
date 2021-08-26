FROM ubuntu:20.04

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
ENV PATH="${PATH}:/root/.local/bin"
RUN poetry config virtualenvs.in-project true

# print python and poetry version on interactive start
CMD echo $(python --version) "($(which python))" && \
  echo $(poetry --version) "($(which poetry))" && \
  echo "" && \
  /bin/bash
