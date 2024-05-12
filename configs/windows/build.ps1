param(
    [switch]$force,
    [switch]$f,
    [switch]$debug,
    [switch]$d
)

$buildDir = "$pwd/build"
if (($force -or $f) -and (Test-Path -Path $buildDir)) {
    write-host "Removing build directory"
    rm -r $buildDir -force
}
$installDir = "$pwd/release"

$buildType = "Release"
if ($debug -or $d) {
    write-host "Building Debug version"
    $buildType = "Debug"
}

$toolchain = "$pwd/configs/cmake/win64.cmake"

if (!(Test-Path -Path $buildDir)) {
    cmake -DCMAKE_BUILD_TYPE="${buildType}" -DCMAKE_TOOLCHAIN_FILE="${toolchain}" -DCMAKE_INSTALL_PREFIX="${installDir}" -G Ninja -B "${buildDir}" .
}

cmake --build "${buildDir}"
cmake --build "${buildDir}" --target install

$exe = "$pwd/release/main.exe"
& "${exe}"
