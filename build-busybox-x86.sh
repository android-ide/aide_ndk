#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
cd $TOP/busybox
make aide_defconfig
LDFLAGS="--static" make -j 4
