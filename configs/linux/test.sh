#!/bin/bash
force=false
f=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --force|-f)
        force=true
        shift
        ;;
    esac
done

gtestDir="$PWD/googletest"
gtestBuildDir="$gtestDir/build"
toolchain="$PWD/configs/cmake/linux.cmake"

if [ ! -d "$gtestDir" ]; then
    echo "Downloading and building Google Test Framework"
    git clone https://github.com/google/googletest.git -b v1.14.0 --depth=1
fi

if [ ! -d "$gtestBuildDir" ]; then
    cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE="${toolchain}" -G Ninja -B "${gtestBuildDir}" "${gtestDir}"
    cmake --build "${gtestBuildDir}"
fi

forceMode=""
if $force || $f; then
    forceMode="-f"
fi

TESTING=1; .vscode/build.sh ${forceMode} -d

exe="$PWD/release/test/baseTest"
"$exe" --gtest_color=yes
