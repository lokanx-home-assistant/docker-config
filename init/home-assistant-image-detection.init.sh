#!/bin/sh

echo "#########################################"
echo "#### Initiating container..."
echo "#########################################"
echo ""


echo "####  apt-get update"
apk update

echo "#### Install camera dependencies..."
apk add ffmpeg

echo "#### Install sudo..."
apk add sudo
apk add libffi-dev
apk add python-dev
apk add bluez

echo "#### Install opencv..."
cd /etc/docker-init
apk add --no-cache \
        libwebp \
        ffmpeg-libs \
        libdc1394 \
        zlib \
    && apk add --no-cache --virtual .build-dependencies \
        build-base \
        cmake \
        ncurses \
        linux-headers \
        ffmpeg-dev \
        libwebp-dev \
        libpng-dev \
        zlib-dev \
        libjpeg-turbo-dev \
        tiff-dev \
        libdc1394-dev \
    && export MAKEFLAGS="-j$(nproc)" \
    && rm -rf opencv \
    && git clone --depth 1 -b 4.1.0 https://github.com/opencv/opencv \
    && cd opencv \
    && mkdir -p build \
    && cd build \
    && if [ "${BUILD_ARCH}" != "armhf" ] && [ "${BUILD_ARCH}" != "armv7" ]; then \
            cmake .. -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF \
                -DBUILD_PERF_TESTS=OFF -DBUILD_TESTS=OFF; \
        else \
            cmake .. -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF \
                -DBUILD_PERF_TESTS=OFF -DBUILD_TESTS=OFF \
                -DENABLE_NEON=OFF -DCPU_BASELINE_REQUIRE=""; \
        fi \
    && make -j$(nproc) \
    && make install \
    && apk del .build-dependencies \
    && rm -rf /usr/src/opencv
cd

echo ""
echo "#########################################"
echo "#### Initiating done!"
echo "#########################################"

