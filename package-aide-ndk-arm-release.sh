#!/bin/bash
set -e
SCRIPTDIR=$(dirname $0)
TOP=$(cd $SCRIPTDIR; pwd)
RELEASE=`date +%Y%m%d`
rm -rf $TOP/ndk-aide-release/tmp
mkdir -p $TOP/ndk-aide-release/tmp
cd $TOP/ndk-aide-release/tmp
tar xjf  $TOP/ndk-release/android-ndk-aide-linux-arm.tar.bz2
#rm -rf $TOP/ndk-aide-prebuilt/tmp
rm -rf android-ndk-aide/{samples,docs,tests}
tar cjf $TOP/ndk-aide-release/android-ndk-aide-linux-arm-$RELEASE.tar.bz2 android-ndk-aide/

#$NDK/build/tools/package-release.sh --prebuilt-dir=$TOP/ndk-prebuilt --release=aide --systems=linux-arm --arch=arm --out-dir=$TOP/ndk-release
