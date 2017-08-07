#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
cd $TOP/busybox
$ANDROID_NDK/build/tools/make_standalone_toolchain.py --arch x86 --api 14 --install-dir /tmp/my-android-toolchain --force
export PATH=/tmp/my-android-toolchain/bin:$PATH
git clean -fdx
make aide_defconfig
make EXTRA_CFLAGS="-DFAST_FUNC= -D__NDK_MAJOR__=15 -Wno-ignored-optimization-argument -Wno-unused-command-line-argument" CROSS_COMPILE=i686-linux-android- CC=i686-linux-android-clang
