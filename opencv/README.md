<h1 align="center"> OpenCV Docker Files </h1>

<div align="center">

<a> <img src="https://img.shields.io/badge/Python-3.8-blue" alt="Python:3.8" /> </a>
<a> <img src="https://img.shields.io/badge/OpenCV-4.5.3-yellowgreen" alt="OpenCV:4.5.3" /> </a>
<a> <img src="https://img.shields.io/badge/Build-CUDA%20|%20CPU-green" alt="Build:CUDA | CPU" /> </a>

This repo contains [opencv](https://github.com/opencv/opencv) dockerfiles for both CPU and CUDA builds tested to work successfully for [opencv-4.5.3](https://github.com/opencv/opencv/releases/tag/4.5.3) with [opencv-contrib-4.5.3](https://github.com/opencv/opencv_contrib/releases/tag/4.5.3). This should allow beginners to quickly build OpenCV and use it as a dependency for other projects.
  
</div>

## Quick Start

Clone the repo and change directory to the local downloaded copy:

```sh
git clone https://github.com/robotvisionmu/opencv.git
cd opencv

docker build --rm -f "opencv4.5.3-cuda.dockerfile" -t opencv:4.5.3-cuda .    # for CUDA build
docker build --rm -f "opencv4.5.3.dockerfile" -t opencv:4.5.3 .            # for CPU build
```

## Settings

If you want to adjust OpenCV version, you need to change in the following places:

- `OPENCV_VERSION` variable in [dockerfile](opencv4.5.3-cuda.dockerfile#L13)
- Docker tags in
  - The first line `FROM` in [dockerfile](opencv4.5.3-cuda.dockerfile#L1)
  - `.dockerfile` name and `docker build` commands executed in the terminal

Cmake settings should be straightforward to edit in the [cmake](opencv4.5.3-cuda.dockerfile#L58) command:

```sh
cmake 
  -D option1=value1 \
  -D option2=value2 \
  -D option3=value3 \
  ..
```

<details>
<summary> Full Configuration is given here </summary>
<p>

```
-- General configuration for OpenCV 4.5.3 =====================================
--   Version control:               unknown
-- 
--   Extra modules:
--     Location (extra):            /opt/opencv/opencv_contrib-4.5.3/modules
--     Version control (extra):     unknown
-- 
--   Platform:
--     Timestamp:                   2021-08-26T13:42:20Z
--     Host:                        Linux 5.8.0-53-generic x86_64
--     CMake:                       3.16.3
--     CMake generator:             Unix Makefiles
--     CMake build tool:            /usr/bin/make
--     Configuration:               RELEASE
-- 
--   CPU/HW features:
--     Baseline:                    SSE SSE2 SSE3
--       requested:                 SSE3
--     Dispatched code generation:  SSE4_1 SSE4_2 FP16 AVX AVX2 AVX512_SKX
--       requested:                 SSE4_1 SSE4_2 AVX FP16 AVX2 AVX512_SKX
--       SSE4_1 (17 files):         + SSSE3 SSE4_1
--       SSE4_2 (2 files):          + SSSE3 SSE4_1 POPCNT SSE4_2
--       FP16 (1 files):            + SSSE3 SSE4_1 POPCNT SSE4_2 FP16 AVX
--       AVX (5 files):             + SSSE3 SSE4_1 POPCNT SSE4_2 AVX
--       AVX2 (31 files):           + SSSE3 SSE4_1 POPCNT SSE4_2 FP16 FMA3 AVX AVX2
--       AVX512_SKX (7 files):      + SSSE3 SSE4_1 POPCNT SSE4_2 FP16 FMA3 AVX AVX2 AVX_512F AVX512_COMMON AVX512_SKX
-- 
--   C/C++:
--     Built as dynamic libs?:      YES
--     C++ standard:                11
--     C++ Compiler:                /usr/bin/c++  (ver 9.3.0)
--     C++ flags (Release):         -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -fvisibility-inlines-hidden -O3 -DNDEBUG  -DNDEBUG
--     C++ flags (Debug):           -fsigned-char -W -Wall -Werror=return-type -Werror=non-virtual-dtor -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsuggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -fvisibility-inlines-hidden -g  -O0 -DDEBUG -D_DEBUG
--     C Compiler:                  /usr/bin/cc
--     C flags (Release):           -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -O3 -DNDEBUG  -DNDEBUG
--     C flags (Debug):             -fsigned-char -W -Wall -Werror=return-type -Werror=address -Werror=sequence-point -Wformat -Werror=format-security -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wuninitialized -Wno-comment -Wimplicit-fallthrough=3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pthread -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse2 -msse3 -fvisibility=hidden -g  -O0 -DDEBUG -D_DEBUG
--     Linker flags (Release):      -Wl,--exclude-libs,libippicv.a -Wl,--exclude-libs,libippiw.a   -Wl,--gc-sections -Wl,--as-needed  
--     Linker flags (Debug):        -Wl,--exclude-libs,libippicv.a -Wl,--exclude-libs,libippiw.a   -Wl,--gc-sections -Wl,--as-needed  
--     ccache:                      NO
--     Precompiled headers:         NO
--     Extra dependencies:          m pthread /usr/lib/x86_64-linux-gnu/libGL.so /usr/lib/x86_64-linux-gnu/libGLU.so cudart_static dl rt nppc nppial nppicc nppidei nppif nppig nppim nppist nppisu nppitc npps cublas cudnn cufft -L/usr/local/cuda/lib64 -L/usr/lib/x86_64-linux-gnu
--     3rdparty dependencies:
-- 
--   OpenCV modules:
--     To be built:                 alphamat aruco barcode bgsegm bioinspired calib3d ccalib core cudaarithm cudabgsegm cudacodec cudafeatures2d cudafilters cudaimgproc cudalegacy cudaobjdetect cudaoptflow cudastereo cudawarping cudev cvv datasets dnn dnn_objdetect dnn_superres dpm face features2d flann freetype fuzzy gapi hdf hfs highgui img_hash imgcodecs imgproc intensity_transform line_descriptor mcc ml objdetect optflow phase_unwrapping photo plot python3 quality rapid reg rgbd saliency shape stereo stitching structured_light superres surface_matching text tracking ts video videoio videostab wechat_qrcode xfeatures2d ximgproc xobjdetect xphoto
--     Disabled:                    world
--     Disabled by dependency:      -
--     Unavailable:                 java julia matlab ovis python2 sfm viz
--     Applications:                tests perf_tests apps
--     Documentation:               NO
--     Non-free algorithms:         YES
-- 
--   GUI: 
--     QT:                          YES (ver 5.12.8)
--       QT OpenGL support:         YES (Qt5::OpenGL 5.12.8)
--     GTK+:                        YES (ver 3.24.20)
--       GThread :                  YES (ver 2.64.6)
--       GtkGlExt:                  YES (ver 1.2.0)
--     OpenGL support:              YES (/usr/lib/x86_64-linux-gnu/libGL.so /usr/lib/x86_64-linux-gnu/libGLU.so)
--     VTK support:                 NO
-- 
--   Media I/O: 
--     ZLib:                        /usr/lib/x86_64-linux-gnu/libz.so (ver 1.2.11)
--     JPEG:                        /usr/lib/x86_64-linux-gnu/libjpeg.so (ver 80)
--     WEBP:                        /usr/lib/x86_64-linux-gnu/libwebp.so (ver encoder: 0x020e)
--     PNG:                         /usr/lib/x86_64-linux-gnu/libpng.so (ver 1.6.37)
--     TIFF:                        /usr/lib/x86_64-linux-gnu/libtiff.so (ver 42 / 4.1.0)
--     JPEG 2000:                   build (ver 2.4.0)
--     OpenEXR:                     build (ver 2.3.0)
--     HDR:                         YES
--     SUNRASTER:                   YES
--     PXM:                         YES
--     PFM:                         YES
-- 
--   Video I/O:
--     DC1394:                      YES (2.2.5)
--     FFMPEG:                      YES
--       avcodec:                   YES (58.54.100)
--       avformat:                  YES (58.29.100)
--       avutil:                    YES (56.31.100)
--       swscale:                   YES (5.5.100)
--       avresample:                YES (4.0.0)
--     GStreamer:                   YES (1.16.2)
--     v4l/v4l2:                    YES (linux/videodev2.h)
-- 
--   Parallel framework:            TBB (ver 2020.1 interface 11101)
-- 
--   Trace:                         YES (with Intel ITT)
-- 
--   Other third-party libraries:
--     Intel IPP:                   2020.0.0 Gold [2020.0.0]
--            at:                   /opt/opencv/opencv-4.5.3/build/3rdparty/ippicv/ippicv_lnx/icv
--     Intel IPP IW:                sources (2020.0.0)
--               at:                /opt/opencv/opencv-4.5.3/build/3rdparty/ippicv/ippicv_lnx/iw
--     VA:                          YES
--     Lapack:                      YES (/usr/lib/x86_64-linux-gnu/liblapack.so /usr/lib/x86_64-linux-gnu/libcblas.so /usr/lib/x86_64-linux-gnu/libatlas.so)
--     Eigen:                       YES (ver 3.3.7)
--     Custom HAL:                  NO
--     Protobuf:                    build (3.5.1)
-- 
--   NVIDIA CUDA:                   YES (ver 11.1, CUFFT CUBLAS)
--     NVIDIA GPU arch:             52 60 61 70 75 80 86
--     NVIDIA PTX archs:
-- 
--   cuDNN:                         YES (ver 8.0.5)
-- 
--   OpenCL:                        YES (INTELVA)
--     Include path:                /opt/opencv/opencv-4.5.3/3rdparty/include/opencl/1.2
--     Link libraries:              Dynamic load
-- 
--   Python 3:
--     Interpreter:                 /opt/opencv/.venv/bin/python3 (ver 3.8.10)
--     Libraries:                   /usr/lib (ver 3.8.10)
--     numpy:                       /opt/opencv/.venv/lib/python3.8/site-packages/numpy/core/include (ver 1.21.2)
--     install path:                lib/python3.8/site-packages/cv2/python-3.8
-- 
--   Python (for build):            /opt/opencv/.venv/bin/python3
-- 
--   Java:                          
--     ant:                         NO
--     JNI:                         NO
--     Java wrappers:               NO
--     Java tests:                  NO
-- 
--   Install to:                    /usr/local
-- -----------------------------------------------------------------
```

</p>
</details>

## Install to Custom Directory

By default `make install` installs to `/usr/local`. If for whatever reason, you plan to install to a different directory, say to `./opencv`, then

- comment `Clean build folder` section found at the end of dockerfile
- build the image again, it should be near instant with docker layers caching
- once it's finished, execute the following

```sh
mkdir opencv
docker run --rm -it -v $(pwd)/opencv:/opencv opencv:4.5.3-cuda  

# inside docker
# go to build dir, change prefix and make install
cd opencv-4.5.3/build
cmake -D CMAKE_INSTALL_PREFIX=/opencv ..
make install
exit

# outside docker
# files inside will still be associated with user 0 
# i.e. root in host, change ownership recursively if required
sudo chown -R $USER:$USER opencv/
```

This custom installation directory will now contain all necessary files for opencv, 
and further compilation adding this should work 
as long as the dependencies (e.g. libblas, liblapack) are present

## Viewing Images with OpenCV

There is this neat little trick that will allow X11 forwarding to host:

```sh
xhost                  # access control enabled, only authorized clients can connect
xhost +local:          # non-network local connections being added to access control list

export XSOCK=/tmp/.X11-unix
docker run --rm -it -v $XSOCK:$XSOCK -e DISPLAY -v $(pwd):/project opencv:4.5.3-cuda
# cv::imshow("Image", img); will now show a popup
```

