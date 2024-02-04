#!/bin/bash
set -e

wget -c "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage" -O linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
mkdir rcssserver-x86_64

# find libc and libstdc++ libz dependencies
LIBC_PATH=$(ldd ./build/rcssserver | grep libc.so | awk '{ print $3 }')
LIBSTDCPP_PATH=$(ldd ./build/rcssserver | grep libstdc++ | awk '{ print $3 }')
LIBZ_PATH=$(ldd ./build/rcssserver | grep libz.so | awk '{ print $3 }')

./linuxdeploy-x86_64.AppImage --appdir ./rcssserver-x86_64 \
                                -e ./build/rcssserver \
                                -l ./build/rcss/clang/librcssclangparser.so.18.0.0 \
                                -l ./build/rcss/conf/librcssconfparser.so.18.0.0 \
                                -l ./build/rcss/gzip/librcssgz.so.1.0.0 \
                                -l ./build/rcss/net/librcssnet.so.1.0.1 \
                                -l $LIBC_PATH \
                                -l $LIBSTDCPP_PATH \
                                -l $LIBZ_PATH \
                                -d ./appimage/rcssserver.desktop \
                                -i ./appimage/rcssserver.png \
                                --output appimage 
echo "App Image Created."
