#!/usr/bin/env bash

set -u

if [[ ! -d libdivsufsort ]]; then
    git clone https://github.com/y-256/libdivsufsort.git
    cd libdivsufsort
    cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"
    make
fi

if [[ ! -d caps_sa ]]; then
    git clone https://github.com/jamshed/CaPS-SA.git caps_sa
    cd caps_sa
    [[ ! -d build ]] && mkdir build 
    cd build/
    cmake -DCMAKE_INSTALL_PREFIX=../ ..
    make
fi

#[[ ! -f libsais-2.8.6.tgz ]] && wget -O libsais-2.8.6.tgz https://github.com/IlyaGrebnov/libsais/archive/refs/tags/v2.8.6.tar.gz
#if [[ ! -d libsais-2.8.6 ]]; then
#    tar xvf libsais-2.8.6.tgz
#    cd libsais-2.8.6
#    cmake -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"
#    make install
#fi
