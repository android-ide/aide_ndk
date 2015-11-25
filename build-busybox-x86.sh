#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
cd $TOP/busybox
make aide_defconfig
CFLAGS="-m32" LDFLAGS="-m32 --static" make -j 4
