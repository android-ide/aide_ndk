#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
cd $TOP/busybox
$ANDROID_NDK/build/tools/make_standalone_toolchain.py --arch arm --api 14 --install-dir /tmp/my-android-toolchain --force
export PATH=/tmp/my-android-toolchain/bin:$PATH
git clean -fdx
make aide_defconfig
make EXTRA_CFLAGS="-O0 -D__NDK_MAJOR__=15 -Wno-ignored-optimization-argument -Wno-unused-command-line-argument" CROSS_COMPILE=arm-linux-androideabi- CC=arm-linux-androideabi-clang
