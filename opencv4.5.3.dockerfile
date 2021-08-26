FROM saravanabalagi/python:py38-ubuntu20.04

# install basic necessities
# py38-dev required for Python Headers
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
  python3.8-dev \
  wget curl build-essential \
  cmake unzip pkg-config

# Setup env vars
ARG OPENCV_ROOT=/opt/opencv
ENV OPENCV_VERSION=4.5.3
ENV OPENCV_HOME=${OPENCV_ROOT}/opencv-${OPENCV_VERSION}
ENV OPENCV_BUILD=${OPENCV_HOME}/build
ARG OPENCV_DIST=/usr/local

# Setup root dir
RUN mkdir ${OPENCV_ROOT}
WORKDIR ${OPENCV_ROOT}

# Setup numpy using poetry
RUN poetry init \
  --no-interaction \
  --author "Saravanabalagi" \
  --python ">=3.8,<3.11" && \
  poetry add numpy

# Download and unzip OpenCV and opencv_contrib and delete zip files
RUN wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip && \
  unzip $OPENCV_VERSION.zip && \
  rm $OPENCV_VERSION.zip
RUN wget https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip && \
  unzip ${OPENCV_VERSION}.zip && \
  rm ${OPENCV_VERSION}.zip

# add dependencies after wget to allow docker layers to cache
# audio video
RUN apt update && apt install -y \
  libjpeg-turbo8 libexif-dev libpng-dev libtiff-dev libwebp-dev \
  libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev \
  libavresample-dev libv4l-dev libxvidcore-dev libx264-dev \
  libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
  libva-dev

# linear algebra libs
RUN apt update && apt install -y \
  libeigen3-dev libatlas-base-dev liblapacke-dev

# other dependencies
RUN apt update && apt install -y \
  libgtk-3-dev libgtkglext1-dev libqt5opengl5-dev \
  libtbb-dev libhdf5-dev

# build opencv
RUN . .venv/bin/activate && \
  mkdir ${OPENCV_BUILD} && \
  cd ${OPENCV_BUILD} && \
  cmake \
  -D ENABLE_CXX11=ON \
  -D CMAKE_EXE_LINKER_FLAGS=-lcblas \
  -D CMAKE_SKIP_RPATH=ON \
  -D PYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")  \
  -D PYTHON_LIBRARY=$(python -c "import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var('LIBDIR'))") \
  -D BUILD_NEW_PYTHON_SUPPORT=ON \
  -D OpenGL_GL_PREFERENCE=LEGACY \
  -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=${OPENCV_DIST} \
  -D INSTALL_PYTHON_EXAMPLES=OFF \
  -D INSTALL_C_EXAMPLES=OFF \
  -D BUILD_EXAMPLES=OFF \
  -D OPENCV_ENABLE_NONFREE=ON \
  -D OPENCV_EXTRA_MODULES_PATH=${OPENCV_ROOT}/opencv_contrib-${OPENCV_VERSION}/modules \
  -D WITH_OPENGL=ON \
  -D WITH_QT=ON \
  -D WITH_EIGEN=ON \
  -D WITH_LAPACK=ON \
  -D WITH_VA_INTEL=ON \
  -D WITH_TBB=ON \
  ..

# Make
RUN cd ${OPENCV_BUILD} && \
  make -j15 && \
  # Install to ${OPENCV_DIST}
  # headers to ${OPENCV_DIST}/include and 
  # libraries to ${OPENCV_DIST}/lib
  make install && \
  ldconfig

# Don't clean if you plan to install to a custom dir
# Clean build folder
# RUN cd ${OPENCV_BUILD} && \
#   make clean

CMD echo "OpenCV ${OPENCV_VERSION} (${OPENCV_DIST})"
