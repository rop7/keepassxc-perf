#!/bin/bash

sudo rm -rf build

mkdir build

cd build 

export CXXFLAGS="-fprofile-generate"
export LDFLAGS="-fprofile-generate"

cmake -DCMAKE_BUILD_TYPE=Release -DWITH_XC_ALL=ON -GNinja .. --fresh
ninja -j8;

./src/keepassxc

export CXXFLAGS="-fprofile-use -fprofile-correction"
export LDFLAGS="-fprofile-use"

ninja clean
ninja -j8

exit 0;