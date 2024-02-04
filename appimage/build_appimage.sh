#!/bin/bash
set -e
sudo apt-get update && sudo apt-get install -y tzdata sudo gcc g++ wget flex bison libboost-all-dev automake make cmake iputils-ping
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib:/lib

./bootstrap
./configure --prefix=$(pwd)/server-bin
make
make install

wget -c "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage" -O linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy-x86_64.AppImage
mkdir rcssserver-x86_64

./linuxdeploy-x86_64.AppImage --appdir ./rcssserver-x86_64 \
                                -e ./server-bin/bin/rcssserver \
                                -l ./server-bin/lib/librcssclangparser.so \
                                -l ./server-bin/lib/librcssconfparser.so \
                                -l ./server-bin/lib/librcssgz.so \
                                -l ./server-bin/lib/librcssnet.so \
                                -d ./appimage/rcssserver.desktop \
                                -i ./appimage/rcssserver.png \
                                --output appimage 
echo "App Image Created."
mv rcssserver-*AppImage rcssserver-x86_64.AppImage
