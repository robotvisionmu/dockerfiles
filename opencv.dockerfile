FROM opencv:4.5.3-prebuild

ARG OPENCV_ROOT=/opt/opencv
ARG OPENCV_BUILD=${OPENCV_HOME}/build
ARG OPENCV_DIST=/usr/local

# build opencv
RUN . .venv/bin/activate && \
  mkdir ${OPENCV_BUILD} && \
  cd ${OPENCV_BUILD} && \
  cmake \
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
  # make -j"${nproc}" && \
  make -j12 && \
  # Install to ${OPENCV_DIST}
  # headers to ${OPENCV_DIST}/include and 
  # libraries to ${OPENCV_DIST}/lib
  make install && \
  ldconfig && \
  # Clean build folder
  cd ${OPENCV_BUILD} && \
  make clean
