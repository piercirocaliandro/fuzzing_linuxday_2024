#!/bin/bash

rm -r $HOME/xpdf_example/install
cd $HOME/xpdf_example/xpdf-3.02/
make clean
CFLAGS="-g -O0" CXXFLAGS="-g -O0" ./configure --prefix="$HOME/xpdf_example/install/"
make -j$(nproc)
make install
