#!/bin/bash

set -e

SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
API_LEVEL=14

case "$1" in
	arm)
		ARCH=arm
		ARCH_CROSS_COMPILE_PREFIX=arm-linux-androideabi-
		ARCH_CFLAGS="-march=armv7-a -mthumb -mfloat-abi=softfp -mfpu=vfpv3-d16"
		ARCH_LDFLAGS="-march=armv7-a -Wl,--fix-cortex-a8"
		;;
	x86)
		ARCH=x86
		ARCH_CROSS_COMPILE_PREFIX=i686-linux-android-
		ARCH_CFLAGS=
		ARCH_LDFLAGS=
		;;
	*)
		echo "First argument must be arm or x86."
		exit
		;;
esac
$ANDROID_NDK/build/tools/make_standalone_toolchain.py --arch $ARCH --api $API_LEVEL --install-dir /tmp/my-android-toolchain --force
cd $TOP/busybox
export PATH=/tmp/my-android-toolchain/bin:$PATH
git clean -fdx
make aide_defconfig
make EXTRA_CFLAGS="-D__NDK_MAJOR__=15 -D__ANDROID_API__=$API_LEVEL $ARCH_CFLAGS" EXTRA_LDFLAGS="$ARCH_LDFLAGS" CROSS_COMPILE="$ARCH_CROSS_COMPILE_PREFIX"
