#!/bin/bash

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
NDK=$TOP/platform/ndk
NDK_LOGFILE=/tmp/ndk-build.log
export NDK NDK_LOGFILE NUM_JOBS
rm $NDK_LOGFILE
$NDK/build/tools/rebuild-all-prebuilt.sh --arch=arm --systems=linux-x86 --package-dir=$TOP/ndk-prebuilt ~/ndk-develop/toolchain-sources/
$NDK/build/tools/rebuild-all-prebuilt.sh --systems=armstatic --arch=arm --package-dir=$TOP/ndk-prebuilt ~/ndk-develop/toolchain-sources/
