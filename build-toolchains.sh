#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
ANDROID_BUILD_TOP=$TOP
NDK=$TOP/platform/ndk
NDK_LOGFILE=/tmp/ndk-build.log
export NDK NDK_LOGFILE ANDROID_BUILD_TOP
rm -f $NDK_LOGFILE
rm -f $TOP/ndk-prebuilts/*

API_LEVEL=14

export HOST_CFLAGS="-D__NDK_MAJOR__=15 -D__ANDROID_API__=$API_LEVEL -march=armv7-a -mthumb -mfloat-abi=softfp -mfpu=vfpv3-d16 -fPIE"
export HOST_LDFLAGS="-pie -fPIE"

#$ANDROID_NDK/build/tools/make_standalone_toolchain.py --arch arm --api $API_LEVEL --install-dir /tmp/my-android-toolchain --force
export PATH=/tmp/my-android-toolchain/bin:$PATH

$NDK/build/tools/rebuild-all-prebuilt.sh --arch="arm x86" --systems=android-arm --gcc-version-list=4.9 --llvm-version-list= --no-gen-platforms --package-dir=$TOP/ndk-prebuilt $TOP/toolchain/

##$NDK/build/tools/rebuild-all-prebuilt.sh --arch="arm x86" --systems=android-x86 --gcc-version-list=4.9 --llvm-version-list= --package-dir=$TOP/ndk-prebuilt $TOP/toolchain/
