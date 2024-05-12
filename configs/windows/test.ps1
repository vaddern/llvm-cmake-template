param(
    [switch]$force,
    [switch]$f
)

$gtestDir = "$pwd/googletest"
$gtestBuildDir = "$gtestDir/build"
$toolchain = "$pwd/configs/cmake/win64.cmake"

if (!(Test-Path -Path $gtestDir)) {
    write-host "Downloading and building Google Test Framework"
    git clone https://github.com/google/googletest.git -b v1.14.0 --depth=1
}

if (!(Test-Path -Path $gtestBuildDir)) {
    cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_TOOLCHAIN_FILE="${toolchain}" -G Ninja -B "${gtestBuildDir}" "${gtestDir}"
    cmake --build "${gtestBuildDir}"
}

$forceMode = ($force -or $f) ? "-f" : ""
$TESTING=1; iex ".vscode/build.ps1 ${forceMode} -d"

$exe = "$pwd/release/test/baseTest.exe"
& "${exe}" --gtest_color=yes
