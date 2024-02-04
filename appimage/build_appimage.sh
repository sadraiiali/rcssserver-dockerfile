#!/bin/bash
set -e

wget -c "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage" -O linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
mkdir rcssserver-x86_64

./linuxdeploy-x86_64.AppImage --appdir ./rcssserver-x86_64 \
                                -e ./build/rcssserver \
                                -l ./build/rcss/clang/librcssclangparser.so.18.0.0 \
                                -l ./build/rcss/conf/librcssconfparser.so.18.0.0 \
                                -l ./build/rcss/gzip/librcssgz.so.1.0.0 \
                                -l ./build/rcss/net/librcssnet.so.1.0.0 \
                                -l /usr/lib/libc.so.6 \
                                -l /usr/lib/libz.so.1 \
                                -l /usr/lib/libstdc++.so.6 \
                                -d ./appimage/rcssserver.desktop \
                                -i ./appimage/rcssserver.png \
                                --output appimage 
echo "App Image Created."
mv rcssserver-*AppImage rcssserver-x86_64.AppImage
