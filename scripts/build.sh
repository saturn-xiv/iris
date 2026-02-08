#!/bin/bash

set -e

source /etc/os-release

export WORKSPACE=$PWD

build_musl() {
    echo "build for $1"    
    local build_root=$WORKSPACE/build/$1
    CC=$1-unknown-linux-musl-gcc CXX=$1-unknown-linux-musl-g++ cmake -DCMAKE_BUILD_TYPE=Release -G Ninja -B $build_root -S $WORKSPACE
    cmake --build $build_root
}

build_musl x86_64
build_musl aarch64

echo "done."
exit 0
