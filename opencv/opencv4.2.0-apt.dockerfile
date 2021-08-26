FROM saravanabalagi/dev:ubuntu20.04-py38-node14

RUN apt update && \
    apt install -y libopencv-dev
