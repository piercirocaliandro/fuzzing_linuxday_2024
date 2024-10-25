#!/bin/bash

cd $HOME
mkdir libexif_example && cd libexif_example/

# Install dependencies
sudo apt-get install autopoint libtool gettext libpopt-dev unzip

# Download what is needed
wget https://github.com/libexif/libexif/archive/refs/tags/libexif-0_6_14-release.tar.gz
tar -xf libexif-0_6_14-release.tar.gz
wget https://github.com/libexif/exif/archive/refs/tags/exif-0_6_15-release.tar.gz
tar -xf exif-0_6_15-release.tar.gz

# Compile and install libexif (needed for exif)
cd $HOME/libexif_example/libexif-libexif-0_6_14-release/
autoreconf -fvi
export LLVM_CONFIG="llvm-config-14"
CC=$HOME/AFLplusplus/afl-clang-lto ./configure --enable-shared=no --prefix="$HOME/libexif_example/install/"
make -j$(nproc)
make install

# Compile and install exif
cd $HOME/libexif_example/exif-exif-0_6_15-release/
autoreconf -fvi
export LLVM_CONFIG="llvm-config-14"
CC=$HOME/AFLplusplus/afl-clang-lto ./configure --enable-shared=no --prefix="$HOME/libexif_example/install/" PKG_CONFIG_PATH=$HOME/libexif_example/install/lib/pkgconfig
make -j$(nproc)
make install

# Grab some interesting inputs
cd $HOME/libexif_example
wget https://github.com/ianare/exif-samples/archive/refs/heads/master.zip
unzip master.zip
