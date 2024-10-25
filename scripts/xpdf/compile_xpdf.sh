#!/bin/bash

cd $HOME
mkdir xpdf_example && cd xpdf_example/
sudo apt install build-essential

# Download and untar xpdf
wget https://dl.xpdfreader.com/old/xpdf-3.02.tar.gz
tar -xvzf xpdf-3.02.tar.gz
cd xpdf-3.02/

# Build and install with AFL++ instrumentation
# NOTE: this script uses llvm-config-14 which is the default on Ubuntu
# Check your distro!
export LLVM_CONFIG="llvm-config-14"
CC=$HOME/AFLplusplus/afl-clang-fast CXX=$HOME/AFLplusplus/afl-clang-fast++ ./configure --prefix="$HOME/xpdf_example/install/"
make -j$(nproc)
make install

# Download some input sample
cd $HOME/xpdf_example
mkdir pdf_examples && cd pdf_examples
wget https://github.com/mozilla/pdf.js-sample-files/raw/master/helloworld.pdf
wget http://www.africau.edu/images/default/sample.pdf
wget https://www.melbpc.org.au/wp-content/uploads/2017/10/small-example-pdf-file.pdf
