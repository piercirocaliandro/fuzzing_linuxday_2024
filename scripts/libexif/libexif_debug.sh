#!/bin/bash

rm -r $HOME/libexif_example/install
cd $HOME/libexif_example/libexif-libexif-0_6_14-release/
make clean
CFLAGS="-g -O0" CXXFLAGS="-g -O0" ./configure --enable-shared=no --prefix="$HOME/libexif_example/install/"
make -j$(nproc)
make install

cd $HOME/libexif_example/exif-exif-0_6_15-release/
make clean
CFLAGS="-g -O0" CXXFLAGS="-g -O0" ./configure --enable-shared=no --prefix="$HOME/libexif_example/install/" PKG_CONFIG_PATH=$HOME/libexif_example/install/lib/pkgconfig
make -j$(nproc)
make install
