FROM python:py38-cuda11.1-cudnn8-devel-ubuntu20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt update && apt install -y \
  wget curl \
  build-essential cmake unzip pkg-config \
  libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev \
  libavcodec-dev libavformat-dev libswscale-dev libavresample-dev \
  libv4l-dev libxvidcore-dev libx264-dev \
  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
  libgtk-3-dev libgtkglext1-dev libqt5opengl5-dev \
  libtbb-dev libhdf5-dev \
  libva-dev libeigen3-dev \
  libopenblas-dev liblapacke-dev

# Opencv does not find lapacke automatically, include manually
RUN ln -s /usr/include/lapacke.h /usr/include/x86_64-linux-gnu

# Setup env vars
ARG OPENCV_ROOT=/opt/opencv
ENV OPENCV_VERSION=4.5.3
ENV OPENCV_HOME=${OPENCV_ROOT}/opencv-${OPENCV_VERSION}/

# Setup root dir
RUN mkdir ${OPENCV_ROOT}
WORKDIR ${OPENCV_ROOT}

# Setup numpy using poetry, activate env
RUN poetry init \
  --no-interaction \
  --author "Saravanabalagi" \
  --python ">=3.8,<3.11" && \
  poetry add numpy && \
  . .venv/bin/activate

# Download and unzip OpenCV and opencv_contrib and delete zip files
RUN wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip && \
  unzip $OPENCV_VERSION.zip && \
  rm $OPENCV_VERSION.zip
RUN wget https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip && \
  unzip ${OPENCV_VERSION}.zip && \
  rm ${OPENCV_VERSION}.zip
