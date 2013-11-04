#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
NDK=$TOP/platform/ndk
NDK_LOGFILE=/tmp/ndk-build.log
export NDK NDK_LOGFILE
mkdir -p $TOP/toolchain-sources
$NDK/build/tools/download-toolchain-sources.sh --git-date=2013-04-10 $TOP/toolchain-sources
