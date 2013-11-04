#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
NDK=$TOP/platform/ndk
NDK_LOGFILE=/tmp/ndk-build.log
export NDK NDK_LOGFILE NUM_JOBS
rm -f $NDK_LOGFILE
$NDK/build/tools/rebuild-all-prebuilt.sh --arch="arm x86" --systems=androidx86static --package-dir=$TOP/ndk-prebuilt $TOP/toolchain-sources/
$NDK/build/tools/rebuild-all-prebuilt.sh --systems=androidarmstatic --arch=arm --package-dir=$TOP/ndk-prebuilt $TOP/toolchain-sources/
