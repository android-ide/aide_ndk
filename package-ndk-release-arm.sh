#!/bin/bash

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
NDK=$TOP/platform/ndk
NDK_LOGFILE=/tmp/ndk-build.log
export NDK NDK_LOGFILE NUM_JOBS
rm $NDK_LOGFILE
$NDK/build/tools/package-release.sh --prebuilt-dir=$TOP/ndk-prebuilt --release=aide --systems=linux-x86 --arch=x86 --toolchains=x86-4.6 --out-dir=$TOP/ndk-release
$NDK/build/tools/package-release.sh --prebuilt-dir=$TOP/ndk-prebuilt --release=aide --systems=linux-arm --arch=arm --toolchains=arm-linux-androideabi-4.6 --out-dir=$TOP/ndk-release
