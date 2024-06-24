#!/bin/bash

force=false
f=false
debug=false
d=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --force|-f)
            force=true
            shift
            ;;
        --debug|-d)
            debug=true
            shift
            ;;
    esac
done

buildDir="$(pwd)/build"
if ( $force || $f ) && [ -d "$buildDir" ]; then
    echo "Removing build directory"
    rm -r "$buildDir"
fi

installDir="$(pwd)/release"

buildType="Release"
if $debug || $d; then
    echo "Building Debug version"
    buildType="Debug"
fi

toolchain="$(pwd)/configs/cmake/linux.cmake"

if [ ! -d "$buildDir" ]; then
    cmake -DCMAKE_BUILD_TYPE="${buildType}" -DCMAKE_TOOLCHAIN_FILE="${toolchain}" -DCMAKE_INSTALL_PREFIX="${installDir}" -G Ninja -B "${buildDir}" .
fi

cmake --build "${buildDir}"
cmake --build "${buildDir}" --target install

exe="$(pwd)/release/main"
"$exe"
