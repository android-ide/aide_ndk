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
for toolchain in android-ndk-aide/toolchains/*
do
  if [ "${toolchain}" != "android-ndk-aide/toolchains/arm-linux-androideabi-4.6" ]
  then
    rm -r ${toolchain}
  fi
done
tar cjf $TOP/ndk-aide-release/android-ndk-aide-linux-arm-$RELEASE.tar.bz2 android-ndk-aide/
cp $TOP/busybox/busybox $TOP/ndk-aide-release/busybox-arm-$RELEASE
cp $TOP/ndkinstall.sh $TOP/ndk-aide-release/ndkinstall.sh-$RELEASE
