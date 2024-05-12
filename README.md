# llvm-cmake-template
* C and C++ project template with CMake, LLVM, GTest
* Works on Windows (without Visual Studio requirement) and Unix (Linux and MacOS)
* Contains example of base application, linked library and tests
* Allows to debug components and generate release files.

# prepare
Windows:
```powershell
# powershell
winget install -e --id MSYS2.MSYS2
& C:\msys64\usr\bin\pacman -S mingw-w64-x86_64-ninja mingw-w64-x86_64-cmake mingw-w64-x86_64-clang mingw-w64-x86_64-lld mingw-w64-x86_64-ccache mingw-w64-x86_64-gdb-multiarch
# (optional) python: https://github.com/vaddern/setup?tab=readme-ov-file#python

notepad $profile # open in text editor
# update your path: add "C:\msys64\mingw64\bin;" to $PATH
$env:PATH = "C:\msys64\mingw64\bin;" + $env:PATH
. $profile # restart shell
```
Linux (Debian based):
```bash
# todo
```

# config
Windows:
```powershell
# powershell
# enable developer mode first! windows search: developer settings
# or do this as admin:
cmd /c mklink /D .vscode configs\windows
```
Unix:
```bash
# todo
```

# build and run
```shell
# release: results will be in "release" directory
.vscode/build.ps1 # Unix case: .sh

# debug ver without optimizations
.vscode/build.ps1 -f -d

# test
.vscode/test.ps1

# notes
# "-f": clean build directory first
```
VSCode:
* Build and run: `Ctrl+Shift+B`
* Debug: `F5` or select config manually
* Test: select config manually
* [Read more about my configuration.](https://github.com/vaddern/setup?tab=readme-ov-file#vscode)
