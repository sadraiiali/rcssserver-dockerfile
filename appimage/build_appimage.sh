#!/bin/bash
set -e
apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata gcc g++ wget libfl-dev flex bison libboost-all-dev automake make cmake iputils-ping build-essential libtool 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib:/lib
ldconfig
find / -name FlexLexer.h

# ./bootstrap 
# ./configure --prefix=$(pwd)/server-bin
# make
# make install

mkdir build
cd build
cmake -DCMAKE_CXX_STANDARD=17 ..
make


wget -c "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage" -O linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
mkdir rcssserver-x86_64

./linuxdeploy-x86_64.AppImage --appdir ./rcssserver-x86_64 \
                                -e ./build/rcssserver \
                                -l ./build/clang/librcssclangparser.so \
                                -l ./build/conf/librcssconfparser.so \
                                -l ./build/gzip/librcssgz.so \
                                -l ./build/net/librcssnet.so \
                                -l /usr/lib/libc.so.6 \
                                -l /usr/lib/libz.so.1 \
                                -l /usr/lib/libstdc++.so.6 \
                                -d ./appimage/rcssserver.desktop \
                                -i ./appimage/rcssserver.png \
                                --output appimage 
echo "App Image Created."
mv rcssserver-*AppImage rcssserver-x86_64.AppImage
