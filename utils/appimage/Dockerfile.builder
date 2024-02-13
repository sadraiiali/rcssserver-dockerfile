FROM ubuntu:16.04 AS BUILD_16

COPY . /rcssserver

RUN apt-get clean && apt-get update --allow-insecure-repositories && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install \
    tzdata \
    gcc \
    g++ \
    wget \
    libfl-dev \
    flex \
    bison \
    libboost-all-dev \
    automake \
    make \
    cmake \
    iputils-ping \
    build-essential \
    libtool \
    fuse \
    libfuse-dev \
    zlib1g-dev

RUN cd /rcssserver && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc) && \
    cd ..  

RUN cd /rcssserver && ./utils/appimage/build_appimage.sh

# --------------------------------
FROM ubuntu:20.04 AS BUILD_20

COPY . /rcssserver

RUN apt-get clean && apt-get update --allow-insecure-repositories && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install \
    tzdata \
    gcc \
    g++ \
    wget \
    libfl-dev \
    flex \
    bison \
    libboost-all-dev \
    automake \
    make \
    cmake \
    iputils-ping \
    build-essential \
    libtool \
    fuse \
    libfuse-dev \
    zlib1g-dev

RUN cd /rcssserver && ./utils/appimage/build_code.sh

RUN cd /rcssserver && ./utils/appimage/build_appimage.sh

# --------------------------------
FROM ubuntu:24.04 AS BUILD_24

COPY . /rcssserver

RUN apt-get clean && apt-get update --allow-insecure-repositories && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install \
    tzdata \
    gcc \
    g++ \
    wget \
    libfl-dev \
    flex \
    bison \
    libboost-all-dev \
    automake \
    make \
    cmake \
    iputils-ping \
    build-essential \
    libtool \
    fuse \
    libfuse-dev

RUN cd /rcssserver && ./utils/appimage/build_code.sh

RUN cd /rcssserver && ./utils/appimage/build_appimage.sh

# --------------------------------
FROM ubuntu:24.04

COPY --from=BUILD_16 /rcssserver/rcssserver-x86_64.AppImage /rcssserver-x86_64-1604.AppImage
COPY --from=BUILD_20 /rcssserver/rcssserver-x86_64.AppImage /rcssserver-x86_64-2004.AppImage
COPY --from=BUILD_24 /rcssserver/rcssserver-x86_64.AppImage /rcssserver-x86_64-2404.AppImage