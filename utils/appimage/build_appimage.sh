#!/bin/bash
set -e

wget -c "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage" -O linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
mkdir rcssserver-x86_64

BUILD_PWD='/rcssserver/build'


# find libc and libstdc++ libz dependencies
LIBSTDCPP_PATH=$(ldd $BUILD_PWD/rcssserver | grep libstdc++ | awk '{ print $3 }')
LIBZ_PATH=$(ldd $BUILD_PWD/rcssserver | grep libz.so | awk '{ print $3 }')
LIBRCSSCLANGPARSER_PATH=$(ldd $BUILD_PWD/rcssserver | grep librcssclangparser.so | awk '{ print $3 }')
LIBRCSSCONFPARSER_PATH=$(ldd $BUILD_PWD/rcssserver | grep librcssconfparser.so | awk '{ print $3 }')
LIBRCSSGZ_PATH=$(ldd $BUILD_PWD/rcssserver | grep librcssgz.so | awk '{ print $3 }')
LIBRCSSNET_PATH=$(ldd $BUILD_PWD/rcssserver | grep librcssnet.so | awk '{ print $3 }')

tree /rcssserver

./linuxdeploy-x86_64.AppImage --appdir ./rcssserver-x86_64 \
                                -e $BUILD_PWD/rcssserver \
                                -l $LIBRCSSCLANGPARSER_PATH \
                                -l $LIBRCSSCONFPARSER_PATH \
                                -l $LIBRCSSGZ_PATH \
                                -l $LIBRCSSNET_PATH \
                                -l $LIBSTDCPP_PATH \
                                -l $LIBZ_PATH \
                                -d ./appimage/rcssserver.desktop \
                                -i ./appimage/rcssserver.png \
                                --output appimage 
echo "App Image Created."
