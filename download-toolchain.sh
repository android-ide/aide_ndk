#!/bin/bash

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
NDK=$TOP/platform/ndk
NDK_LOGFILE=/tmp/ndk-build.log
export NDK NDK_LOGFILE
mkdir $TOP/toolchain-sources
$NDK/build/tools/download-toolchain-sources.sh $TOP/toolchain-sources
