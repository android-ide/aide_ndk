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

$NDK/build/tools/rebuild-all-prebuilt.sh --arch="arm x86" --systems=androidx86static --gcc-version-list=4.9 --llvm-version-list= --package-dir=$TOP/ndk-prebuilt $TOP/toolchain/

$NDK/build/tools/rebuild-all-prebuilt.sh --arch="arm x86" --systems=androidarmstatic --gcc-version-list=4.9 --llvm-version-list= --no-gen-platforms --package-dir=$TOP/ndk-prebuilt $TOP/toolchain/
